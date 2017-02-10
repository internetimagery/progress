(function() {
  var coffee, css, gulp, htmlmin, imagemin, pages, uglify;

  gulp = require('gulp');

  coffee = require('gulp-coffee');

  css = require('gulp-clean-css');

  pages = require('gulp-gh-pages');

  htmlmin = require('gulp-htmlmin');

  uglify = require('gulp-uglify');

  imagemin = require('gulp-imagemin');

  gulp.task("coffee", function() {
    return gulp.src("src/**/*.coffee").pipe(coffee()).pipe(gulp.dest("src/"));
  });

  gulp.task("css", function() {
    return gulp.src("src/**/*.css").pipe(css()).pipe(gulp.dest("dist/"));
  });

  gulp.task("html", function() {
    return gulp.src("src/*.html").pipe(htmlmin()).pipe(gulp.dest("dist/"));
  });

  gulp.task("js", ["coffee"], function() {
    return gulp.src("src/**/*.js").pipe(uglify()).pipe(gulp.dest("dist/"));
  });

  gulp.task("img", function() {
    return gulp.src("src/img/*").pipe(imagemin()).pipe(gulp.dest("dist/img"));
  });

  gulp.task("build", ["html", "js", "css", "img"], function() {});

  gulp.task("deploy", ["build"], function() {
    return gulp.src("dist/**/*").pipe(pages());
  });

}).call(this);
