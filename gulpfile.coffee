
# １レイヤーで gist に投稿できる形で react を試す。

gulp = require "gulp"
inject = require "gulp-inject"
mainBowerFiles = require "main-bower-files"
coffee = require "gulp-cjsx"
plumber = require "gulp-plumber"

# requirements end

gulp.task "inject", () ->
  # console.log mainBowerFiles()
  gulp.src("./index.html")
    .pipe(inject(gulp.src(mainBowerFiles().concat ["index.js"]), { relative: true }))
    .pipe(gulp.dest("./"))

gulp.task "coffee", () ->
  gulp.src(["./*.coffee", "!gulpfile.*"])
    .pipe plumber()
    .pipe(coffee({bare: true}))
    # .pipe coffee()
    .pipe gulp.dest("./")

gulp.task "default", ["coffee", "inject"]
gulp.task "serve", ["coffee"], () ->
  gulp.watch "index.coffee", ["coffee"]