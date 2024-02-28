puts "Sora: I've been having these weird thoughts lately"
puts "      Like, is any of this for real, or not?"
puts "--------"

puts "King Mickey: So much to do, so little time.."
puts "             Take your time"
puts "             Don't be afraid"
puts "             The door is still shut."
puts "--------"

puts "King Mickey: Now, step forward"
puts "             Can you do it?"
puts " Type left to walk or RUN to run (keep in mind lower/uppercase"
puts " must type walk & RUN to proceed"
input = ''
ranned = ''
walked = ''

until walked == "yes" && ranned == "yes" do
  input = gets.chomp
  walked = "yes" if input == "walk"
  ranned = "yes" if input == "RUN"
  puts "[walking]" if input == "walk"
  puts "[running]" if input == "RUN"
  puts "[nothing]" unless input == "RUN" || input == "walk"
end

puts "King Mickey: Power sleeps within you…"