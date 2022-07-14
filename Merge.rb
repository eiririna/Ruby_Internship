def merge_arrays(arr1, arr2)
  merged = []
  if arr1[0] < arr2[0]
    merged.push(arr1.shift)
  else
    merged.push(arr2.shift)
  end
  if arr1.size == 0
    return merged + arr2
  elsif arr2.size == 0
    return merged + arr1
  else
    return merged + merge_arrays(arr1, arr2)
  end
end

arr1 = [1, 3, 5, 7, 9, 11, 12]
arr2 = [1, 2, 3, 4, 5]
p merge_arrays(arr1, arr2)