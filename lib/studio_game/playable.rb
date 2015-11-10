module StudioGame
        
    module Playable
      
        def blam
            @health -= 10
            #puts "I'm #{@name} with a health of #{@health}."
            puts "#{@name} got blammed!"
        end
        
        def w00t
            @health += 15
            puts "#{@name} got w00ted!"
        end
        
        def strong?
            @health > 100
        end
      
    end
    
end