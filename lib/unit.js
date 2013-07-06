// Generated by CoffeeScript 1.6.3
(function() {
  var Unit;

  module.exports = Unit = (function() {
    var abs, floor, log, max, pow, round, sub;

    abs = Math.abs, floor = Math.floor, log = Math.log, max = Math.max, pow = Math.pow;

    round = function(v) {
      return parseFloat(v.toFixed(13));
    };

    sub = function(a, b) {
      return a - b;
    };

    function Unit(si, unit) {
      this.si = si;
      this.unit = unit;
      this.baseln = log(this.si.base);
      this.limit = Object.keys(si).sort(sub).shift();
    }

    Unit.prototype.format = function(value, separator) {
      if (separator == null) {
        separator = '';
      }
      return this.factor(value).join(separator);
    };

    Unit.prototype.suffix = function(value) {
      return this.factor(value)[1];
    };

    Unit.prototype.factor = function(value) {
      var exp, sign;
      sign = value / (value = abs(value));
      exp = max(this.limit, floor(log(value) / this.baseln));
      while (!(exp in this.si) && exp > this.limit) {
        exp--;
      }
      value = round(sign * value / pow(this.si.base, exp));
      return [value, this.si[exp] + this.unit];
    };

    return Unit;

  })();

}).call(this);