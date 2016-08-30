# Testing update through Workflow Bar
require 'rubygems'
require 'selenium-webdriver'
puts "Running fenderMain.rb"
puts''

#Firefox browser instantiation
browser = Selenium::WebDriver.for :firefox

#Loading the assertselenium URL
browser.get.('http://shop.fender.com/en-US/')

# Timeout = 15 sec
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

product = wait.until {
  element = browser.find_element(:link_text, "Products")
  element if element.displayed?
}

product.click


strats = wait.until {
  element = browser.find_element(:link_text, "Stratocaster")
  element if element.displayed?
}

strats.click

elite_strat_image = wait.until {
    element = browser.find_element(:xpath => "//img[@src='http://www.fmicassets.com/Damroot/MedJpg/10001/0114000700_gtr_frt_001_rr.jpg']")
    element if element.displayed?
}
elite_strat_image.click

### verification in case
puts "Test Passed: 'American Elite Strat' page returned" if wait.until {
    browser.text.include?'Externally the American Elite Stratocaster has Fender’s timeless style, but under the hood it’s an entirely new breed of guitar designed for 21'
}

add_to_cart = wait.until {
  element = browser.find_element(:id, "add-to-cart")
  element if element.displayed?
}
add_to_cart.click

view_cart = wait.until {
  element = browser.find_element(class, "mini-cart-label")
  element if element.displayed?
}
view_cart.click

cart_quantity = wait.until {
  element = browser.find_element(class, "mini-cart-qty")
  element if element.displayed?  
}

if 
cart_quantity.text = (1)
puts "Test Passed: 1 Stratocaster has been added to cart'" 
else
  puts "FAILED Incident update to \"Resolution and recovery\"\nStatus value is now " + status_value + "Instead of IN_PROGRESS\n\n"
end


checkout = wait.until {
  element = browser.find_element(:id, "checkout-form")
  element if element.displayed?
}
checkout.click

### checking out as guest
browser.find_element(:xpath, "//div[@class='form-row']//button[@class='green-btn'][text()='yes']").click

### filling in personall data

first_name = wait.until {
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_addressFields_firstName")
  element if element.displayed?
}
first_name.send_keys("FirstName")

last_name = wait.until {
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_addressFields_lastName")
  element if element.displayed?
}
last_name.send_keys("LastName")

address1 = wait.until {
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_addressFields_address1")
  element if element.displayed?
}
address1.send_keys("Address")

address2 = wait.until {
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_addressFields_address2")
  element if element.displayed?
}
address2.send_keys("Address2")


# get the select element    
states = select.find_elements(:tag_name, "option")
# select the options
states.each do |state|
  if state.text == "California"
  g.click
  break
  end
end

city = wait.until {
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_addressFields_city")
  element if element.displayed?
}
city.send_keys("Paradise City")

zip = wait.until {
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_addressFields_zip")
  element if element.displayed?
}
zip.send_keys("90028")
 
 
 

phone = wait.until {
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_addressFields_phone ")
  element if element.displayed?
}
phone.send_keys("90028")

check_box wait.until {
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_useAsBillingAddress")
  element if element.displayed?
}
check_box.click

radio_box wait.until {
  element = browser.find_element(:id, "shipping-method-stdShipping")
  element if element.displayed?
}
radio_box.click

browser.find_element(:xpath, "//div[@class='form-row']//button[@class='green-btn'][text()='yes']").click


### Test passed or not
begin
puts "Test Passed: 'American Elite Strat' page returned" if wait.until {
    browser.text.include?'Checkout'
}
rescue
  puts "There is no 'CHECKOOUT' text on the page"
end

browser.close
