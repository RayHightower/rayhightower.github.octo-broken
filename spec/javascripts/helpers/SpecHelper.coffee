beforeEach ->
  #jasmine.getFixtures().fixturesPath = 'source/_includes/custom/lunr-search/'
  jasmine.getFixtures().fixturesPath = 'spec/javascripts/fixtures/app/public/'
  loadFixtures "index.html"

