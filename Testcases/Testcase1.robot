*** Settings ***
Documentation    The objective of this test case is to validate the login scenarios (unsuccessful and successful login)
Library          SeleniumLibrary
Resource         ../Resources/resources.robot
Test Setup       Open the browser & launch the URL
Test Teardown    close browser

*** Test Cases ***

Validate Unsuccessful Logina
    [TAGS]    SMOKE
    maximise the browser window
    Populate username in the Username field
    Populate password in the Password field
    Select Sign In button
    Verify the error message is correct

Validate Successful Login
    [TAGS]    SMOKE
    maximise the browser window
    Populate username in the Username field
    Populate password in the Password field
    Select Sign In button
    Wait until page contains the Home link
    Validate that the User is navigated to the Products Page

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


