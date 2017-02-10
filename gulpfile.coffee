gulp = require 'gulp'
coffee = require 'gulp-coffee'
css = require 'gulp-clean-css'
pages = require 'gulp-gh-pages'
htmlmin = require 'gulp-htmlmin'
uglify = require 'gulp-uglify'
imagemin = require 'gulp-imagemin'

gulp.task "font", ->
  gulp.src "src/font/*"
  .pipe gulp.dest "dist/font"

gulp.task "coffee", ->
  gulp.src "src/**/*.coffee"
  .pipe coffee()
  .pipe gulp.dest "src/"

gulp.task "css", ->
  gulp.src "src/**/*.css"
  .pipe css()
  .pipe gulp.dest "dist/"

gulp.task "html", ->
  gulp.src "src/*.html"
  .pipe htmlmin()
  .pipe gulp.dest "dist/"

gulp.task "js", ["coffee"], ->
  gulp.src "src/**/*.js"
  .pipe uglify()
  .pipe gulp.dest "dist/"

gulp.task "img", ->
  gulp.src "src/img/*"
  .pipe imagemin()
  .pipe gulp.dest "dist/img"

gulp.task "build", ["html", "js", "css", "img", "font"], ->

gulp.task "deploy", ["build"], ->
  gulp.src "dist/**/*"
  .pipe pages()
