module StringEditor
  def capitalize_each_word
    split(' ').map(&:capitalize).join(' ')
  end
end

class String
  include StringEditor
end

p 'string one'.capitalize_each_word
p 'string two'.capitalize_each_word
