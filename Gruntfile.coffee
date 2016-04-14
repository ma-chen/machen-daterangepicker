module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      compileJoined:
        options:
          join: true
        files:
          'js/machen-daterangepicker.js': ['coffee/machen-daterangepicker.coffee']

    watch:
      files: ['example.html', 'coffee/*.coffee']
      tasks: ['coffee']

    uglify:
      options:
        sourceMap: true
      target:
        files:
          'js/machen-daterangepicker.min.js': ['js/machen-daterangepicker.js']
    wiredep:
      target:
        src: [
          './example.html'
        ]

    ngAnnotate:
      options:
        singleQuotes: true

      daterangepicker:
        files:
          'js/machen-daterangepicker.js': ['js/machen-daterangepicker.js']


  # Default task(s).
  grunt.registerTask "default", ["coffee"]
  grunt.registerTask "develop", ["coffee", "watch"]
  grunt.registerTask "dist", ["coffee", "ngAnnotate", "uglify"]
