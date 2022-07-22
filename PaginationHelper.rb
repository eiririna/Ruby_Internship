class PaginationHelper

  def initialize(arr, items_per_page)
    @arr = arr
    @items_per_page = items_per_page
  end

  def page_count
    (@arr.size / @items_per_page.to_f).ceil
  end

  def item_count
    @arr.size
  end

  def page_item_count(page)
    if page < 0 || page >= page_count
      -1
    elsif page < page_count - 1
      @items_per_page
    else
      item_count % @items_per_page
    end
  end

  def page_index (item_index)
    if item_index < 0 || item_index >= item_count
      -1
    else
      (item_index / @items_per_page.to_f).floor
    end
  end

end

helper = PaginationHelper.new(['a','b','c','d','e','f'], 4)
p helper.page_count # 2
p helper.item_count # 6
p helper.page_item_count(0)  # 4, т.к нумерация страниц с 0
p helper.page_item_count(1) # 2, последняя страница содержит 2 элемента
p helper.page_item_count(2) # -1

# page_index принимает индекс элемента и возвращает страницу, на которой этот элемент находится

p helper.page_index(5) # 1
p helper.page_index(2) # 0
p helper.page_index(20) # -1
p helper.page_index(-10) # -1