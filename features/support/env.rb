require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/rspec'
require 'cucumber'
require 'rspec'
require 'site_prism'
require 'selenium-webdriver'
require 'byebug'
require 'pry'
require 'pry-byebug'
require 'report_builder'
require 'net/smtp'
require 'chilkat'
require 'mailfactory'
require 'nokogiri'
require 'html2text'
require 'json2table'
require 'json'

browser_name = ENV['BROWSER'] || "chrome"
@to_email = 'dzarazat@gmail.com'

# Configure Capybara with defaults
Capybara.configure do |config|
  config.default_driver = :selenium
end

# Register Firefox
Capybara.register_driver :selenium do |app|
  options = {
      :js_errors => false,
  }
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

# Register Chrome
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# Choose a driver to use
case browser_name.upcase
  when 'CHROME'
    Capybara.default_driver = :selenium_chrome
  when 'FF', 'FIREFOX'
     Capybara.default_driver = :selenium
  else
    raise("Browser '#{browser_name}' is not supported. Use Firefox, Chrome or Headless")
end
