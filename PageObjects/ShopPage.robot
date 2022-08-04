*** Settings ***
Documentation    The objective of this test case is define keywords containing page objects of Shop Page
Library          SeleniumLibrary

*** Keywords ***

Wait until page contains the Home link
    wait until page contains element    xpath://a[text()='Home']

Select Add button for Blackberry item
    click button       xpath://app-card-list[@class='row']/app-card[4]/div/div/button

#Select Checkout button
    #click button       css:li.active a

#Select Home link
    #click link    xpath://a[text()='Home']
