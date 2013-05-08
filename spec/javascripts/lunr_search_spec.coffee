describe "LunrSearch", ->
  
  beforeEach ->
    loadFixtures "index.html"
    response = readFixtures("search.json")
    fakeResponse = sinon.stub($, 'getJSON').yields JSON.parse(response) #JSON.stringify(response)
    @search = new LunrSearch '#search-query',
                              indexUrl: "/search.json",
                              results: "#search-results",
                              entries: ".entries",
                              template: "#search-results-template"

  afterEach -> $.getJSON.restore()

  it "should be defined", ->
    (expect @search).toBeLunrSearch()

  it "hides the results partial on load", ->
   (expect @search.$results).toBeHidden()

  it "shows the results partial", ->
    @search.search("post")
    (expect @search.$results).toBeVisible()

  it "returns the correct number of entries", ->
    @search.search("post")
    posts = @search.$entries.children()
    (expect posts.length).toBe(3)

  it "returns the correct content for search entry", ->
    @search.search("first")
    post = @search.$entries.children()
    content = post.html().replace( new RegExp( "\>[\n\t ]+\<" , "g" ) , "><" ).trim()
    (expect content).toBe("<h3><a href=\"\">first post</a></h3>")

  it "displays Nothing found message when there is no result", ->
    @search.search("hgkflgfkgfgo")
    (expect @search.$results).toBeVisible()
    (expect @search.$entries.text()).toBe("Nothing found.")
