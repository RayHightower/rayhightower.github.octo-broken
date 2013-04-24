describe "LunrSearch", ->
  server = null
  
  beforeEach ->
    response = readFixtures("search.json")
    server = sinon.fakeServer.create()
    server.autoRespond = true
    server.respondWith "GET", "search.json",
      [200, {"Content-Type": "application/json"},
      JSON.stringify(response) ]

    console.log  server

    loadFixtures "index.html"

    @search = new LunrSearch '#search-query',
                              indexUrl: "/search.json",
                              results: "#search-results",
                              entries: ".entries",
                              template: "#search-results-template"

  afterEach -> server.restore()

  it "should be defined", ->
    expect(@search.$elem).toEqual "#search-query"
