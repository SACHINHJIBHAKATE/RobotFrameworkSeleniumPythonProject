*** Settings ***
Documentation    The objective of this test case is to Verify the items on the ShopPage
Library          SeleniumLibrary
Library          Collections
Resource         ../Resources/resources.robot
Test Teardown    close browser

*** Test Cases ***
Validate Successful Login
    Open the browser & launch the URL
    maximise the browser window
    Populate username in the Username field
    Populate password in the Password field
    Select Sign In button
    Wait until page contains the Home link
    Verify the items on the ShopPage

***keywords ***
open the browser & launch the URL
    create webdriver    Chrome  executable_path=C:/work/chromedriver.exe
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




