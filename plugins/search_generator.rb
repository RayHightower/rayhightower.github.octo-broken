require 'json'

module Jekyll
  class SearchData < StaticFile
    def write(dest)
        begin
            super(dest)
        rescue
        end
        true
    end
  end

  class SearchGenerator < Generator

    EXCLUDE = ["Not found", "Internal Server Error", "Blog Archive", "store_bak", "Contact"]
    
    def generate(site)
      @search_array = []
      search_posts(site)
      search_pages(site)
      file = File.new(File.join(site.dest, "search.json"), "w")
      file.write(JSON.pretty_generate(@search_array))
      file.close
      site.static_files << Jekyll::SearchData.new(site, site.dest, "/", "search.json")
    end

    def search_posts(site)
      site.posts.each do |post|
        @search_array << {
        title: post.data["title"],
        category: post.categories.first,
        tags: post.tags,
        url: post.url,
        content: post.content,
        date: {
          year: post.date.strftime("%Y"),
          month: post.date.strftime("%B"),
          day: post.date.strftime("%d")
        }
        }
      end
    end

    def search_pages(site)
      site.pages.each do |page|
        if page.data["title"]
          unless EXCLUDE.include? page.data["title"]
            @search_array << {
            title: page.data["title"],
            url: page.url,
            content: page.content
            }
          end
        end
      end
    end
    
  end
end
