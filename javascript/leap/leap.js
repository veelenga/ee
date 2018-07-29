//
// This is only a SKELETON file for the "Leap" exercise. It's been provided as a
// convenience to get you started writing code faster.
//

var Year = function (year) {
  this.year = year;
};

Year.prototype.isLeap = function () {
  const by = num => this.year % num === 0;
  return by(4) && !by(100) || by(400);
};

module.exports = Year;
