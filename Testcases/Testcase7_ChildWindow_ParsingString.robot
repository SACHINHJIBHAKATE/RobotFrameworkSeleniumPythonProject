*** Settings ***
Documentation    The objective of this test case is to handle child window, perform operations in child window (including parsing string), switch to the main window
Library          SeleniumLibrary
Library          Collections
Library          String
Resource         ../Resources/resources.robot
Test Setup       Open the browser & launch the URL
Test Teardown    close browser

*** Test Cases ***
Validate Successful Login
    maximise the browser window
    Select the link on the LoginPage
    Switch to the child window
    Verify that the user is switched to the child window
    Extract the email id from string in the child window
    Switch to Main Window
    Verify that the user is switched to the main window
    Populate username in the Username field
    Populate password in the Password field
    Select Sign In button

***keywords ***

maximise the browser window
    maximize browser window

Select the link on the LoginPage
    click link    css:.blinkingText
    sleep         5

Switch to the child window
    Switch Window   NEW

Verify that the user is switched to the child window
    Element Text Should Be      xpath://h1[text()='Documents request']      DOCUMENTS REQUEST

Extract the email id from string in the child window
    # We first need to split the string using 'at' & catch in a list
    # Please email us at mentor@rahulshettyacademy.com with below template to receive response
    # 0th index: Please email us
    # 1st index: mentor@rahulshettyacademy.com with below template to receive response
    ${text}=                Get Text        css:.red
    @{list_1}=              Split String    ${text}     at
    ${extracted_text}=      Get From List   ${list_1}   1

    # We then need to split the string using empty space which exist after the email address & catch in a list
    # If we don't provide the split operator in Split String command, split operator is by default considered as space
    # mentor@rahulshettyacademy.com with below template to receive response
    # 0th index: mentor@rahulshettyacademy.com
    # 1st index: with below template to receive response
    @{list_2}=                  Split String        ${extracted_text}
    ${email_address}=            Get From List      ${list_2}           0

    # If we need to use the variable (created under a keyword) outside in the test cases (.robot file) or in any other test case (.robot) file,
    # we need to set the variable as a global variable
    set global variable    ${email_address}

    # Note: Instead of parsing the string & extracting the email address, we can also use xpath locator 'Inner Text' to extract the email address
    # xpath://a[text()='mentor@rahulshettyacademy.com']

Switch to Main Window
    switch window    MAIN

Verify that the user is switched to the main window
    # Verify the main window title
    Title Should Be     LoginPage Practise | Rahul Shetty Academy

# We need to populate the extracted email address above in the Username field
Populate username in the Username field
    Input Text          id:username     ${email_address}

Populate password in the Password field
    Input Password      id:password     ${Password}
    sleep    5

Select Sign In button
    Click Button        id:signInBtn



