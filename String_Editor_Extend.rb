module StringEditor
  def capitalize_each_word
    split(' ').map(&:capitalize).join(' ')
  end
end

str1 = 'string one'
str2 = 'string two'

str1.extend(StringEditor)

p str1.capitalize_each_word
# p str2.capitalize_each_word undefined method
