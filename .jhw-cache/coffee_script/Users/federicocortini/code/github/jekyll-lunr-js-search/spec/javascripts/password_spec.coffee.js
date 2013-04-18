(function() {

  describe("Password", function() {
    it("should report bad passwords", function() {
      var password;
      password = new Password('bad');
      return (expect(password.strength)).toEqual(0);
    });
    it("should report average passwords", function() {
      var password;
      password = new Password('thisisaverage');
      return (expect(password.strength)).toEqual(4);
    });
    return it("should report good passwords", function() {
      var password;
      password = new Password('thisisagoodpasswordassaidbyxkcd');
      return (expect(password.strength)).toEqual(10);
    });
  });

}).call(this);
