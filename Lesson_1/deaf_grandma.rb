
# puts "say something to grandma"
# puts "she will respond with HUH?!  SPEAK UP, SONNY!, unless you shout it (type in all capitals)"
# puts "She will only end with you when you say BYE three times in a row"

# i = 0
# until i == 3 do
#   input = gets.chomp
#   puts "HUH?! SPEAK UP, SONNY!" unless input == input.upcase
#   puts "NO, NOT SINCE #{rand(1930..1950)}" if input == input.upcase

#   i = 0 unless input == "BYE"
#   i = i + 1 if input == "BYE"

# end


puts "You are talking to grandma but she is hard of hearing"
puts "for her response you need to yell at here in order for here to response"
bye_count = 0
talk = ''
until bye_count == 3 do
  talk = gets.chomp
  puts "HUH?! SPEAK UP, SONNY" unless talk == talk.upcase
  puts "NO, NOT SINCE #{rand(1938..1950)}!" if talk == talk.upcase
  bye_count = 0 unless talk == "BYE"
  bye_count += 1 if talk == "BYE"
end
puts "BYE SONNY!!!!