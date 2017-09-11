# Starfi.re SDK

If you're looking for inspiration, see [IDEAS.md](IDEAS.md)

## Install

Add to the top of `<body>`  
Replace `xxxx-xxxx-xxxx-xxxx` with your appId

```html
<script>
(function(S,t,a,r,f,i,re){S[f]=S[f]||function(){
(S[f].q=S[f].q||[]).push(arguments)},S[f].l=1*new Date();i=t.createElement(a),
re=t.getElementsByTagName(a)[0];i.async=1;i.src=r;re.parentNode.insertBefore(i,re)
})(window,document,'script','//cdn.wtf/sdk/v1/starfire_sdk.js','Starfire');

Starfire('init', {appId: 'xxxx-xxxx-xxxx-xxxx'})
</script>
```

## Example

```js
Starfire('init', {appId: 'xxxx-xxxx-xxxx-xxxx'})

Starfire('client.clashRoyale.player.getMe', function (err, me) {
  console.log(me);
})
```

## SDK Usage

#### Init

```js
Starfire('init', {appId: 'xxxx-xxxx-xxxx-xxxx'})
```

#### Player

##### client.clashRoyale.player.getme

Gets information about the current logged in user

```js
// client.clashRoyale.player.getMe
// @param {Function} callback
Starfire('client.clashRoyale.player.getMe', function (err, me) {
  console.log(me)
})

/*
example response:
{
  "tag": "#PCV8",
  "name": "MOLT_YouTube",
  "expLevel": 13,
  "trophies": 5056,
  "bestTrophies": 5911,
  "wins": 8667,
  "losses": 5997,
  "battleCount": 16327,
  "threeCrownWins": 1937,
  "challengeCardsWon": 54302,
  "challengeMaxWins": 14,
  "tournamentCardsWon": 330,
  "tournamentBattleCount": 99,
  "role": "leader",
  "donations": 0,
  "donationsReceived": 0,
  "totalDonations": 12117,
  "clan": {
    "tag": "#YU2RQG9",
    "name": "PandaScheme",
    "badgeId": 16000139
  },
  "arena": {
    "id": 54000015,
    "name": "League 4"
  },
  "leagueStatistics": {
    "currentSeason": {
      "trophies": 5056
    },
    "bestSeason": {
      "id": "2017-07",
      "rank": 1613,
      "trophies": 5622
    }
  },
  "achievements": [
    {
      "name": "Team Player",
      "stars": 3,
      "value": 31,
      "target": 1,
      "info": "Join a Clan"
    },
    ...
  ],
  "cards": [
    {
      "name": "Dark Prince",
      "level": 8,
      "maxLevel": 7
    },
    ...
  ],
  "currentFavouriteCard": {
    "name": "Goblin Gang"
  }
}
*/
```

##### client.clashRoyale.player.getByTag

Gets information about a given user

```js
// client.clashRoyale.player.getByTag
// @param {Object} params
// @param {String} params.tag
// @param {Function} callback
Starfire('client.clashRoyale.player.getByTag', function (err, player) {
  console.log(player);
})

/*
example response:
{
  "tag": "#PCV8",
  "name": "MOLT_YouTube",
  "expLevel": 13,
  "trophies": 5056,
  "bestTrophies": 5911,
  "wins": 8667,
  "losses": 5997,
  "battleCount": 16327,
  "threeCrownWins": 1937,
  "challengeCardsWon": 54302,
  "challengeMaxWins": 14,
  "tournamentCardsWon": 330,
  "tournamentBattleCount": 99,
  "role": "leader",
  "donations": 0,
  "donationsReceived": 0,
  "totalDonations": 12117,
  "clan": {
    "tag": "#YU2RQG9",
    "name": "PandaScheme",
    "badgeId": 16000139
  },
  "arena": {
    "id": 54000015,
    "name": "League 4"
  },
  "leagueStatistics": {
    "currentSeason": {
      "trophies": 5056
    },
    "bestSeason": {
      "id": "2017-07",
      "rank": 1613,
      "trophies": 5622
    }
  },
  "achievements": [
    {
      "name": "Team Player",
      "stars": 3,
      "value": 31,
      "target": 1,
      "info": "Join a Clan"
    },
    ...
  ],
  "cards": [
    {
      "name": "Dark Prince",
      "level": 8,
      "maxLevel": 7
    },
    ...
  ],
  "currentFavouriteCard": {
    "name": "Goblin Gang"
  }
}
*/
```

