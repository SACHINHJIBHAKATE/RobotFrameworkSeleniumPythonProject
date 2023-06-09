*** Settings ***
Documentation    The objective of this test case is to handle different Web Elements such as radio buttons, dropdowns & popup message alerts
Library          SeleniumLibrary
Resource         ../Resources/resources.robot
Test Setup       Open the browser & launch the URL
Test Teardown    close browser

*** Test Cases ***
Validate Login Form (handling different Web Elements such as radio buttons, dropdowns & popup message alerts)
    [TAGS]    NEWFEATURE
    maximise the browser window
    Populate username in the Username field
    Populate password in the Password field
    Select the User radio button
    Wait for alert popup to be visible
    Select Okay button the alert popup
    Select User Category from the dropdown
    Select the terms and conditions checkbox
    Validate if the terms of conditions checkbox is selected
    Select Sign In button
    Wait until page contains the Home link
    Validate that the is navigated to the Products Page

***keywords ***

maximise the browser window
    maximize browser window

Populate username in the Username field
    Input Text          id:username     ${Username}

Populate password in the Password field
    Input Password      id:password     ${Password}

# Use 'click element' keyword to click the radio button
Select the User radio button
    click element    css:input[value='user']

# This is needed because the alert popop takes some time to appear after user selects the user radio button
Wait for alert popup to be visible
    wait until element is visible    id:okayBtn

Select Okay button the alert popup
    click button     id:okayBtn

Select value from the dropdown
    Select From List By Value   css:select.form-control     consult

Select the terms and conditions checkbox
    Select Checkbox     id:terms

Verify if the terms of conditions checkbox is selected
    Checkbox Should Be Selected     id:terms

Select Sign In button
    Click Button        id:signInBtn





