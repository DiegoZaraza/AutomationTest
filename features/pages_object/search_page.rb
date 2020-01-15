class SearchPage < SitePrism::Page
    element :search_brand, :xpath, '//*[@id="w4-w12-0[0]"]'
    element :checkbox_brand, :xpath, '//*[@id="w4-w12"]/ul'
    element :checkbox_size, :xpath, '//*[@id="x-refine__group_1__0"]/ul'
    element :select_order, :xpath, '//*[@id="w9"]'
    element :text_result, :xpath, '//*[@id="mainContent"]/div[1]/div/div[2]/div[1]/div[1]/h1/span[1]'
    element :container_result, :xpath, '//*[@id="srp-river-results"]/ul'
    element :click_all_result, :xpath, '//*[@id="srp-river-results-message1"]/div/p/a/span'

    def check_brand(brand)
      checkbox_brand.all('li').find do |brand_id|
        if brand_id.text.split(' ')[0].eql?(brand)
          brand_id.all('div')[1].click
        end
      end
    end

    def check_size(size)
      checkbox_size.all('li').find do |size_id|
        if size_id.text.split(' ')[0].eql?(size)
          size_id.all('div')[1].click
        end
      end
    end

    def get_text
      text_result.text
    end

    def order_by(option)
      select_order.double_click
      select_order.all('li').find do |option_id|
        if option_id.text.eql?(option)
          option_id.click
        end
      end
    end

    def get_result_quantity(quantity)
      # click_all_result.visible? ? click_all_result.click
      product = container_result.all(:xpath, '//*[@class="s-item__title"]').map(&:text)
      price = container_result.all(:xpath, '//*[@class="s-item__price"]').map(&:text)
      final_prices = []
      price.each { |element| final_prices.push((element.split('$')[1].gsub ' ','').to_f) }
      products = product.zip(final_prices)
      products_quantity = []

      quantity.times do |i|
        products_quantity.push(products[i])
      end
      products_quantity.to_h
    end
end
