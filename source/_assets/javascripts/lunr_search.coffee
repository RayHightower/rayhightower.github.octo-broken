#= require lunr.min

class @LunrSearch
  constructor: (elem, options) ->
    @$elem         = elem
    @$results      = $(options.results)
    @$entries      = $(options.entries, @$results)
    @$indexDataUrl = options.indexUrl

