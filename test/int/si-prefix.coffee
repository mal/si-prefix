si = require '../../'

check = (unit, suffix) ->

  describe unit, ->

    it 'should handle a few basic formats', ->
      si[unit].format(12446).should.equal '12.446k' + suffix
      si[unit].format(0.0938).should.equal '93.8m' + suffix
      si[unit].format(157).should.equal '157' + suffix

describe 'si-prefix', ->

  describe 'publically', ->

    it 'should expose official si units', ->
      si.should.have.property 'metre'
      si.should.have.property 'kilogram'
      si.should.have.property 'second'
      si.should.have.property 'ampere'
      si.should.have.property 'kelvin'
      si.should.have.property 'mole'
      si.should.have.property 'candela'

    it 'should expose semi-official si units', ->
      si.should.have.property 'byte'
      si.byte.should.have.property 'decimal'

    it 'should expose some unofficial si units', ->
      si.should.have.property 'litre'

    it 'should expose americanised names', ->
      si.should.have.property 'meter'
      si.should.have.property 'liter'

    it 'should expose classes for building custom units', ->
      si.should.have.property 'Scale'
      si.should.have.property 'Unit'

  check 'metre', 'm'

  describe 'kilogram', ->

    it 'should handle a few basic formats', ->
      si.kilogram.format(12446).should.equal '12.446Mg'
      si.kilogram.format(0.0938).should.equal '93.8g'
      si.kilogram.format(157).should.equal '157kg'

  check 'second', 's'
  check 'ampere', 'A'
  check 'kelvin', 'K'
  check 'mole', 'mol'
  check 'candela', 'cd'

  describe 'byte', ->

    it 'should handle a few basic formats', ->
      si.byte.format(12544).should.equal '12.25KiB'
      si.byte.format(0.0938).should.equal '0.0938B'
      si.byte.format(157).should.equal '157B'

  describe 'byte (decimal)', ->

    it 'should handle a few basic formats', ->
      si.byte.decimal.format(12446).should.equal '12.446kB'
      si.byte.decimal.format(0.0938).should.equal '0.0938B'
      si.byte.decimal.format(157).should.equal '157B'

  check 'litre', 'l'
