describe "LunrSearch", ->
  
  beforeEach ->
    loadFixtures "index.html"
    response = readFixtures("search.json")
    sinon.stub($, 'getJSON').yields JSON.stringify(response)
    @search = new LunrSearch '#search-query',
                              indexUrl: "/search.json",
                              results: "#search-results",
                              entries: ".entries",
                              template: "#search-results-template"

  afterEach -> $.getJSON.restore()

  it "should be defined", ->
    expect(@search.$elem).toEqual "#search-query"

  it "gets the json for the search", ->
    @search._init()
