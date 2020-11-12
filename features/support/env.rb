require 'rest-client'
require 'active_support/all'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec/core'

Capybara.register_driver :chrome do |app|
  Selenium::WebDriver::Chrome.driver_path = '/home/oem/test_project/features/config/chromedriver'
  profile = Selenium::WebDriver::Chrome::Profile.new
  profile['profile.default_content_settings.popups'] = 0
  profile['browser.helperApps.neverAsk.saveToDisk'] = 'application/octet-stream, text/xml'
  Capybara::Selenium::Driver.new(app, browser: :chrome,
                                 desired_capabilities: Selenium::WebDriver::Remote::Capabilities.chrome(
                                     'chromeOptions' => {
                                         'args' => ['--window-size=1920,1080'],
                                         'prefs' => {
                                             'download.default_directory' => Dir.pwd + '/features/tmp/',
                                             'download.prompt_for_download' => false
                                         }
                                     }
                                 ))
end
Capybara.default_driver = :chrome
Capybara.page.driver.browser.manage.window.maximize
Capybara.default_selector = :xpath
Capybara.default_max_wait_time = 15
Capybara.page.driver.browser.manage.timeouts.page_load = 20