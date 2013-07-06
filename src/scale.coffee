class Scale

  {log, round} = Math
  log10 = log 10

  defaults =
    base: 1000
    minor: false
    shift: null
    above: 1: 'da', 2: 'h', 3: 'k', 6: 'M', 9: 'G', 12: 'T', 15: 'P', 18: 'E', 21: 'Z', 24: 'Y'
    below: 1: 'd', 2: 'c', 3: 'm', 6: 'mc', 9: 'n', 12: 'p', 15: 'f', 18: 'a', 21: 'z', 24: 'y'

  constructor: (opts) ->
    (opts ?= {}).__proto__ = defaults
    divisor = 3

    if opts.minor
      divisor = false
      unless Object.hasOwnProperty opts, 'base'
        opts.base = 10

    Object.defineProperty this, 'base', value: opts.base

    if opts.above
      @build opts.above, divisor, opts.shift

    if opts.below
      @build opts.below, divisor, opts.shift, -1

    @[0 + opts.shift] = ''

  build: (set, div, shift, flip = 1) ->
    for k, v of set
      k = parseInt k
      k /= div if div
      continue if k < 1
      k += shift * flip if shift
      @[round k * flip] = v

Scale.Binary = class BinaryScale extends Scale

  _above = 3: 'Ki', 6: 'Mi', 9: 'Gi', 12: 'Ti', 15: 'Pi', 18: 'Ei', 21: 'Zi', 24: 'Yi'

  constructor: ->
    super base: 1024, above: _above, below: false

Scale.Mass = class MassScale extends Scale

  constructor: ->
    super shift: -1

module.exports = Scale
