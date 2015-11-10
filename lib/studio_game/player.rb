require 'studio_game/treasure_trove'
require 'studio_game/playable'


module StudioGame

    class Player
      
        include Playable
      
        attr_reader :health
        attr_accessor :name
        
        def initialize(name, health=100)
            @name = name.capitalize
            @health = health
            @found_treasures = Hash.new(0)
        end
        
        def say_hello
            "I'm #{@name} with a health of #{@health} and a score of #{score}"
        end
        
        def score 
            @health + points
        end
        
        def to_s
            "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
        end
        
        def <=>(other) 
            other.score <=> score
        end
        
        def found_treasure(treasure)
            @found_treasures[treasure.name] += treasure.points
            puts "#{@name} found a #{treasure.name} worht #{treasure.points} points."
            puts "#{@name}'s treasures: #{@found_treasures}"
        end
        
        def points
            @found_treasures.values.reduce(0, :+)
        end
        
        def each_found_treasure
          @found_treasures.each do |name, points|
            yield Treasure.new(name, points)
          end
        end
        
        def self.from_csv(string)
          name, health = string.split(',')
          Player.new(name, Integer(health))
        end
        
    end
    
    if __FILE__ == $0
      player = Player.new("moe")
      puts player.name
      puts player.health
      player.w00t
      puts player.health
      player.blam
      puts player.health
    end

end