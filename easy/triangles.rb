=begin

Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.
________________________________

Input:
-3 sides, Integers

Output:
-String
  -"Equilateral" : all 3 sides are the same
  -"Isosceles" : two sides have the same length
  -"Scalene" : has all sides of different lengths
  -"Not a triangle" : All sides must be of length > 0 OR Sum of lengths of shorter two sides is less than greater side

Algorithm, determining type of triangle:
Input: sorted sides, Array
-equilaterial if
  -all sides are equal to first size
-isocoles
  -first two or last two sides are equal
-scalene
  -else

=end

class Triangle
  attr_reader :kind, :sides
  
  def initialize(s1, s2, s3)
    raise ArgumentError unless Triangle.valid_triangle?(s1, s2, s3)
    @sides = [s1, s2, s3].sort
    @kind = kind_of_triangle
  end
  
  def kind_of_triangle
    if sides.all? { |s| s == sides[0] }
      'equilateral'
    elsif (sides[0] == sides[1]) || (sides[1] == sides[2])
      'isosceles'
    else
      'scalene'
    end
  end
  
  def self.valid_triangle?(s1, s2, s3)
    return false if [s1, s2, s3].any? { |s| s <= 0 }
    sorted_sides = [s1, s2, s3].sort
    (sorted_sides[0] + sorted_sides[1]) > sorted_sides[2]
  end
end