require 'selenium-webdriver' # load in the webdriver gem to interact with Selenium
require "test/unit/assertions"
include Test::Unit::Assertions

#Run chromedriver.exe to get chrome browser
driver = Selenium::WebDriver.for :chrome
#to define wait state in script execution and it is explicitly wait
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
def document_initialised(driver)
  driver.execute_script('return initialised')
end
# begin
#Code will begin/start from here
driver.get 'https://www.google.com'
#driver will wait untill element is not visibled
wait.until{|document_initialised| driver}
search_form = driver.find_element(:css,"input[name='q']").text
"Hello from JavaScript!".eql? search_form
driver.manage.window.maximize
# Enter "selenium tutorial" text and perform "ENTER" keyboard action
driver.find_element(:css,"input[name='q']").send_keys 'selenium tutorial'
sleep(2)
#here key_down is method of action class
driver.action.key_down(:shift).send_keys(:arrow_down).perform
sleep(2)
driver.action.key_down(:enter).key_up(:enter).perform
sleep(2)

element1=driver.find_element(:xpath,"(//div[@class='g']//h3)").to_s
puts"#{element1}"
variable1=driver.find_element(:xpath,"(//div[@class='g']//h3)[1]").text
puts"$$$$$ #{variable1}"
if variable1.include? "Selenium"
  puts"if block"
  assert(true , "This was expected to be true")

else
  puts"else block"
  assert(false, "This was expected to be TRUE")

end


for i in 1..13
  for j in 1..5
    driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
  end
  if i==3 ||i==4 || i==5 ||i==6
    next
    sleep(2)
    driver.action.key_down(:shift).send_keys(:arrow_down).key_up(:shift).perform
  end
  element=driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]")
  puts element.text
  driver.action.move_to(element).perform
  #link element locator  123
  driver.find_element(:xpath,"(//div[@class='g']//h3)[#{i}]").click
  # element.replace('i','j')
  sleep(2)

  driver.navigate.back
  sleep(2)
  driver.navigate.refresh
  sleep(2)
  i+=1
end
