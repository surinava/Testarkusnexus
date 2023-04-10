Feature: Login Validations 

  Background:
    * configure driver = { type: 'chrome', executable:'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe', addOptions: ["--remote-allow-origins=*"] }
    * def site = 'http://127.0.0.1:5173/login'

  Scenario Outline: Verify <scenario>

    Given driver site
    And input('input[name=email]', <user>)
    And input('input[name=password]', <pass>)
    When click('{button}Login')
    Then waitForText('body', <validation> ).screenshot()
   
     Examples:
    |scenario|user|pass|validation|
    |Email with out at|'sevangelistaarkusnexus'| 'mipas'|'Email must contain @.'|
    |Email with out at|'surinava@gmail.com'| 'Sonora78'|''|
    #|Email Empty |''| 'mipas'|'Email must contain @.'|
    #|Email NULL|'NULL'| 'mipas'|'Email must contain @.'|
    #|Email special characters|'!@#$%^&*()(*&^%$#@'| 'mipas'|'Email must contain @.'|
    #|Email many at|'@@@@@@@'| 'mipas'|'Email must contain @.'|
    #|Email numbers|'1234567890000'| 'mipas'|'Email must contain @.'|
    #|Password Empty |'sevangelista@arkusnexus.com'| ''|'Password is required.'|
    
    #Pendiente cuando este el back |Email not exist|'sevangelista@notexist.com'| 'mipas'|'Email must contain @.'| 
    #|Password NULL|'sevangelista@arkusnexus.com'| 'NULL'|'Email must contain @.'|
    #Pendiente cuando este el back |Password Wrong|'sevangelista@arkusnexus.com'| 'mipas'|'Pending'|
    #|Password many at|'sevangelista@arkusnexus.com'| '@@@@@@@'|'Email must contain @.'|
    #|Password numbers|'sevangelista@arkusnexus.com'| '123567777'|'Email must contain @.'|
    #|Password blank space|'sevangelista@arkusnexus.com'| '    '|'Email must contain @.'|
    
    
      
    
    