class Game
  attr_reader :snakes, :ladders, :players, :winner

  def initialize()
    @snakes = []
    @ladders = []
    @players = []
    @winner = nil
  end

  def snake_bite(new_position)
    @snakes.select{ |sn| sn.head == new_position}[0].tail
  end
  
  def climb_ladder(new_position)
    @ladders.select{ |sn| sn.start == new_position}[0].finish
  end
  
  def play
    while (@winner == nil) do
      players.each do |plr|
        aaya = [1,2,3,4,5,6].sample
        old_position = plr.position
        new_position = old_position + aaya
    
        if new_position == 100
          @winner = plr
          puts "Player #{plr.name} rolled a #{aaya} and position changed from #{old_position} to #{new_position}"
          puts "$$$$$$$$$$ $$$$$$$$ $$$$$$$$$$$ $$$$$$$$$$ $$$$$$$$$ $$$$$$$$$$"
          puts "$$$$$$$$$$ We have a winner #{@winner.name} $$$$$$$$$$"
          puts "$$$$$$$$$$ $$$$$$$$ $$$$$$$$$$$ $$$$$$$$$$ $$$$$$$$$ $$$$$$$$$$"
          break
        elsif new_position > 100
          puts "Player #{plr.name} rolled a #{aaya} and position cannot changed from #{old_position}"
        else
          new_position = self.snake_bite(new_position) if snakes.map(&:head).include?(new_position)
          new_position = self.climb_ladder(new_position) if ladders.map(&:start).include?(new_position)
      
          puts "Player #{plr.name} rolled a #{aaya} and position changed from #{old_position} to #{new_position}"
          players.find{|pl| pl.name == plr.name}.position = new_position
        end
      end
    end    
  end
end
