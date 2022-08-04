*** Settings ***
Documentation    The objective of this test case is to validate cross browser execution
Library          SeleniumLibrary
Resource         ../Resources/resources.robot
Test Setup       Launch the URL
Test Teardown    close browser

# Best approach is to provide in the browser name from the command on runtime
# OR to declare the browser name varible & keyword implementation for launching browser in the resources file
# Value for variable ${browser} is not defined below as it it passed from the command on runtime
*** Variables ***
${browser}

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

# As all the test cases will use this keyword, we can write this in the 'resources.robot' file
Launch the URL
    create webdriver    ${browser}  executable_path=../Resources/Drivers/${browser}
    go to               ${URL}

maximise the browser window
    maximize browser window

Populate username in the Username field
    Input Text          id:username     ${Username}

Populate password in the Password field
    Input Password      id:password     ${Password}
    sleep    5

Select Sign In button
    Click Button        id:signInBtn


