Feature: Test Soal2

Scenario: Script automation untuk alamat website https://www.saucedemo.com/
  * def trimText = function(text){ return text.trim(); }
  * def username = 'standard_user'
  * def password = 'secret_sauce'
  * def firstname = 'Axel'
  * def lastname = 'Yudhiputra'
  * def zip = '10150'
  * configure driver = {type:'chromedriver' , executable:'./src/test/java/driver/chromedriver'}

  Given driver 'https://www.saucedemo.com/'
  * fullscreen()

  When waitForEnabled("div#root")
  And input("//input[@id='user-name']", username)
  And input("//input[@id='password']", password)
  And waitForEnabled("//input[@id='login-button']").click()
  * def priceProduct = trimText(text("//div[normalize-space()='$29.99']"))

  When waitForEnabled("//button[@id='add-to-cart-sauce-labs-backpack']").click()
  And waitForEnabled("//a[@class='shopping_cart_link']").click()
  And match text("//div[@class='inventory_item_price']") == priceProduct
  And waitForEnabled("//button[@id='checkout']").click()
  And retry(10).input("//input[@id='first-name']", firstname)
  And retry(10).input("//input[@id='last-name']", lastname)
  And retry(10).input("//input[@id='postal-code']", zip)
  And waitForEnabled("//input[@id='continue']").click()
  And waitForEnabled("//button[@id='finish']").click()
  Then waitForText("//h2[normalize-space()='THANK YOU FOR YOUR ORDER']", "THANK YOU FOR YOUR ORDER")