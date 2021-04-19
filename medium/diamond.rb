=begin
The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

the first row contains one 'A'
The last row contains one 'A'.
All rows, except the first and last, have exactly two identical letters.
The diamond is horizontally symmetric.
The diamond is vertically symmetric.
The diamond has a square shape (width equals height).
The letters form a diamond shape.
The top half has the letters in ascending order.
The bottom half has the letters in descending order.
The four corners (containing the spaces) are triangles.

Input:
-letter

Output:
-Diamond
  -number of rows correspond to the letter
    -A has 1 row
    -B has 3 rows
    -C has 5 rows
  -In between each row is a number of spaces
  -Each diamond has a top half, a bottom half, and a middle
    -If the third letter (C), then first row is two spaces and an "A"
    -Second row is one space then a "B", then one space and a "B"
    -Third row is a "C", then 3 spaces then a "C"
    -fourth row is same as second row
    -fifth row is same as first row

Notes:
-only uppercase letters? I guess so
    
Data Structure
-Array of Strings
-Need a constant array of letters, the index of the letters can be used to determine the size of the nested arrays

Algorithm:
-Find index of letter and then save it as top_layers
-Determine total @width, which is (index of letter)*2 + 1
-Create empty nested array
-Create the top layers
-Create middle layers
-Create bottom layers
-Turn each layer into its own string
-puts array of strings

Top_Layers
-Use top_layers.times to create string |current_layer|
  -front_spaces = top_layers - current_layer
  -middle_spaces = width - front_spaces - 2
  -if middle_spaces > 0
    -arr << front_spaces * " " + letters[current_layer] + middle_spaces * " " + letters[current_letter]
=end

class Diamond
  LETTERS = ("A".."Z").to_a
  def self.make_diamond(letter)
    @widest_letter = letter
    @num_top_layers = LETTERS.index(letter)
    @width = @num_top_layers * 2 + 1
    @diamond_arr = []
    self.create_top_layer
    self.create_middle_layer
    self.create_bottom_layer
    return @diamond_arr.join
  end
  
  private
  
  def self.create_top_layer
    @num_top_layers.times do |current_layer|
      outside_s = @num_top_layers - current_layer
      inside_s = @width - outside_s*2 - 2
      letter = LETTERS[current_layer]
      if current_layer > 0
        @diamond_arr << (" " * outside_s + letter + " " * inside_s + letter +
                         " " * outside_s + "\n")
      else
        @diamond_arr << (" " * outside_s + letter + " " * outside_s + "\n")
      end
    end
  end
  
  def self.create_middle_layer
    inside_s = @width - 2
    if inside_s > 0
      @diamond_arr << @widest_letter + " " * inside_s + @widest_letter + "\n"
    else
      @diamond_arr << @widest_letter + "\n"
    end
  end
  
  def self.create_bottom_layer
    layers = []
    @num_top_layers.times do |current_layer|
      layers << @diamond_arr.reverse[current_layer+1]
    end
    layers.each {|layer| @diamond_arr << layer}
  end
end

# Diamond.make_diamond("A")
# Diamond.make_diamond("E")