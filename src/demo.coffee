Fam = require './index'

Fam 'init', {appId: 'xxxx-xxxx-xxxx-xxxx', debug: true}

Fam 'client.clashRoyale.player.getMe', {refreshIfStale: true}, (err, me) ->
  console.log 'mePlayer', me, err

Fam 'client.clashRoyale.player.getByTag', {tag: '8U8P8880', refreshIfStale: true}, (err, player) ->
  console.log 'player', player, err
  # document.getElementById('content').innerHTML += JSON.stringify player

Fam 'client.clashRoyale.user.getAllByPlayerTag', {playerTag: '22CJ9CQC0'}, (err, users) ->
  console.log 'users', users, err

Fam 'client.clashRoyale.clan.getByTag', {tag: 'YU2RQG9', refreshIfStale: true}, (err, clan) ->
  console.log 'clan', clan, err

Fam 'client.clashRoyale.match.getAllByTag', {limit: 10, tag: '22CJ9CQC0'}, (err, matches) ->
  console.log 'matches', matches, err

  Fam 'client.clashRoyale.match.getAllByTag', {limit: 15, cursor: matches.cursor, tag: 'PCV8'}, (err, matches) ->
    console.log 'matches2', matches, err
    document.getElementById('content').innerHTML += JSON.stringify matches

Fam 'client.clashRoyale.deck.getAllByTag', {limit: 10, tag: 'PCV8'}, (err, decks) ->
  console.log 'decks', decks, err

Fam 'client.clashRoyale.userRecord.getAllByTag', {limit: 10, tag: 'PCV8'}, (err, userRecords) ->
  console.log 'userRecords', userRecords, err

Fam 'client.clashRoyale.clanRecord.getAllByTag', {limit: 10, tag: 'YU2RQG9'}, (err, clanRecords) ->
  console.log 'clanRecords', clanRecords, err

#
# # TODO:
# Fam 'client.clashRoyale.deck.getById', {
#   id: 'electro_wizard|fireball|ice_spirit|knight|miner|rocket|skeletons|the_log',
#   arena: 10, # only used for type: 'PvP'
#   type: 'PvP' # PvP, 2v2, classicChallenge, grandChallenge, tournament. leave empty for all
#
# }, (err, deck) ->
#   console.log 'deck', deck
#
# Fam 'client.clashRoyale.card.getByKey', {
#   key: 'goblin_gang',
#   arena: 10,
#   type: 'pvp'
# }, (err, result) ->
#   console.log 'card', card

# win rate vs card ids, filter by arena, gameType


# Fam 'client.forum.share', {title: 'Test', message: 'Test2'}, (err, me) ->
#   console.log 'share', me, err
