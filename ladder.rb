class Ladder
  attr_reader :start, :finish

  def initialize(start, finish)
    @start = start
    @finish = finish
  end

  def self.input(n)
    print "Ladder #{n}: "
    positions = gets.chomp.split(" ")
    start = positions[0]&.to_i
    finish = positions[1]&.to_i
  
    if !start or !finish
      puts I18n.t('errors.ladder.give_both')
      self.input(n)
    elsif (start < 1 or start > 98 or finish < 2 or finish > 99)
      puts I18n.t('errors.ladder.head_tail_value')
      self.input(n)
    elsif start >= finish
      puts I18n.t('errors.ladder.head_tail_value')
      self.input(n)
    else
      Ladder.new(start, finish)
    end
  end

end
