def sum(arr)
  if arr.size == 0
    return 0
  else
    return sum(arr) + arr.shift
  end
end
puts sum([1, 2, 3, 4])
