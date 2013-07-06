Scale = require '../../lib/scale'

check = (type, scale, base, expect) ->
  it "should describe a #{type} scale", ->
    count = 0
    for k, v of expect
      scale.should.have.ownProperty k, v
      count++
    count.should.equal Object.keys(expect).length

  it "should have a base of #{base}", ->
    scale.base.should.equal base

describe 'scale class', ->

  describe 'when no arguments passed', ->

    check 'generic', new Scale, 1000,
      1: 'k', 2: 'M', 3: 'G', 4: 'T', 5: 'P', 6: 'E', 7: 'Z', 8: 'Y'
      '-1': 'm', '-2': 'mc', '-3': 'n', '-4': 'p', '-5': 'f', '-6': 'a', '-7': 'z', '-8': 'y'
      0: ''

  describe 'when using minor exponents', ->

    check 'full', new Scale(minor: true), 10,
      1: 'da', 2: 'h', 3: 'k', 6: 'M', 9: 'G', 12: 'T', 15: 'P', 18: 'E', 21: 'Z', 24: 'Y'
      '-1': 'd', '-2': 'c', '-3': 'm', '-6': 'mc', '-9': 'n', '-12': 'p', '-15': 'f', '-18': 'a', '-21': 'z', '-24': 'y'
      0: ''

  describe 'when using no lower exponents', ->

    check 'macro', new Scale(below: false), 1000,
      1: 'k', 2: 'M', 3: 'G', 4: 'T', 5: 'P', 6: 'E', 7: 'Z', 8: 'Y'
      0: ''

  describe 'when using a base of 1024 (binary)', ->

    check 'alternate base', new Scale.Binary, 1024,
      1: 'Ki', 2: 'Mi', 3: 'Gi', 4: 'Ti', 5: 'Pi', 6: 'Ei', 7: 'Zi', 8: 'Yi'
      0: ''

  describe 'when using a shift of -1 (mass)', ->

    check 'shifted', new Scale.Mass, 1000,
      1: 'M', 2: 'G', 3: 'T', 4: 'P', 5: 'E', 6: 'Z', 7: 'Y'
      0: 'k', '-1': ''
