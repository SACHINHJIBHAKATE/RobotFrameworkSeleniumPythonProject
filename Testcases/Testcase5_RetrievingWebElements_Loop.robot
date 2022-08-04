*** Settings ***
Documentation    The objective of this test case is to add the item in the card based on the item name provided
Library          SeleniumLibrary
Library          Collections
Resource         ../Resources/resources.robot
#Test Teardown    close browser

*** Variables ***
${cart_name}

*** Test Cases ***
Validate Successful Login
    Open the browser & launch the URL
    maximise the browser window
    Populate username in the Username field
    Populate password in the Password field
    Select Sign In button
    Wait until page contains the Home link
    Verify the items on the ShopPage
    Add item in the cart based on the cart name provided    iphone X

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

Add item in the cart based on the cart name provided
    [arguments]    ${cart_name}

    # //div[@class='card-footer']/button ==> This locates 4 add buttons
    # This will click the add button at the 4rd index as we provided [4] i.e. add button at 4th index
    # However, the scenario is to click the add button based on the item index
    # i.e. if iphone x is provided as the cart name, it is at the 1st index
    #click button    xpath:(//div[@class='card-footer']/button)[4]

    # This will capture the list of cart title web elements
    @{elements}=       Get WebElements     css:.card-title

    # This sets the index value to 1
    # As such, if first element matches then 1 will be provided as the {index} value in the selector for clicking the Add button
    ${index}=   set variable    1

    # This will retrieve each element from the list of elements, then retrieve the text from that element,
    # then compare the cart name with the cart name provided & if it matches, breaks the for exit for loop,
    # in which case, ${index} will have the element number which is passed as the {index} value in the selector for clicking the Add button
    # If the cart name (retrieved from the element) does not match with the cart name provided, ${index} value is incremented by 1,
    # and for loop starts again retrieving the next element
    FOR    ${element}  IN    @{elements}
           #EXIT FOR LOOP IF    '${cart_name}' == '${element.text}'
           IF   '${cart_name}' == '${element.text}'     BREAK
           ${index} =    Evaluate   ${index} + 1
    END

    # This will click the Add button based on the ${index} value
    click button    xpath:(//div[@class='card-footer']/button)[${index}]











