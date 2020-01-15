Before do |scenario|
  page.driver.browser.manage.window.maximize
end

After do |scenario|
  time = Time.now.getutc
  ReportBuilder.configure do |config|
   config.json_path = 'report.json'
   config.report_path = 'cucumber_web_report'
   config.report_types = [:html]
   config.report_tabs = %w[Overview Features Scenarios Errors]
   config.report_title = 'Cucumber web automation test results'
   config.compress_images = false
   config.additional_info = { 'Project name' => 'Test', 'Platform' => 'Integration', 'Report generated' => time }
  end

  ReportBuilder.build_report
end

at_exit do
  FROM_EMAIL = "pruebasbelatrixdazt@gmail.com"
  PASSWORD = "opqufsjlcflkhgel"
  TO_EMAIL = @to_email

  smtp = Net::SMTP.new('smtp.gmail.com', 587)
  smtp.enable_starttls

  message = <<MESSAGE_END
From: <#{FROM_EMAIL}>
To: <#{TO_EMAIL}
MIME-Version: 1.0
Content-type: text/html
Subject: Result Test Shoes Ebay
#{convert_json}
MESSAGE_END

  smtp.start('gmail.com', FROM_EMAIL, PASSWORD, :plain) do |mail|
    mail.send_message message, FROM_EMAIL, TO_EMAIL
  end
end
