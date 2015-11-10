require 'studio_game/player'

module StudioGame
  
  class BerserkPlayer < Player
    
    def initialize(name, health=100)
      super(name, health)
      @woot_count = 0
    end
    
    def berserk?
      @woot_count > 5
    end
    
    def w00t
      super
      @woot_count += 1
      if berserk?
        puts "Berserker is berserk!"
      end
    end
    
    def blam
      if berserk?
        w00t
      else
        super
      end
    end
  end

end
  
if __FILE__ == $0
  berserker = BerserkPlayer.new("berserker", 50)
  6.times { berserker.w00t }
  2.times { berserker.w00t }
  puts berserker.health
end