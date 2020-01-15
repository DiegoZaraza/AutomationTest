include Helpers::Options

Given('Enter Ebay index page') do
  @index_page = IndexPage.new
  @index_page.load
end

And('Enter {string} for search object') do |product|
  @index_page.input_text_search(product)
  @index_page.click_btn_search
end

And('Check for brand {string}') do |brand|
  @search_page = SearchPage.new
  @search_page.check_brand(brand)
end

And('Check for size {string}') do |size|
  @search_page.check_size(size)
  @search_page.order_by('pprueba')
end

And('Get search result quantity') do
  puts "the results obtained in the search is: #{@search_page.get_text}"
end

And('Order by {string}') do |order|
  @search_page.order_by(order)
end

And('Get the first {int} search results') do |quantity|
  @products = @search_page.get_result_quantity(quantity)
end

And('Print the search results') do
  @products.each { |product, price| puts "#{product} - #{price}" }
end

And('Print the search results by name') do
  @products = @products.sort_by { |product, price| product }
  @products.each { |product, price| puts "#{product} - #{price}" }
end

And('Print the search results by price') do
  @products = @products.sort_by { |product, price| price }.reverse
  @products.each { |product, price| puts "#{product} - #{price}" }
end
