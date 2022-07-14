def str_to_hash(str)
  arr = str.split(', ')
  hash = {}
  arr.each do |elem|
    pair = elem.split('=')
    hash[pair[0]] = pair[1]
  end
  return hash
end

str = "a=1, b=2, c=3, d=4"
p str_to_hash(str)
