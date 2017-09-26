Promise = require 'promiz'
PortalGun = require 'portal-gun'

TRUSTED_DOMAIN = (process.env.TRUSTED_DOMAIN or 'starfi.re')
TWEET_LENGTH = 140
VERSION = 'v0.0.1'

config = new Promise (@resolve, @reject) => null
portal = new PortalGun {
  trusted: TRUSTED_DOMAIN, useSw: false
}
initHasBeenCalled = false

Starfire = (method, params, cb = -> null) ->
  if typeof params is 'function'
    cb = params
    params = []

  # Normalize params to an array if passed an object
  if params? and Object::toString.call(params) is '[object Object]'
    params = [params]

  if params? and Object::toString.call(params) isnt '[object Array]'
    return cb new Error 'Params must be an array'

  methodRoot = method.split('.')[0]
  method = method.slice method.indexOf('.') + 1

  methods[methodRoot].apply 0, [method, params, cb]

methods = {
  version: (_, __, cb) ->
    cb null, VERSION

  init: (method, [options], cb) ->
    appId = options.appId
    debug = Boolean options.debug

    portal.listen()

    unless typeof appId is 'string' and /^[a-z0-9-]+$/.test appId
      return cb new Error 'Missing or invalid appId'

    initHasBeenCalled = true

    portal.call 'auth.getStatus', {appId}
    .then (status) ->
      # TODO: Token may be invalid
      config.resolve
        appId: appId
        accessToken: status?.accessToken
    .catch ->
      config.resolve
        appId: appId
        accessToken: null
    .then (x) ->
      cb null, x
    .catch cb

  client: (method, params, cb) ->
    if method is 'client'
      return cb new Error 'Missing or invalid method'

    (do ->
      unless initHasBeenCalled
        return Promise.reject new Error 'Must call Starfire(\'init\') first'

      config.then (config) ->
        unless Object::toString.call(params) is '[object Array]'
          params = [params]

        # inject appId and accessToken into request parameters
        if typeof params[0] is 'object'
          params[0].appId = config.appId
          params[0].accessToken = config.accessToken

        return portal.call method, params...
    )
    .then (x) -> cb null, x
    .catch cb

  register: (_, [{method, fn}]) ->
    methods[method] = fn(config)

}

portal.on 'share.any', ({text} = {}) ->
  unless typeof text is 'string'
    throw new Error 'text parameter is missing or invalid'

  if text.length > TWEET_LENGTH
    throw new Error 'No valid share method available'

  tweet = (text) ->
    text = encodeURIComponent text.substr 0, TWEET_LENGTH
    window.open "https://twitter.com/intent/tweet?text=#{text}"

  return tweet(text)

module.exports = Starfire

q = window.Starfire?.q
# Initialize, allowing time for synchronous registration of services
window.setTimeout ->
  q or= window.Starfire?.q or []

  window.Starfire = Starfire
  for call in q
    Starfire.apply 0, call
