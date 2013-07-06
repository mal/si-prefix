module.exports = class Unit

  {abs, floor, log, max, pow} = Math
  round = (v) -> parseFloat v.toFixed 13
  sub = (a, b) -> a - b

  constructor: (@si, @unit) ->
    @baseln = log @si.base
    @limit = Object.keys(si).sort(sub).shift()

  format: (value, separator = '') ->
    @factor(value).join separator

  suffix: (value) ->
    @factor(value)[1]

  factor: (value) ->
    sign = value / value = abs value
    exp = max @limit, floor log(value) / @baseln
    while exp not of @si and exp > @limit
      exp--
    value = round sign * value / pow @si.base, exp
    [value, @si[exp] + @unit]
