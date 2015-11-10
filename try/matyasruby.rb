puts "Welcome Matyas!"

3.times do
    puts "kumbayaaa".capitalize
end

puts Time.now

name1 = "larry"
health1 = 60
puts "#{name1}'s health is #{health1 * 3}"

puts "Players: \n \t larry  \n \t curly  \n \t moe"
puts "#{name1.capitalize} has a health of #{health1}."

name2 = "curly"
health2 = 125
puts "#{name2.upcase} has a health of #{health2}."

name3 = "moe"
health3 = 100
puts "#{name3.capitalize} has a health of #{health3}.".center(50, '*')

name4 = "Shemp"
health4 = 90
puts "#{name4.ljust(30, '.')} has #{health4} health."

puts 123.to_s.reverse.to_i

current_time = Time.new
formatted_time = current_time.strftime("%A %m/%d/%Y at %I:%M%p")
puts "The game started on #{formatted_time}"


puts "+++++++++++++++++++++++++++++++++++++"

def say_hello(name, health=100)
   "I'm #{name.capitalize} with a health of #{health} as of #{time}."
end

def time
  current_time = Time.new
  current_time.strftime("%I:%M:%S")
end

puts say_hello("larry", 60)
puts say_hello("curly", 125)
puts say_hello("moe")
puts say_hello("shemp", 90)
