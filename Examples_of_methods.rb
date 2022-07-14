arr = [1, 2, 3, 4, 5, 6, 7, 8]
p arr.empty?
sum = arr.inject(:+)
p sum
even = arr.select { |i| i.even? }
p even
first_three_elem = arr.slice(0..2)
p first_three_elem
squares = arr.map { |i| i**2 }
p squares
odd = arr.delete_if { |i| i%2 == 0 }
p odd
arr.clear
p arr

names = ["Jimi Hendrix", "Jim Morrison", "Kurt Cobain", "Brian Jones", "Jim Morrison", "Jimi Hendrix", "Amy Winehouse"]
names.each_with_object(Hash.new(0)) do |elem, count_names|
  count_names[elem] += 1
end

hash = {a: 100, b: 200, c: 300}
p hash.invert
p hash.to_a.flatten

hash.each {|key, value| p "the value of #{key} is #{value}" }

range = (1..100)
p range.include?(27)
range.step(n = 10) { |i| print i/10 }
puts range.last