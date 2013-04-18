class @Password
  constructor: (passphrase) ->
    @strength = @calcStrength passphrase.length

  calcStrength: (len) ->
    len--
    if len / 3 > 10 # everything with a length-1 > 30 gets a strength of 10
      10
    else
      Math.floor len / 3 # everything else gets a strength of its length-1 divided by 3
