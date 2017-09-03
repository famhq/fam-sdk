Starfire = require './index'

Starfire 'init', {appId: 'xxxx-xxxx-xxxx-xxxx', debug: true}

Starfire 'client.clashRoyale.player.getMe', (err, me) ->
  console.log 'mePlayer', me, err

Starfire 'client.clashRoyale.player.getByTag', {tag: 'PCV8'}, (err, player) ->
  console.log 'player', player, err

Starfire 'client.clashRoyale.match.getAllByTag', {limit: 10, tag: 'PCV8'}, (err, matches) ->
  console.log 'matches', matches, err

Starfire 'client.clashRoyale.deck.getAllByTag', {limit: 10, tag: 'PCV8'}, (err, decks) ->
  console.log 'decks', decks, err

# Starfire 'client.forum.share', {title: 'Test', message: 'Test2'}, (err, me) ->
#   console.log 'share', me, err
