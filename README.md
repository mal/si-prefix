# SI Prefix

Module for converting [SI base units](http://en.wikipedia.org/wiki/SI_base_unit) into human readable form. It can also be easily extended to create other units.

[![Build Status](https://secure.travis-ci.org/mal/si-prefix.png)](http://travis-ci.org/mal/si-prefix)

## Install

~~~sh
$ npm install si-prefix
~~~

## Examples

### Basic Formatting

~~~js
var si = require('si-prefix');

var millimetres = si.metre.format(0.035, ' '),          //=> '35 mm'
    nanograms = si.kilogram.suffix(0.00000000094, ' '), //=> 'ng'
    kibibytes = si.byte.convert(2048),                  //=> [ 2, 'KiB' ]
    kilobytes = si.byte.decimal.convert(2048);          //=> [ 2.048, 'kB' ]
~~~

Units available by default are:
  * the seven SI base units
      * `metre`
      * `kilogram` - note that the base unit for mass is a `kilogram`, **NOT a gram**
      * `second`
      * `ampere`
      * `kelvin`
      * `mole`
      * `candela`
  * some SI derived units
      * `litre`
  * a few others
      * `byte` - using IEC [binary prefixes](http://en.wikipedia.org/wiki/Binary_prefix)
      * `byte.decimal` - using SI prefixes
      * `meter` - alias of `metre`
      * `liter` - alias of `litre`

### Custom Units

~~~js
var si = require('si-prefix');

// scale with hecto and deca prefixes
var scale = new si.Scale({minor: true}),
    unit = new si.Unit(scale, 'm');

var centimetres = unit.format(0.03, ' '); //=> '3 cm'
~~~

Other ways you can customise units include changing the prefixes, removing some exponents, altering the logarithm base and shifting prefixes up or down. You can see examples of this in [`scale.coffee`](/src/scale.coffee) where `Scale.Binary` and `Scale.Mass` are defined.

## Upcoming

  * Separate flags for hecto, deca, deci and centi
  * Other stuff? File issues if you got 'em!
