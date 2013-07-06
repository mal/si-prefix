Unit = require '../../lib/unit'

describe 'unit class', ->

  describe 'functions', ->

    unit = null

    before ->
      dec = 1: 'k', 0: ''
      Object.defineProperty dec, 'base', value: 1000
      unit = new Unit dec, '_'

    it 'should format units correctly', ->
      unit.format(1e3).should.equal '1k_'

    it 'should format units correctly with separator', ->
      unit.format(1e3, '-').should.equal '1-k_'

    it 'should output correct suffix', ->
      unit.suffix(1e3).should.equal 'k_'
      unit.suffix(1).should.equal '_'

  describe 'when using decimal scale', ->

    unit = null

    before ->
      dec = 3: 'G', 2: 'M', 1: 'k', 0: '', '-1': 'm', '-2': 'mc', '-3': 'n'
      Object.defineProperty dec, 'base', value: 1000
      unit = new Unit dec, '_'

    it 'should work with exact exponents', ->
      unit.factor(1e9).should.eql [ 1, 'G_' ]
      unit.factor(1e6).should.eql [ 1, 'M_' ]
      unit.factor(1e3).should.eql [ 1; 'k_' ]

    it 'should work with fuzzy exponents', ->
      unit.factor(5555000000).should.eql [ 5.555, 'G_' ]
      unit.factor(5555000).should.eql [ 5.555, 'M_' ]
      unit.factor(5555).should.eql [ 5.555, 'k_' ]

    it 'should work with missing exponents', ->
      unit.factor(1e11).should.eql [ 100, 'G_' ]
      unit.factor(1e10).should.eql [ 10, 'G_' ]
      unit.factor(1e8).should.eql [ 100, 'M_' ]
      unit.factor(1e7).should.eql [ 10, 'M_' ]
      unit.factor(1e5).should.eql [ 100, 'k_' ]
      unit.factor(1e4).should.eql [ 10, 'k_' ]

    it 'should work with missing fuzzy exponents', ->
      unit.factor(555500000000).should.eql [ 555.5, 'G_' ]
      unit.factor(55550000000).should.eql [ 55.55, 'G_' ]
      unit.factor(555500000).should.eql [ 555.5, 'M_' ]
      unit.factor(55550000).should.eql [ 55.55, 'M_' ]
      unit.factor(555500).should.eql [ 555.5, 'k_' ]
      unit.factor(55550).should.eql [ 55.55, 'k_' ]

    it 'should work with zero exponent', ->
      unit.factor(1).should.eql [ 1, '_' ]
      unit.factor(999).should.eql [ 999, '_' ]

    it 'should work with negative exponents', ->
      unit.factor(1e-3).should.eql [ 1, 'm_' ]
      unit.factor(1e-6).should.eql [ 1, 'mc_' ]
      unit.factor(1e-9).should.eql [ 1, 'n_' ]

  describe 'when using binary scale', ->

    unit = null

    before ->
      bin = 30: 'G', 20: 'M', 10: 'K', 0: ''
      Object.defineProperty bin, 'base', value: 2
      unit = new Unit bin, '_'

    it 'should work with exact exponents', ->
      unit.factor(1073741824).should.eql [ 1, 'G_' ]
      unit.factor(1048576).should.eql [ 1, 'M_' ]
      unit.factor(1024).should.eql [ 1, 'K_' ]

    it 'should work with fuzzy exponents', ->
      unit.factor(5905580032).should.eql [ 5.5, 'G_' ]
      unit.factor(5767168).should.eql [ 5.5, 'M_' ]
      unit.factor(5632).should.eql [ 5.5, 'K_' ]

    it 'should work with missing exponents', ->
      unit.factor(1073741824000).should.eql [ 1000, 'G_' ]
      unit.factor(107374182400).should.eql [ 100, 'G_' ]
      unit.factor(10737418240).should.eql [ 10, 'G_' ]
      unit.factor(1048576000).should.eql [ 1000, 'M_' ]
      unit.factor(104857600).should.eql [ 100, 'M_' ]
      unit.factor(10485760).should.eql [ 10, 'M_' ]
      unit.factor(1024000).should.eql [ 1000, 'K_' ]
      unit.factor(102400).should.eql [ 100, 'K_' ]
      unit.factor(10240).should.eql [ 10, 'K_' ]

    it 'should work with missing fuzzy exponents', ->
      unit.factor(596463583232).should.eql [ 555.5, 'G_' ]
      unit.factor(59592671232).should.eql [ 55.5, 'G_' ]
      unit.factor(582483968).should.eql [ 555.5, 'M_' ]
      unit.factor(58195968).should.eql [ 55.5, 'M_' ]
      unit.factor(568832).should.eql [ 555.5, 'K_' ]
      unit.factor(56832).should.eql [ 55.5, 'K_' ]

    it 'should work with zero exponent', ->
      unit.factor(1).should.eql [ 1, '_' ]
      unit.factor(1023).should.eql [ 1023, '_' ]
