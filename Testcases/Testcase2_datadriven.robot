*** Settings ***
Documentation    The objective of this test case is to validate the login scenarios
Library          SeleniumLibrary
Test Teardown    close browser
Library         ../Testdata/Readexceldata.py

*** Variables ***
${URL}              https://rahulshettyacademy.com/loginpagePractise/
${Username}         rahulshettyacademy
${Password}         learning
${Sheet_name}       Sheet1
# ${row_number}       1
# ${column_number}    1
${rows}
${login_username}
${login_password}

*** Test Cases ***
Validate Successful Login
    Open the browser & launch the URL
    maximise the browser window
    Return number of rows
    Return cell data, Populate username & password and Select Sign In button

***keywords ***
open the browser & launch the URL
    create webdriver    Chrome  executable_path=C:/work/chromedriver.exe
    go to               ${URL}

maximise the browser window
    maximize browser window

Return number of rows
    ${rows}=    fetch_number_of_rows_in_a_sheet     ${sheet_name}
    log     ${rows}

Return cell data, Populate username & password and Select Sign In button
    # This is just retrieving the data for row & column numbers provided
    # ${cell_data}=    fetch_cell_data     ${sheet_name}   ${row_number}   ${column_number}
    # log     ${cell_data}

    FOR   ${i}    IN RANGE    1    4
          log   ${i}
          ${login_username}=    fetch_cell_data     ${sheet_name}   ${i}   1
          ${login_password}=    fetch_cell_data     ${sheet_name}   ${i}   2
          Input Text          id:username     ${login_username}
          Input Password      id:password     ${login_password}
          Click Button        id:signInBtn
          sleep     5
    END


