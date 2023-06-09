*** Settings ***
Documentation    The objective of this test case is to Validate Products on the ShopPage
Library          SeleniumLibrary
Library          Collections
Resource         ../Resources/resources.robot
Test Setup       Open the browser & launch the URL
Test Teardown    close browser

*** Test Cases ***
Verify Products on the ShopPage
    [TAGS]    REGRESSION
    maximise the browser window
    Populate username in the Username field
    Populate password in the Password field
    Select Sign In button
    Wait until page contains the Home link
    Verify Products on the ShopPage

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

Wait until page contains the Home link
    wait until page contains element    xpath://a[text()='Home']

Verify the items on the ShopPage
    #Create the expected list of items. When crating list for the first time, always use @ and further we can use $ for the list
    @{expectedList}=     create list    iphone X     Samsung Note 8      Nokia Edge      Blackberry

    # This will capture the list of web elements
    @{elements}=       Get WebElements     css:.card-title

    # This creates an empty list where we need to append to list the text values from the elements captured above
    @{actualList}=     create list

    # This will retrieve each element from the list of elements, then retrieve the text from that element & append to the list
    FOR    ${element}  IN    @{elements}
           Log  ${element.text}
           Append To List       ${actualList}     ${element.text}
    END

    # This compares the two lists
    Lists Should Be Equal       ${expectedList}     ${actualList}




