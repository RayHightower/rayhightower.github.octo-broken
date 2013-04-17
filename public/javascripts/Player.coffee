@Player = ->
Player::play = (song) ->
  @currentlyPlayingSong = song
  @isPlaying = true

Player::pause = ->
  @isPlaying = false

Player::resume = ->
  throw new Error("song is already playing")  if @isPlaying
  @isPlaying = true

Player::makeFavorite = ->
  @currentlyPlayingSong.persistFavoriteStatus true