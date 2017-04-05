require 'selenium-webdriver'
require_relative '_login.rb'

def configureWebdriver()
	config = Selenium::WebDriver::Remote::Capabilities.chrome
	config[:logging_prefs] = {:browser => "SEVERE"}
	driver = Selenium::WebDriver.for :chrome, driver_path:"chromedriver.exe", :desired_capabilities=>config
	driver.navigate.to "https://pinterest.com"
	return driver
end

def loginFromHomepage(driver, username, password)
	#Find the username login box
	loginInputBox = driver.find_element(:css, 'body > div.App.AppBase.Module > div > div.mainContainer > div > div > div > ' +
		'div:nth-child(3) > div > div:nth-child(2) > div > div:nth-child(2) > div:nth-child(3) > div > form > ' +
		'fieldset:nth-child(1) > input[type="email"]')
	loginInputBox.send_keys(username)

	#Find the password login box
	passwordInputBox = driver.find_element(:css, 'body > div.App.AppBase.Module > div > div.mainContainer > div > div > ' +
		'div > div:nth-child(3) > div > div:nth-child(2) > div > div:nth-child(2) > div:nth-child(3) > div > form > ' +
		'fieldset:nth-child(2) > input[type="password"]')
	passwordInputBox.send_keys(password)

	#Find the continue button
	continueButton = driver.find_element(:css, 'body > div.App.AppBase.Module > div > div.mainContainer > div > div > div > ' +
		'div:nth-child(3) > div > div:nth-child(2) > div > div:nth-child(2) > div:nth-child(3) > div > form > button')
	continueButton.click
end


def main
	driver = configureWebdriver()
	loginFromHomepage(driver, $login[:userName], $login[:password])

	globdriver2 = configureWebdriver()
	loginFromHomepage(globdriver2, 'DonJuan', 'dickdickerson')

	sleep(100);
end
