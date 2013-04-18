describe "Password", ->

  it "should report bad passwords", ->
    password = new Password 'bad'
    
    (expect password.strength).toEqual 0
  
  it "should report average passwords", ->
    password = new Password 'thisisaverage'

    (expect password.strength).toEqual 4
  
  it "should report good passwords", ->
    password = new Password 'thisisagoodpasswordassaidbyxkcd'
    
    (expect password.strength).toEqual 10

