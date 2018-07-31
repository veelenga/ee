var DnaTranscriber = function() {};

DnaTranscriber.prototype.toRna = function (dna) {
  return Array.from(dna).map(function(char) {
    switch (char) {
      case 'C': return 'G';
      case 'G': return 'C';
      case 'A': return 'U';
      case 'T': return 'A';
      default:
        throw new Error('Invalid input');
    }
  }).join('');
};

module.exports = DnaTranscriber;
