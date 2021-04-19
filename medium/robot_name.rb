=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which means that their name gets wiped. The next time you ask, it will respond with a new random name.

The names must be random; they should not follow a predictable sequence. Random names means there is a risk of collisions. Your solution should not allow the use of the same name twice when avoidable.

Notes:
-When robots come off factory floor, they have no name
-When you boot them up, a RANDOM name is generated (ex. RX837, BC811)
  -Looks like two letters then three numbers?
-When you reset robot, their name gets wiped, next time you boot them up, they get a new random name
-Even though names will be random, we should avoid duplicates
  -Have some database (maybe class variable) of names that we can compare with

-The name_regex is two uppercase letters and three numbers
-Robots get assigned a name the first time robot.name is called
-Need a reset function
=end

class Robot
  LETTERS = ("A".."Z").to_a
  NUMBERS = (0..9).to_a.map(&:to_s)
  
  @@robot_names = []
  
  def initialize
    @name = ""
  end
  
  def reset
    @@robot_names.delete(@name)
    @name = ""
  end
  
  def name
    generate_name if @name == ""
    @name
  end
  
  private
  
  def generate_name
    2.times {|i| @name << LETTERS.sample}
    3.times {|i| @name << NUMBERS.sample}
    
    if @@robot_names.include? @name
      index_of_last_num = NUMBERS.index(@name[-1])
      @name = @name[0..-2]
      @name << NUMBERS[index_of_last_num - 1]
    end
    
    @@robot_names << @name
  end
end