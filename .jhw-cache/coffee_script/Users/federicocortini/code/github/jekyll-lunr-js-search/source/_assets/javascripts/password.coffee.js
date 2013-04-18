(function() {

  this.Password = (function() {

    function Password(passphrase) {
      this.strength = this.calcStrength(passphrase.length);
    }

    Password.prototype.calcStrength = function(len) {
      len--;
      if (len / 3 > 10) {
        return 10;
      } else {
        return Math.floor(len / 3);
      }
    };

    return Password;

  })();

}).call(this);
