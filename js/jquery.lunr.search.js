(function() {

  (function($) {
    var LunrSearch, debounce, parseDate;
    debounce = function(fn) {
      var slice, timeout;
      timeout = void 0;
      slice = Array.prototype.slice;
      return function() {
        var args, ctx;
        args = slice.call(arguments_);
        ctx = this;
        clearTimeout(timeout);
        return timeout = setTimeout(function() {
          return fn.apply(ctx, args);
        }, 100);
      };
    };
    parseDate = function(input) {
      var parts;
      parts = input.match(/(\d+)/g);
      return new Date(parts[0], parts[1] - 1, parts[2]);
    };
    LunrSearch = (function() {
      LunrSearch = function(elem, options) {
        this.$elem = elem;
        this.$results = $(options.results);
        this.$entries = $(options.entries, this.$results);
        this.indexDataUrl = options.indexUrl;
        this.index = this.createIndex();
        this.template = this.compileTemplate($(options.template));
        return this.initialize();
      };
      LunrSearch.prototype.initialize = function() {
        var self;
        self = this;
        return this.loadIndexData(function(data) {
          self.populateIndex(data);
          self.populateSearchFromQuery();
          return self.bindKeypress();
        });
      };
      LunrSearch.prototype.createIndex = function() {
        return lunr(function() {
          this.field("title", {
            boost: 10
          });
          this.field("body");
          return this.ref("id");
        });
      };
      LunrSearch.prototype.compileTemplate = function($template) {
        return Mustache.compile($template.text());
      };
      LunrSearch.prototype.loadIndexData = function(callback) {
        return $.getJSON(this.indexDataUrl, callback);
      };
      LunrSearch.prototype.populateIndex = function(data) {
        var index;
        index = this.index;
        this.entries = $.map(data.entries, this.createEntry);
        return $.each(this.entries, function(idx, entry) {
          return index.add(entry);
        });
      };
      LunrSearch.prototype.createEntry = function(raw, index) {
        var entry;
        entry = $.extend({
          id: index + 1
        }, raw);
        if (raw.date) {
          $.extend(entry, {
            date: parseDate(raw.date),
            pubdate: function() {
              return dateFormat(parseDate(raw.date), "yyyy-mm-dd");
            },
            displaydate: function() {
              return dateFormat(parseDate(raw.date), "mmm dd, yyyy");
            }
          });
        }
        return entry;
      };
      LunrSearch.prototype.bindKeypress = function() {
        var self;
        self = this;
        return this.$elem.bind("keyup", debounce(function() {
          return self.search($(this).val());
        }));
      };
      LunrSearch.prototype.search = function(query) {
        var entries, results;
        entries = this.entries;
        if (query.length <= 2) {
          this.$results.hide();
          return this.$entries.empty();
        } else {
          results = $.map(this.index.search(query), function(result) {
            return $.grep(entries, function(entry) {
              return entry.id === parseInt(result.ref, 10);
            })[0];
          });
          return this.displayResults(results);
        }
      };
      LunrSearch.prototype.displayResults = function(entries) {
        var $entries, $results;
        $entries = this.$entries;
        $results = this.$results;
        $entries.empty();
        if (entries.length === 0) {
          $entries.append("<p>Nothing found.</p>");
        } else {
          $entries.append(this.template({
            entries: entries
          }));
        }
        return $results.show();
      };
      LunrSearch.prototype.populateSearchFromQuery = function() {
        var queryString, uri;
        uri = new URI(window.location.search.toString());
        queryString = uri.search(true);
        if (queryString.hasOwnProperty("q")) {
          this.$elem.val(queryString.q);
          return this.search(queryString.q.toString());
        }
      };
      return LunrSearch;
    })();
    $.fn.lunrSearch = function(options) {
      options = $.extend({}, $.fn.lunrSearch.defaults, options);
      new LunrSearch(this, options);
      return this;
    };
    return $.fn.lunrSearch.defaults = {
      indexUrl: "/search.json",
      results: "#search-results",
      entries: ".entries",
      template: "#search-results-template"
    };
  })(jQuery);

}).call(this);
