class Player
  attr_reader :user, :name
  attr_accessor :position

  def initialize(n, name, position)
    @user = n
    @name = name
    @position = position
  end
end
