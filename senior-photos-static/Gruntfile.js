module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    /**
    * Set project object
    */
    project: {
      src: '',
      scss: ['scss'],
      css: ['css'],
      js: ['js']
    },

    concat: {
      dist: {
        src: [
          '<%= project.js %>/plugins/*.js',
          '../division-bar/js/division-bar.js',
          '<%= project.js %>/app.js'
        ],
        dest: '<%= project.js %>/build/production.js'
      }
    },

    uglify: {
      build: {
        src: ['<%= project.js %>/build/production.js'],
        dest: '<%= project.js %>/build/production.min.js'
      }
    },

    sass: {
      dist: {
        options: {
          style: 'compressed'
        },
        files: {
          '<%= project.css %>/master.css': '<%= project.scss %>/master.scss',
        }
      }
    },

    imagemin: {
      dynamic: {
        files: [{
          expand: true,
          cwd: '<%= project.src %>/images/',
          src: ['**/*.{png,jpg,gif}'],
          dest: '<%= project.src %>/images/'
        }]
      }
    },

    watch: {
      options: {
        livereload: true,
      },
      scripts: {
        files: ['<%= project.js %>/*.js', '<%= project.js %>/**/*.js'],
        tasks: ['concat', 'uglify'],
        options: {
          spawn: false,
        }
      },
      css: {
        files: ['<%= project.scss %>/*.scss', '<%= project.scss %>/**/*.scss'],
        tasks: ['sass'],
        options: {
          spawn: false,
        }
      },
      markup: {
          files: ['<%= project.src %>/templates/**/*.ss'],
          options: {
              livereload: true,
          }
      }
    },

  });

  // Load the plugin that provides the "uglify" task.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-sass');
  grunt.loadNpmTasks('grunt-contrib-imagemin');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Default task(s).
  grunt.registerTask('default', ['concat', 'uglify', 'sass', 'watch']);

};