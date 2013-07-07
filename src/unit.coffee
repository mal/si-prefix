module.exports = class Unit

  {abs, floor, log, max, pow} = Math
  round = (v) -> parseFloat v.toFixed 12
  sub = (a, b) -> a - b

  constructor: (@si, @unit) ->
    @baseln = log @si.base
    @limit = Object.keys(si).sort(sub).shift()

  format: (value, separator = '') ->
    @convert(value).join separator

  suffix: (value) ->
    @convert(value)[1]

  convert: (value) ->
    sign = value / value = abs value
    exp = max @limit, floor log(value) / @baseln
    while exp not of @si and exp > @limit
      exp--
    value = round sign * value / pow @si.base, exp
    [value, @si[exp] + @unit]
