
person  = {
  "name" => "Jay Tam",
  "age" => "34",
  "birth_state" => "NY",
}

state_abb = {
  "NY" => "New York",
  "NJ" => "New Jersey",
  "CA" => "California",
}


p "Hi my name is #{person["name"]}, I'm #{person["age"]} and I was born in #{state_abb["#{person["birth_state"]}"]}"


person2 = {
  name: "mary",
  age: "35",
  birth_state: "NY",
}

p "Hi my name is #{person2[:name]}, I'm #{person2[:age]} and I was born in #{state_abb["#{person2[:birth_state]}"]}"







def numtoword(num)
single = {
  1 => "One",
  2 => "Two",
  3 => "Three",
  4 => "Four",
  5 => "Five",
  6 => "Six",
  7 => "Seven",
  8 => "Eight",
  9 => "Nine",
}
teen = {
  11 => "Eleven",
  12 => "Twelve",
  13 => "Thirteen",
  14 => "Fourteen",
  15 => "Fifteen",
  16 => "Sixteen",
  17 => "Seventeen",
  18 => "Eighteen",
  19 => "Nineteen"
}

tens = {
  2 => "Twenty",
  3 => "Thirty",
  4 => "Forty",
  5 => "Fifty",
  6 => "Sixty",
  7 => "Seventy",
  8 => "Eighty",
  9 => "Ninety"
}
return single[num] if num < 10

return teen[num] if num > 10 && num < 20

tens_digit = num / 10
remainder = num % 10
return "#{tens[tens_digit]} #{numtoword(remainder)}" if num >= 20 && num < 100

hundred_digit = num / 100
remainder = num % 100

return "#{single[hundred_digit]} hundred &  #{numtoword(remainder)}" if num > 100 && num < 1000

thousand_digit = num / 1000
remainder = num % 1000

return "#{single[thousand_digit]} thousand &  #{numtoword(remainder)}" if num > 1000

end



puts numtoword(1991)