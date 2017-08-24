z = require 'zorium'

components =
  # 'general.example': require './components/example'

ui = (config) ->
  (componentName, [options] = [], cb) ->
    options ?= {}

    if componentName is 'version'
      return cb null, 'v1.0.1'

    config.then (config) ->
      unless components[componentName]
        throw new Error 'Component not found' + componentName

      if Object::toString.call(options) isnt '[object Object]'
        throw new Error 'options must be an object'

      ComponentClass = components[componentName]

      component = new ComponentClass config, options

      component.redraw()

      return component
    .then (x) -> cb null, x
    .catch cb

module.exports = ui
