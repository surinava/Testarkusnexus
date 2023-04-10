Feature: Karate browser automation 

  Background:
    * configure driver = { type: 'chrome', executable:'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe', addOptions: ["--remote-allow-origins=*"] }
    * def site = 'http://127.0.0.1:5173/register'

  Scenario Outline: Verify <scenario>
    Given driver site
    And input('input[name=name]',<name> )
    And input('input[name=email]', <email>)
    And input('input[name=password]', <password>)
    And input('input[name=passwordCheck]', <passwordCheck>)
    When click('{button}Register')
    Then waitForText('body', <validation> ).screenshot()
   
    
     Examples:
    |scenario|name|email|password|passwordCheck|validation|
    |name Empty|''| 'surinava@gmail.com'|'Password'|'Password'|'Name is required.'|
    |name Numbers|'1234567890'| 'surinava@gmail.com'|'Password'|'Password'|'Name is required.'|
  #  |name special characters|'!@$%&*())))))'| 'surinava@gmail.com'|'Password'|'Password'|'Name is required.'|
  #  |name at|'@'| 'surinava@gmail.com'|'Password'|'Password'|'Name is required.'|
  #  |email Empty|'Suriana Evangelista'| ''|'Password'|'Password'|'Name is required.'|
  #  |email Numbers|'Suriana Evangelista'| '12345678'|'Password'|'Password'|'Name is required.'|
  #  |email special characters|'Suriana Evangelista'| '!@#$%^&*('|'Password'|'Password'|'Name is required.'|
  #  |email at|'Suriana Evangelista'| '@@'|'Password'|'Password'|'Name is required.'|