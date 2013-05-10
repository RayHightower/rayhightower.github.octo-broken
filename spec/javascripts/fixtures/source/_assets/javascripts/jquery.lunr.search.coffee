#= require jquery.min

(($) ->
  debounce = (fn) ->
    timeout = undefined
    slice = Array::slice
    ->
      args = slice.call(arguments_)
      ctx = this
      clearTimeout timeout
      timeout = setTimeout(->
        fn.apply ctx, args
      , 100)

  
  # parse a date in yyyy-mm-dd format
  parseDate = (input) ->
    parts = input.match(/(\d+)/g)
    new Date(parts[0], parts[1] - 1, parts[2]) # months are 0-based

  LunrSearch = (->
    LunrSearch = (elem, options) ->
      @$elem = elem
      @$results = $(options.results)
      @$entries = $(options.entries, @$results)
      @indexDataUrl = options.indexUrl

      @index = @createIndex()
      @template = @compileTemplate($(options.template))
      @initialize()
      
    LunrSearch::initialize = ->
      self = this
      @loadIndexData (data) ->
        self.populateIndex data
        self.populateSearchFromQuery()
        self.bindKeypress()
    
    # create lunr.js search index specifying that we want to index the title and body fields of documents.
    LunrSearch::createIndex = ->
      lunr ->
        @field "title",
          boost: 10
        @field "body"
        @ref "id"
    
    # compile search results template
    LunrSearch::compileTemplate = ($template) ->
      Mustache.compile $template.text()
    
    # load the search index data
    LunrSearch::loadIndexData = (callback) ->
      $.getJSON @indexDataUrl, callback

    LunrSearch::populateIndex = (data) ->
      index = @index
      
      # format the raw json into a form that is simpler to work with
      @entries = $.map(data.entries, @createEntry)
      $.each @entries, (idx, entry) ->
        index.add entry

    LunrSearch::createEntry = (raw, index) ->
      entry = $.extend(
        id: index + 1
      , raw)
      
      # include pub date for posts
      if raw.date
        $.extend entry,
          date: parseDate(raw.date)
          pubdate: ->
            
            # HTML5 pubdate
            dateFormat parseDate(raw.date), "yyyy-mm-dd"

          displaydate: ->
            
            # only for posts (e.g. Oct 12, 2012)
            dateFormat parseDate(raw.date), "mmm dd, yyyy"

      entry

    LunrSearch::bindKeypress = ->
      self = this
      @$elem.bind "keyup", debounce(->
        self.search $(this).val()
      )

    LunrSearch::search = (query) ->
      entries = @entries
      if query.length <= 2
        @$results.hide()
        @$entries.empty()
      else
        results = $.map(@index.search(query), (result) ->
          $.grep(entries, (entry) ->
            entry.id is parseInt(result.ref, 10)
          )[0]
        )
        @displayResults results

    LunrSearch::displayResults = (entries) ->
      $entries = @$entries
      $results = @$results
      $entries.empty()
      if entries.length is 0
        $entries.append "<p>Nothing found.</p>"
      else
        $entries.append @template(entries: entries)
      $results.show()

    
    # Populate the search input with 'q' querystring parameter if set
    LunrSearch::populateSearchFromQuery = ->
      uri = new URI(window.location.search.toString())
      queryString = uri.search(true)
      if queryString.hasOwnProperty("q")
        @$elem.val queryString.q
        @search queryString.q.toString()

    LunrSearch
  )()
  $.fn.lunrSearch = (options) ->
    
    # apply default options
    options = $.extend({}, $.fn.lunrSearch.defaults, options)
    
    # create search object
    new LunrSearch(this, options)
    this

  $.fn.lunrSearch.defaults =
    indexUrl: "/search.json" # Url for the .json file containing search index source data (containing: title, url, date, body)
    results: "#search-results" # selector for containing search results element
    entries: ".entries" # selector for search entries containing element (contained within results above)
    template: "#search-results-template" # selector for Mustache.js template
) jQuery