#### Matches (battles)

##### client.clashRoyale.match.getAllByTag

Gets last 10 matches for a given tag

```js
// client.clashRoyale.match.getByTag
// @param {Object} params
// @param {String} params.tag
// @param {Function} callback
Starfire('client.clashRoyale.match.getByTag', function (err, matches) {
  console.log(matches);
})

/*
example response:
[
  {
    "type": "PvP",
    "battleTime": "20170902T201535.000Z",
    "deckSelection": "collection",
    "team": [
      {
        "tag": "#YL2QC0C",
        "name": "Aмiя ん",
        "startingTrophies": 5110,
        "trophyChange": 27,
        "crowns": 2,
        "clan": {
          "tag": "#Q8YRPV",
          "name": "Persian.gulf",
          "badgeId": 16000068
        },
        "cards": [
          {
            "name": "Fire Spirits",
            "level": 12,
            "maxLevel": 12
          },
          ...
        ]
      }
    ],
    "opponent": [
      {
        "tag": "#PCV8",
        "name": "MOLT_YouTube",
        "startingTrophies": 5083,
        "trophyChange": -27,
        "crowns": 1,
        "clan": {
          "tag": "#YU2RQG9",
          "name": "PandaScheme",
          "badgeId": 16000139
        },
        "cards": [
          {
            "name": "Bowler",
            "level": 7,
            "maxLevel": 7
          },
          ...
        ]
      }
    ]
  }
  ]
*/
```

#### Decks

##### client.clashRoyale.deck.getAllByTag

Gets last 10 decks for a given tag

```js
// client.clashRoyale.deck.getByTag
// @param {Object} params
// @param {String} params.tag
// @param {Function} callback
Starfire('client.clashRoyale.deck.getByTag', function (err, decks) {
  console.log(decks);
})

/*
example response:
[
  {
    "id": "751cd95c-20c0-418d-a221-f9b5b577b202",
    "deckId": "arrows|baby_dragon|cannon|fireball|goblin_gang|golem|mega_minion|skeleton_army",
    "deck": {
      "cardIds": [
        "5da558a9-b546-48d3-ac8e-5dc30ee5ff34",
        ...
      ],
      "averageElixirCost": 3.9,
      "wins": 2541,
      "losses": 2698,
      "draws": 587,
      "addTime": "2017-04-25T00:09:50.936Z"
    },
    "name": null,
    "wins": 24,
    "losses": 16,
    "draws": 6,
    "addTime": "2017-04-25T01:55:56.988Z"
  },
  {
    "id": "d62b42c2-b3fe-4ae7-82c4-452aecdb8685",
    "deckId": "battle_ram|fireball|freeze|ice_wizard|mega_minion|mini_pekka|the_log|valkyrie",
    "deck": {
      "cardIds": [
        "03d12926-3a09-46dc-b41d-33ba97ee0f8e",
        ...
      ],
      "averageElixirCost": 3.5,
      "wins": 929,
      "losses": 1317,
      "draws": 271,
      "addTime": "2017-08-01T01:30:28.424Z"
    },
    "name": null,
    "wins": 20,
    "losses": 9,
    "draws": 3,
    "addTime": "2017-08-01T01:30:28.424Z"
  }
]
*/
```

#### Version

```js
Starfire('version', function (err, version) {
  console.log(version);
})
```

### Coming soon
client.forum.share, client.chat.share

## SDK UI Usage (coming soon)

SDK UI calls may return an SDK UI element, which has a DOM node ($el) that may be appended to the DOM. E.g. `miniProfile.$el`

## Contributing

#### Install pre-commit hook

`ln -s ../../pre-commit.sh .git/hooks/pre-commit`

```bash
npm install
npm run dev
```
