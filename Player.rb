class Player

  attr_accessor :name, :lives, :player

  def initialize(name, player)
    @name = name
    @lives = 3
    @player = player
  end



  def loose_life
    if self.lives > 0
      self.lives -= 1
    else
      self.lives = 0
    end
  end

end