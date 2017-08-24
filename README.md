## Starfi.re SDK

Starfi.re SDK

### Install

Add to the top of `<body>`  
Replace `0000` with your appId

```html
<script>
(function(C,l,a,y,_,i,o){C[_]=C[_]||function(){
(C[_].q=C[_].q||[]).push(arguments)},C[_].l=1*new Date();i=l.createElement(a),
o=l.getElementsByTagName(a)[0];i.async=1;i.src=y;o.parentNode.insertBefore(i,o)
})(window,document,'script','//cdn.wtf/sdk/v1/starfire_sdk.js','Clay');

Starfire('init', {appId: '0000'})
</script>
```

### Example

```js
Starfire('init', {appId: '0000'})

Starfire('client.forum.share', {text: 'I won a game!'})
```

### SDK Usage

##### Init

```js
Starfire('init', {appId: '0000'})
```

##### Player

###### client.player.getMe

Gets information about the current logged in user

```js
// client.player.getMe
Starfire('client.player.getMe')
```

##### Version

```js
Starfire('version', function (err, version) {
  console.log(version);
})
```

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
