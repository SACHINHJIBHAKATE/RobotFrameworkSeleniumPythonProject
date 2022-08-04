*** Settings ***
Documentation    The objective of this test case is define keywords containing page objects of Login Page
Library          SeleniumLibrary
Resource         ../Resources/resources.robot

*** Keywords ***
Populate username in the Username field
    Input Text          id:username     ${Username}

Populate password in the Password field
    Input Password      id:password     ${Password}

Select Sign In button
    Click Button        id:signInBtn