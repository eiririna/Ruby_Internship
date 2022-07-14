def ranks(arr)
  keys = [*0..arr.size-1]
  keys_and_values = Hash[keys.zip(arr)]  #хэш, где ключи являются индексами, значения - массив, который вводится
  sorted_hash = keys_and_values.sort_by{|k, v| v}.reverse.to_h #сортируем хэш по значениям по убыванию
  values = sorted_hash.values
  sorted_ranks = values.map {|elem| values.index(elem) + 1} #считаем ранги с помощью поиска первого вхождения индекса с определенным значением
  keys = sorted_hash.keys
  keys_and_sorted_ranks = Hash[keys.zip(sorted_ranks)] #соединяем перемешанные индексы с значениями рангов
  result = keys_and_sorted_ranks.sort_by{|k, v| k}.to_h #расставляем ранги в правильном порядке
  return result.values
end

arr = [3, 3, 3, 3, 3, 5, 1]
p ranks(arr)