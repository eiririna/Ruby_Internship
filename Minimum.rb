def remove_min(arr)
  arr.delete_at(arr.index(arr.min))
  return arr
end

arr = [4, 3, 5, 17, 9, 11, 12]
p remove_min(arr)

