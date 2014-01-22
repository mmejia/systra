module.exports =(grunt)->
	archivos=
		expand: true
		cwd:'assets/javascripts/'
		src: ["**/*.js"]  
		dest: "systra/static/javascripts/"
		flatten: true
		ext: ".js"
	grunt.initConfig
		uglify:
			dynamic_mappings:
				files:[
					archivos,	
				]
		watch:
			js:
				files: "assets/javascripts/**/*.js"
				tasks: ["uglify"]
	grunt.loadNpmTasks "grunt-contrib-watch"
	grunt.loadNpmTasks "grunt-contrib-uglify"
	grunt.registerTask('default', [ 'uglify' ]);