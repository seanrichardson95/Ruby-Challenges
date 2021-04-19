=begin

Write a program that can calculate the Hamming distance between two DNA strands.

The simplest and most common type of nucleic acid mutation is a point mutation, which replaces one base with another at a single nucleotide.

By counting the number of differences between two homologous DNA strands taken from different genomes with a common ancestor, we get a measure of the minimum number of point mutations that could have occurred on the evolutionary path between the two strands.

This is called the Hamming distance.
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^

The Hamming distance between these two DNA strands is 7.

The Hamming distance is only defined for sequences of equal length. If you have two sequences of unequal length, you should compute the Hamming distance over the shorter length.


=end

class DNA
  def initialize(sequence)
    @sequence = sequence
  end
  
  def hamming_distance(other_sequence)
    sorted_seqs = [@sequence, other_sequence].sort_by { |s| s.size }
    differences = 0
    
    sorted_seqs[0].size.times do |idx|
      differences += 1 unless sorted_seqs[0][idx] == sorted_seqs[1][idx]
    end
    differences
  end
end