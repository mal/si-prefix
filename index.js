// imports
var Scale = require('./lib/scale'),
    Unit = require('./lib/unit');

// standard scale
var scale = new Scale;

// standard units
var units = {

    // official

    // length
    metre: new Unit(scale, 'm'),
    // mass
    kilogram: new Unit(new Scale.Mass, 'g'),
    // time
    second: new Unit(scale, 's'),
    // electric current
    ampere: new Unit(scale, 'A'),
    // thermodynamic temperature
    kelvin: new Unit(scale, 'K'),
    // amount of substance
    mole: new Unit(scale, 'mol'),
    // luminous intensity
    candela: new Unit(scale, 'cd'),

    // memory
    byte: new Unit(new Scale.Binary, 'B'),

    // unofficial

    // volume
    litre: new Unit(scale, 'l')
};

// memory (decimal)
units.byte.decimal = new Unit(new Scale({
    below: false
}), 'B');

// for our american friends
units.meter = units.metre;
units.liter = units.litre;

// build your own
units.Scale = Scale;
units.Unit = Unit;

// export
module.exports = units;
