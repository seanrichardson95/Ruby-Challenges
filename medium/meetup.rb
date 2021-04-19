=begin

-Construct objects that represent a meetup date
  -Each object takes a month number (1-12)
  -and a year (e.g., 2021)
-The object should be able to determine the exact date of the meeting in the specified month and year
  -i.e., if you ask for 2nd wednesday of May 2021, the object should be able to determine that the meetup for that month will occur on 5/12/2021
-Descriptors are given as strings: 'first', 'second', 'third', 'fourth', 'fifth', 'last, and 'teenth' etc.
  -'teenth' can represent 13th - 19th
  -case is not important
  
day_of_wekk = 'monday', 'tuesday', etc.
nth_day = 'first', 'second', etc.
  
  
-Start at day of month
-Iterate through days, max is next month
-Return the day if it matches day of week and day of month

Find first, second, third, fourth same way
Find fifth
Find last
Find teenth
=end

require 'date'

class Meetup
  def initialize(year, month)
    @year = year
    @month = month
    @date = Date.new(year, month)
  end
  
  def day(day_of_week, nth_day)
    qualifier = case nth_day.downcase
                when "first" then 1
                when "second" then 2
                when "third" then 3
                when "fourth" then 4
                when "fifth" then 5
                else
                  nth_day
                end
    
    determine_date(day_of_week.downcase, qualifier)
  end
  
  def determine_date(day_of_week, qualifier)
    if qualifier.is_a?(Integer)
      counter = 0
      @date.upto(@date.next_month) do |day|
        return nil if day == @date.next_month
        counter += 1 if correct_day?(day, day_of_week)
        return day if counter == qualifier
      end

    else
      if qualifier == "last"
        @date.next_month.prev_day.downto(@date) do |day|
          return day if correct_day?(day,day_of_week)
        end
      elsif qualifier == "teenth"
        Date.new(@year, @month, 13).upto(@date.next_month) do |day|
          return day if correct_day?(day, day_of_week)
        end
      end
    end
  end
  
  def correct_day?(day, day_of_week)
    case day_of_week
    when "monday" then day.monday?
    when "tuesday" then day.tuesday?
    when "wednesday" then day.wednesday?
    when "thursday" then day.thursday?
    when "friday" then day.friday?
    when "saturday" then day.saturday?
    when "sunday" then day.sunday?
    end
  end
end