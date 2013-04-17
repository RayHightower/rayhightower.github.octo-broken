(function() {
  var Player;

  Player = function() {};

  Player.prototype.play = function(song) {
    this.currentlyPlayingSong = song;
    return this.isPlaying = true;
  };

  Player.prototype.pause = function() {
    return this.isPlaying = false;
  };

  Player.prototype.resume = function() {
    if (this.isPlaying) {
      throw new Error("song is already playing");
    }
    return this.isPlaying = true;
  };

  Player.prototype.makeFavorite = function() {
    return this.currentlyPlayingSong.persistFavoriteStatus(true);
  };

}).call(this);
