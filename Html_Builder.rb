class HtmlBuilder
  attr_reader :result

  def initialize(&block)
    @result = ""
    @space = 1
    block.call(self) if block_given?
  end

  def html_doc!
    if @result != ""
      @result = "<html>\n#{@result}</html>"
    end
  end

  private

  def method_missing(m, *args, class_name:nil,  &block)
    @result += if class_name.nil?
                 " " * @space + "<#{m}>"
               else
                 " " * @space + "<#{m} class=\"#{class_name}\">"
               end
    @result += if args.empty? && !block_given?
                 "/>"
               else
                 "#{args.first}"
               end

    if block_given?
      @result += "\n"
      @space += 1
      block.call(self)
      @space -= 1
    end

    @result += block_given? ? " " * @space + "</#{m}>" : "</#{m}>" if block_given? || !args.empty?
    @result += "\n"
  end

end

html_builder = HtmlBuilder.new do |html|
  html.body do |body|
    body.h1('Hello!', class_name: 'h1-formatted margin-10')

    body.p('This is paragraph') do |p|
      p.p('Paragraph inside paragraph')
    end

    body.div('New div element') do |div|
      div.p('Paragraph in div')
    end

    body.div(class_name: 'empty-div')
  end
end

puts html_builder.html_doc!