module.exports = function(grunt) {

  var globalConfig = {
    themeDir: 'themes/studentlife'
  };

  // Project configuration.
  grunt.initConfig({

    globalConfig: globalConfig,
    pkg: grunt.file.readJSON('package.json'),
    

    sass: {
      dist: { 
        files: {
          '<%=globalConfig.themeDir %>/css/master.css' : '<%=globalConfig.themeDir %>/scss/master.scss'
        },                  // Target
        options: {              // Target options
          style: 'compressed',
          sourcemap: 'true',
        }
      }
    },

  
    watch: {
      css: {
        files: ['<%=globalConfig.themeDir %>/scss/*.scss', '<%=globalConfig.themeDir %>/scss/**/*.scss'],
        tasks: ['sass'],
        options: {
          spawn: true,
        }
      }
    },

  });

  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-watch');

  // Default task(s).
  // Note: order of tasks is very important
  grunt.registerTask('default', ['sass', 'watch']);

};