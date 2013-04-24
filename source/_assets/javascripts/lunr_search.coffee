class @LunrSearch
  constructor: (elem, options) ->
    @$elem         = elem
    @$results      = $(options.results)
    @$entries      = $(options.entries, @$results)
    @$indexDataUrl = options.indexUrl

    @index = @createIndex()
    @template = @_compileTemplate $(options.template)

    #@_init()

  createIndex: =>
    lunr ->
      @field "title",
        boost: 10
      @field "body"
      @ref "id"

  _init: =>
    $.getJSON @indexDataUrl, (data) =>
      console.log "the data is" + data
    #@_loadIndex (data) =>
      #@_populateIndex data

  _compileTemplate: (template) =>
    #console.log $(template).text()
    Mustache.compile $(template).text()

  _loadIndex: (callback) =>
    $.getJSON @indexDataUrl, (callback) =>
      console.log callback

  _populateIndex: (data) =>
    index = @index

    console.log data
