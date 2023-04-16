*** Settings ***
Documentation    The objective of this test case is to validate END to END Ecommerce Website Product Purchase
Library          SeleniumLibrary
Resource         ../Resources/resources.robot
Test Setup       Open the browser & launch the URL
Test Teardown    close browser

*** Test Cases ***
Validate END to END Ecommerce Website Product Purchase
    [TAGS]    REGRESSION
    maximise the browser window
    Populate username in the Username field
    Populate password in the Password field
    Select Sign In button
    Wait until page contains the Home link
    Validate that user is navigated to the Products Page
    Add Products to the CART from the Products Page
    Validate that the SUM of product prices matches the Total price displayed on the Checkout Page
    Complete Purchase
    Validate that the Products Purchase in successful

***keywords ***

maximise the browser window
    maximize browser window

Populate username in the Username field
    Input Text          id:username     ${Username}

Populate password in the Password field
    Input Password      id:password     ${Password}
    sleep    5

Select Sign In button
    Click Button        id:signInBtn


