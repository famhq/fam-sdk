z = require 'zorium'

UIComponent = require '../ui_component'
config = require '../../config'

require './index.styl'

module.exports = class Example extends UIComponent
  constructor: ->
    super()

  render: ->
    z 'sf-example', 'Coming soon'
