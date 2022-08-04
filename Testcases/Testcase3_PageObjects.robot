*** Settings ***
Documentation    The objective of this test case is to validate the login scenarios
Library          SeleniumLibrary
Resource         ../Resources/resources.robot
Resource         ../PageObjects/LoginPage.robot
Resource         ../PageObjects/ShopPage.robot
Test Setup       Open the browser & launch the URL
Test Teardown    close browser

*** Test Cases ***
Login & add Items to Cart
    [TAGS]    SMOKE
    maximise the browser window
    Populate username in the Username field
    Populate password in the Password field
    Select Sign In button
    Wait until page contains the Home link
    Select Add button for Blackberry item
    #Select Home link

***keywords ***

maximise the browser window
    maximize browser window

# Place the following keyword (containing page objects of Login page into 'LoginPage.robot')
#Populate username in the Username field
    #Input Text          id:username     ${Username}

# Place the following keyword (containing page objects of Login page into 'LoginPage.robot')
#Populate password in the Password field
    #Input Password      id:password     ${Password}
    #sleep    5

# Place the following keyword (containing page objects of Login page into 'LoginPage.robot')
#Select Sign In button
    #Click Button        id:signInBtn

# Place the following keyword (containing page objects of Login page into 'ShopPage.robot')
#Select Add button for Blackberry item
    #click button    xpath://app-card-list[@class='row']/app-card[4]/div/div/button
    #click button    xpath://app-card-list[@class='row']/app-card[4]/div/div/button

# Place the following keyword (containing page objects of Login page into 'ShopPage.robot')
#Select Checkout button
    #click button    //div[@id='navbarResponsive']/ul/li/a

