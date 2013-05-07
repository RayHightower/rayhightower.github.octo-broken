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

  it "returns an empty div on load", ->
   (expect @search.$results).toBeHidden()

  it "populates results", ->
    @search.search("post")
    (expect @search.$results).toBeVisible()
