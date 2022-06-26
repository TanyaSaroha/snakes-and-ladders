class Player
  attr_reader :user, :name
  attr_accessor :position

  def initialize(n, name, position)
    @user = n
    @name = name
    @position = position
  end

  def self.input(n)
    print "Player #{n}: "
    name = gets.chomp
  
    if !name
      puts I18n.t('errors.player.name')
      self.input(n)
    else
      Player.new(n, name, 0)
    end
  end
  
end
