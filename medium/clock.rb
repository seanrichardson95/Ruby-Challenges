=begin

Create a clock that is independent of date

You should be able to add minutes to and subtract minutes from the time represented by a given clock object. Two clock objects that represent the same time should be equal to each other.

You may not use any built-in date or time functionality; just use arithmetic operations.

Notes:
-format of clock is 'hh:mm'

+ algorithm:
-If doesn't go past hour, add that amount of minutes to the clock (create new clock object?)
-if goes past hour, figure out how many hours it goes past
-create new clock with new hours and new minutes

- algorithm
=end

class Clock
  HOURS = ("00".."23").to_a
  MINUTES = ("00".."59").to_a
  
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
  end
  
  def self.at(hours, minutes = 0)
    hours_str = HOURS[hours]
    min_str = MINUTES[minutes]
    Clock.new(hours_str, min_str)
  end
  
  def to_s
    @hours + ":" + @minutes
  end
  
  def +(min)
    new_min_idx = MINUTES.index(@minutes) + min
    
    if new_min_idx < 59
      Clock.new(@hours, MINUTES[new_min_idx])
    else
      hours_passed = new_min_idx / 60
      new_hr_idx = (HOURS.index(@hours) + hours_passed) % 24
      Clock.new(HOURS[new_hr_idx], MINUTES[new_min_idx % 60])
    end
  end
  
  def -(min)
    new_min_idx = MINUTES.index(@minutes) - min
    if new_min_idx >= 0
      Clock.new(@hours, MINUTES[new_min_idx])
    else
      hours_lost = 1 + new_min_idx / (-60)
      new_hr_idx = (HOURS.index(@hours) - hours_lost) % 24
      Clock.new(HOURS[new_hr_idx], MINUTES[new_min_idx % 60])
    end
  end
  
  def ==(other)
    self.to_s == other.to_s
  end
end
