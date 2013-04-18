class @LunrSearch
  constructor: (elem, options) ->
    @$elem         = elem
    @$results      = $(options.results)
    @$entries      = $(options.entries, @$results)
    @$indexDataUrl = options.indexUrl

    @index = @createIndex()
    @template = @compileTemplate $(options.template)

  createIndex: =>
    lunr ->
      @field "title",
        boost: 10
      @field "body"
      @ref "id"

  compileTemplate: (template) =>
    console.log $(template).text()
    Mustache.compile $(template).text()
