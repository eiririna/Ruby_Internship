def line_editor(str)
  str_arr = str.split('')
  new_arr = []
  (0..str_arr.size).each { |i|
    if (str_arr[i] != '#')
      new_arr << str_arr[i]
    else
      new_arr.pop
    end
  }
  return new_arr.join
end

str = gets.chomp
p str.split('')
p line_editor(str)