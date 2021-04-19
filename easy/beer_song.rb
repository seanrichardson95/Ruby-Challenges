=begin
Write a program that can generate the lyrics of the 99 Bottles of Beer song


Notes:
-Verses start at 99, that's one verse
  -If 3, then goes all the way from 99 to 3
  
Input:
-First int (starting num of beers)
-Second int (optional, last verse)

Output:
-String
-Different string for 0. Notes, 0 == "no more"
-whole song is output when you call BeerSong.lyrics

One verse:
"99 bottles of beer on the wall, 99 bottles of beer.\n" \
"Take one down and pass it around, 98 bottles of beer on the wall.\n"

"#{int} bottles of beer on the wall, #{int} bottles of beer.\n"
"Take one down and pass it around, #{int - 1} bottles of beer on the wall.\n"



=end

class BeerSong
  
  def self.verse(num)
    if num > 2
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    elsif num == 2
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
      "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
    elsif num == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    elsif num == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
  
  def self.verses(begin_verse, last_verse)
    verses = []
    begin_verse.downto(last_verse) do |current_verse|
      verses << self.verse(current_verse)
    end
    verses.join("\n")
  end
  
  def self.lyrics
    self.verses(99, 0)
  end
end