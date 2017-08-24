gulp = require 'gulp'
nodemon = require 'gulp-nodemon'
rename = require 'gulp-rename'
clean = require 'gulp-clean'
runSequence = require 'gulp-run-sequence'
coffeelint = require 'gulp-coffeelint'
webpack = require 'webpack'
webpackStream = require 'webpack-stream'

outFiles =
  scripts: 'bundle.js'

paths =
  scripts: ['./src/**/*.coffee', './*.coffee']
  root: './src/index.coffee'
  dist: './dist/'
  build: './build/'

gulp.task 'demo', ->
  gulp.start 'server'

# compile sources: src/* -> dist/*
gulp.task 'assets:prod', [
  'scripts:prod'
]

# build for production
gulp.task 'build', (cb) ->
  runSequence 'clean:dist', 'assets:prod', cb

#
# Dev server and watcher
#

# start the dev server
gulp.task 'server', ->
  nodemon {script: 'bin/dev_server.coffee', ext: 'null', ignore: ['**/*.*']}

# run coffee-lint
gulp.task 'lint:scripts', ->
  gulp.src paths.scripts
    .pipe coffeelint()
    .pipe coffeelint.reporter()

#
# Production compilation
#

# rm -r dist
gulp.task 'clean:dist', ->
  gulp.src paths.dist, read: false
    .pipe clean()

# init.coffee --> dist/js/bundle.min.js
gulp.task 'scripts:prod', ->
  gulp.src paths.root
  .pipe webpackStream
    output:
      library: 'Starfire'
    module:
      # postLoaders: [
      #   { test: /\.coffee$/, loader: 'transform/cacheable?envify' }
      # ]
      loaders: [
        { test: /\.coffee$/, loader: 'coffee-loader' }
        { test: /\.json$/, loader: 'json-loader' }
        { test: /\.styl$/, loader: 'style/useable!css!stylus' }
      ]
    plugins: [
      new webpack.optimize.UglifyJsPlugin()
    ]
    resolve:
      extensions: ['.coffee', '.js', '.json', '']
  .pipe rename 'starfire_sdk.js'
  .pipe gulp.dest paths.dist
