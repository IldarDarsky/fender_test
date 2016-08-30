# Testing update through Workflow Bar
require 'rubygems'
require 'selenium-webdriver'
puts "Running fenderMain.rb"
puts''

#Firefox browser instantiation
browser = Selenium::WebDriver.for :firefox

browser.manage.window.maximize

#Loading the assertselenium URL
browser.get('http://shop.fender.com/en-US/')

# Timeout = 15 sec
wait = Selenium::WebDriver::Wait.new(:timeout => 15)

search_field = wait.until {
  element = browser.find_element(:id, "search-value")
  element if element.displayed?
}
search_field.send_keys("Stratocaster")


search = browser.find_element(:name, "qSubmit")
search.submit

elite_strat_image = wait.until {
    element = browser.find_element(:xpath => "//img[@src='http://www.fmicassets.com/Damroot/MedJpg/10001/0114000700_gtr_frt_001_rr.jpg']")
    element if element.displayed?
}
elite_strat_image.click

### verification in case
# in the original

add_to_cart = wait.until {
  element = browser.find_element(:id, "add-to-cart")
  element if element.displayed?
}
add_to_cart.click


view_cart = wait.until {
  #element = browser.find_element(:class, "mini-cart-label")
  element = browser.find_element(:id, "mini-cart")
  element if element.displayed?
}
cart_text = view_cart.text
#puts cart_text
view_cart.click

cart_quantity = wait.until {
  element = browser.find_element(:class, "mini-cart-qty")
  element if element.displayed?  
}

quantity = cart_quantity.text
puts "Purchased " + quantity + " guitars."

if 
quantity == "(1)"
puts "Test Passed: 1 Stratocaster has been added to cart'" 
else
  puts "FAILED! Number of checked out items is not 1 it is " + quantity + "\n\n"
end


mini_cart = wait.until {
  element = browser.find_element(:class, "mini-cart-label")
  element if element.displayed?
}
mini_cart.click


checkout = wait.until {
	element = browser.find_element(:class, "tablet-small")
	element if element.displayed?
}
checkout.click



checkout_as_guest = wait.until {
 element = browser.find_element(:class, "tablet-small")
 #element = browser.find_element(:id, "checkout-form")
  element if element.displayed?
}
checkout_as_guest.click










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
states = browser.find_elements(:tag_name, "option")
# select the options
states.each do |state|
  if state.text == "California"
  state.click
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
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_addressFields_phone")
  element if element.displayed?
}
phone.send_keys("3106130723")

##### checked by default, if need be use the code below to uncheck
check_box = wait.until {
  element = browser.find_element(:id, "dwfrm_singleshipping_shippingAddress_useAsBillingAddress")
  element if element.displayed?
}
#check_box.click

##### checked by default, if need be use the code below to check other options
radio_box = wait.until {
  element = browser.find_element(:id, "shipping-method-stdShipping")
  #element = browser.find_element(:id, "shipping-method-2dayShipping")
  element if element.displayed?
}
radio_box.click


continue = wait.until {
 element = browser.find_element(:class, "continue-ship")
  element if element.displayed?
}
sleep 3
continue.click

page_title = browser.title
puts "Page Title is: " + page_title

### Test passed or not
if page_title == "Billing Checkout | Fender"
	puts "The test passed successfully. User added 1 instrument to the cart and proceeded with checkout until the Billing Checkout | Fender page was reached" 
else
	puts "Failed, user didn't not reach the Billing Checkout | Fender page"
end

browser.close