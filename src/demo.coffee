Starfire = require './index'

Starfire 'init', {appId: '1', debug: true}

Starfire 'client.player.getMe', (err, me) ->
  console.log 'player', me, err
