class Snake
  attr_reader :head, :tail

  def initialize(head, tail)
    @head = head
    @tail = tail
  end

  def self.input(n)
    print "Snake #{n}: "
    positions = gets.chomp.split(" ")
    start = positions[0]&.to_i
    finish = positions[1]&.to_i

    if !start or !finish
      puts I18n.t('errors.snake.both')
      self.input(n)
    elsif (start < 2 or start > 99 or finish < 1 or finish > 98)
      puts I18n.t('errors.snake.head_tail_value')
      self.input(n)
    elsif finish >= start
      puts I18n.t('errors.snake.head_n_tail')
      self.input(n)
    else
      Snake.new(start, finish)
    end
  end

end
