*** Settings ***
Documentation    The objective of this test case is to validate the login scenarios
Library          SeleniumLibrary
Resource         ../Resources/resources.robot
Test Setup       Open the browser & launch the URL
Test Teardown    close browser

*** Test Cases ***
Validate Successful Login
    [TAGS]    SMOKE
    maximise the browser window
    Populate username in the Username field
    Populate password in the Password field
    Select Sign In button

Validate if the application is launched
    [TAGS]    REGRESSION
    maximise the browser window

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


