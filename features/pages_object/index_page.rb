class IndexPage < SitePrism::Page
  set_url "https://www.ebay.com/"
  set_url_matcher /ebay.com\/?/

  element :shop_category, :xpath, '//*[@id="gh-shop-a"]'
  element :shoes_link, :xpath, '//*[@id="gh-sbc"]/tbody/tr/td[1]/ul[3]/li[4]/a'
  element :text_search, :xpath, '//*[@id="gh-ac"]'
  element :btn_search, :xpath, '//*[@id="gh-btn"]'

  def input_text_search(text)
    text_search.set(text)
  end

  def click_btn_search
    btn_search.click
  end
end
