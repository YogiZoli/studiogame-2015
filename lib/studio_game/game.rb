#require "player"
#require 'pry'
#pry.binding

require 'studio_game/player'
require 'studio_game/die'
require 'studio_game/game_turn'
require 'studio_game/treasure_trove'

module StudioGame
    
    class Game 
       attr_reader :title
       
       def initialize(title)
          @title = title
          @players = []
       end
       
       def add_player(a_player)
           @players << a_player
       end
       
        def load_players(source_file)
          File.readlines(source_file).each do |line|
            add_player(Player.from_csv(line))
          end
        end
        
       
        def play(rounds=2)
          
          puts "\nThere are #{@players.size} players in #{@title}: "
        
          1.upto(rounds) do |round|
             puts '###############################################################'
             puts "This is round number #{round}: \n" 
              @players.each do |player|
                GameTurn.take_turn(player)
                puts player.name
              end
          end
            
          @players.each do |player|
            puts player.name
          end
          
          
          treasures = TreasureTrove::TREASURES
          puts "\nThere are #{treasures.size} treasures to be found:\n"
          treasures.each do |treasure|
            puts "A #{treasure.name} is worth #{treasure.points} points."
          end
          
        end
        
        def print_stats
           strong_players, wimpy_players = @players.partition { |p| p.strong? } 
           
            #strong_players = @players.select { |player| player.strong? }
            #wimpy_players = @players.reject { |player| player.strong? }
            
            puts "\n#{@title} Statistics:"
            
            puts "\n#{strong_players.size} strong players:"
            strong_players.each do |player|
                print_name_and_health(player)
            end
            
            puts "\n#{wimpy_players.size} wimpy players:\n"
            wimpy_players.each do |player|
                print_name_and_health(player)
            end
            
            puts "\n#{title} High Scores:"
            @players.sort.each do |player|
             puts high_score_entry(player)
            end
            
            puts "\nTotal points of players:\n\n"
            @players.each do |player|
                puts "\n#{player.name}\'s point totals:"
                player.each_found_treasure do |treasure|
                  puts "#{treasure.points} total #{treasure.name} points"
                end
                puts "#{player.points} grand total points \n"
            end
            
            puts "\n#{total_points} total points from treasures found\n "
            
        end
        
        def print_name_and_health(player)
            puts "#{player.name} (#{player.health})"
        end
        
        def high_score_entry(player)
          formatted_name = player.name.ljust(20, '.')
          "#{formatted_name} #{player.score}\n"
        end
        
        def total_points
          @players.reduce(0) { |sum, player| sum + player.points }
        end
        
        def save_high_scores(target_file="high_scores.txt")
          File.open(target_file, "w") do |file|
            file.puts "#{@title} High Scores:"
            @players.sort.each do |player|
              file.puts high_score_entry(player)
            end
          end
        end
    
    end

end

if __FILE__ == $0
        puts "this is the game file"
end