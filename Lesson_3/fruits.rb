

# fruit_array = ["apple", "orange", "mango"]

# def eat_last(nom)
#   nom.delete_at(nom.length-1)
#   nom
# end

# p eat_last(fruit_array)



fruit_array2 = ["apple", "orange", "mango"]

def fruit_good(nom2)
  new_array = []
  nom2.each do |good|
    new_array << "#{good} is good"
  end
new_array
end

p fruit_good(fruit_array2)
