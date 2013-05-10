# Octopress Lunr.js plugin

This plugin replaces [octopress](https://github.com/imathis/octopress) google search functionality with lunr.js[lunr.js](http://lunrjs.com/).

Highly inspired by [jekyll-lunr-search](https://github.com/slashdotdash/jekyll-lunr-js-search).

## How to use

### 1. Install search-generator plugin

This octopress plugin creates a search.json file and populates it with entries results collected from your website posts & pages.

You can decide to untrack unneeded pages by adding those to the EXCLUDED array:

	EXCLUDE = ["Not found", "Internal Server Error", "Blog Archive", "store_bak", "Contact", "Search"]

### 2. Install octopress source files

The "source" folder contains the partials and libraries needed to run the plugin (feel free to edit those accordingly to your needs), each coffeescript file is compiled to js and compressed thanks to the [jekyll assets plugin](https://github.com/ixti/jekyll-assets). [Here](http://matt.coneybeare.me/how-to-setup-a-rails-like-asset-pipeline-with-octopress/) is a blog post with some useful instructions if you need some assitance on how to integrate it with your octopress install.

* source/_assets: contains needed js libs & main search class. 

* source/_includes/custom/lunr-search: contains needed partials and handlebars template used to display your search results.

### 3. Install dependencies.

Add dependencies to your app.js.coffee file (used to instantiate other libraries) via sprockets and instantiate a new LunrSearch search object when dom is ready.

	# source/_assets/javascripts/app.js.coffee
	
	# Following are plugin libraries.
	#= require ./libs/jquery.min
	#= require ./libs/lunr.min
	#= require ./libs/handlebars
	#= require ./libs/jXHR
	#= require ./libs/URI.min
	#= require lunr_search
	
	# Following are octopress related (defaults).
	#= require ./libs/swfobject-dynamic
	#= require modernizr-2.0
	#= require octopress
	
	# Instantiate a new search when dom is ready.
	$(document).ready ->
		new LunrSearch '#search-query',
	               		indexUrl: "/search.json",
	               	 	results: "#search-results",
	               	 	entries: ".entries",
	 	                template: "#search-results-template"
										
## Assets:

### 1. search form (source/_includes/custom/lunr-search/search-form.html)

    <div id="search">
      <form action="/search" method="get">
        <input type="text" id="search-query" name="q" placeholder="Search" autocomplete="off">
      </form>
    </div>

Search happens as you type, once at least three characters have been entered. 

Providing the form action and specifying the get method allows the user to hit return/enter to also submit the search.
Amend the form's action URL as necessary for the search page on your own site.

### 2. search result entries (source/_includes/custom/lunr-search/entries.html)

    <section id="search-results" style="display: none;">
      <p>Search results</p>
      <div class="entries">
      </div>
    </section>

This may be initially hidden as the plugin will show the element when searching.

### 3. search results Handlebars template (source/_includes/lunr-search/search-results-template.html).

    {% raw %}
    <script id="search-results-template" type="text/x-handlebars-template">
      {{#entries}}
        <article>
          <h3>
             <small><time datetime="{{date}}" pubdate>{{date}}</time></small>
             <a href="{{url}}">{{title}}</a>
             <p>tagged: {{tags}} | category: {{category}} </p>
          </h3>
        </article>
      {{/entries}}
    </script>
    {% endraw %}


Note the use of `{% raw %}` and `{% endraw %}` to ensure the HandleBars tags are not stripped out by Octopress.

## Test

Testing is possible thanks to [jasmine](http://pivotal.github.io/jasmine/), [jasmine-jquery](https://github.com/velesin/jasmine-jquery) and [jasmine-headless-webkit](https://github.com/johnbintz/jasmine-headless-webkit)

To setup the bogus app and run the tests follow these steps:

* Init and add octopress submodule

		$: git clone git://github.com/yortz/jekyll-lunr-js-search.git
		$: cd jekyll-lunr-search
		$: git submodule init
		$: git submodule update
		
* Edit Gemfile

		#add following dependencies
		gem 'jekyll-assets'
		gem 'yui-compressor', :git => 'git://github.com/betterdoctor/ruby-yui-compressor.git'
		gem 'coffee-script'
	
* Bootstrapp app

		$: cd jekyll-lunr-search/spec/javascripts/fixtures/app
		$: bundle install
		$: rake generate
	
* Copy files and directories

		$: cp ../../../../_config.yml _config.yml 
		$: cp ../../../../plugins/search_generator.rb plugins/search_generator.rb
		$: cp ../../../../plugins/ext.rb plugins/ext.rb
	
* Sync app/source folder and populate it with some posts

		$: rsync -a ../../support/source .
	
* Update site

		$: rake generate
	
You can now simply go back to your jekyll-lunr-search dir and start guard; it will automatically watch and compile changes in your source and spec coffeescript files.

* Guard

		$: cd jekyll-lunr-search
		$: guard

## References

Credits go to [slashdot's jekyll-lunr-search](https://github.com/slashdotdash/jekyll-lunr-js-search).
