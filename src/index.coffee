Starfire = require './base'
ui = require './ui'

Starfire 'register', {method: 'ui', fn: ui}

module.exports = Starfire
