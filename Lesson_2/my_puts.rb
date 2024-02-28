puts "hello world"

def my_puts(*args, my_name:)
  args.each do |element|
  puts " #{my_name} #{element}"

  end
end


my_puts("Hello world", "get fucked", "in the ass", my_name: "fuck")
