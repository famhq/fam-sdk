Starfire = require './index'

Starfire 'init', {appId: 'xxxx-xxxx-xxxx-xxxx', debug: true}

Starfire 'client.clashRoyale.player.getMe', (err, me) ->
  console.log 'mePlayer', me, err

Starfire 'client.clashRoyale.player.getByTag', {tag: 'PCV8'}, (err, player) ->
  console.log 'player', player, err

Starfire 'client.clashRoyale.user.getAllByPlayerTag', {playerTag: '22CJ9CQC0'}, (err, users) ->
  console.log 'users', users, err

Starfire 'client.clashRoyale.clan.getByTag', {tag: 'YU2RQG9'}, (err, clan) ->
  console.log 'clan', clan, err

Starfire 'client.clashRoyale.match.getAllByTag', {limit: 10, tag: 'PCV8'}, (err, matches) ->
  console.log 'matches', matches, err

  Starfire 'client.clashRoyale.match.getAllByTag', {limit: 15, cursor: matches.cursor, tag: 'PCV8'}, (err, matches) ->
    console.log 'matches2', matches, err

Starfire 'client.clashRoyale.deck.getAllByTag', {limit: 10, tag: 'PCV8'}, (err, decks) ->
  console.log 'decks', decks, err

Starfire 'client.clashRoyale.userRecord.getAllByTag', {limit: 10, tag: 'PCV8'}, (err, userRecords) ->
  console.log 'userRecords', userRecords, err

Starfire 'client.clashRoyale.clanRecord.getAllByTag', {limit: 10, tag: 'YU2RQG9'}, (err, clanRecords) ->
  console.log 'clanRecords', clanRecords, err

#
# # TODO:
# Starfire 'client.clashRoyale.deck.getById', {
#   id: 'electro_wizard|fireball|ice_spirit|knight|miner|rocket|skeletons|the_log',
#   arena: 10, # only used for type: 'PvP'
#   type: 'PvP' # PvP, 2v2, classicChallenge, grandChallenge, tournament. leave empty for all
#
# }, (err, deck) ->
#   console.log 'deck', deck
#
# Starfire 'client.clashRoyale.card.getByKey', {
#   key: 'goblin_gang',
#   arena: 10,
#   type: 'pvp'
# }, (err, result) ->
#   console.log 'card', card

# win rate vs card ids, filter by arena, gameType


# Starfire 'client.forum.share', {title: 'Test', message: 'Test2'}, (err, me) ->
#   console.log 'share', me, err
