## Starfi.re SDK

Starfi.re SDK

### Install

Add to the top of `<body>`  
Replace `xxxx-xxxx-xxxx-xxxx` with your appId

```html
<script>
(function(S,t,a,r,f,i,r,e){S[f]=S[f]||function(){
(S[f].q=S[f].q||[]).push(arguments)},S[f].l=1*new Date();i=t.createElement(a),
r=t.getElementsByTagName(a)[0];i.async=1;i.src=r;r.parentNode.insertBefore(i,r)
})(window,document,'script','//cdn.wtf/sdk/v1/starfire_sdk.js','Starfire');

Starfire('init', {appId: 'xxxx-xxxx-xxxx-xxxx'})
</script>
```

### Example

```js
Starfire('init', {appId: 'xxxx-xxxx-xxxx-xxxx'})

Starfire('client.clashRoyale.player.getMe', function (err, me) {
  console.log(me);
})
// Starfire('client.forum.share', {text: 'I won a game!'})
```

### SDK Usage

##### Init

```js
Starfire('init', {appId: 'xxxx-xxxx-xxxx-xxxx'})
```

##### Player

###### client.clashRoyale.player.getme

Gets information about the current logged in user

```js
// client.clashRoyale.player.getMe
// @param {Function} callback
Starfire('client.clashRoyale.player.getMe', function (err, me) {})
```

###### client.clashRoyale.player.getByTag

Gets information about a given user

```js
// client.clashRoyale.player.getByTag
// @param {Object} params
// @param {String} params.tag
// @param {Function} callback
Starfire('client.clashRoyale.player.getByTag', function (err, me) {})
```

##### Matches (battles)

###### client.clashRoyale.match.getAllByTag

Gets last 10 matches for a given tag

```js
// client.clashRoyale.match.getByTag
// @param {Object} params
// @param {String} params.tag
// @param {Function} callback
Starfire('client.clashRoyale.match.getByTag', function (err, me) {})
```

##### Decks

###### client.clashRoyale.deck.getAllByTag

Gets last 10 decks for a given tag

```js
// client.clashRoyale.match.getByTag
// @param {Object} params
// @param {String} params.tag
// @param {Function} callback
Starfire('client.clashRoyale.deck.getByTag', function (err, me) {})
```

##### Version

```js
Starfire('version', function (err, version) {
  console.log(version);
})
```

#### Coming soon
client.matches.getAllById, client.forum.share

### SDK UI Usage

SDK UI calls may return an SDK UI element, which has a DOM node ($el) that may
be appended to the DOM. E.g. `ad.$el`

**Coming soon**

### Contributing

##### Install pre-commit hook

`ln -s ../../pre-commit.sh .git/hooks/pre-commit`

```bash
npm install
npm run dev
```
