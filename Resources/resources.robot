*** Settings ***
Documentation    The objective of this test case is define resources used by the test cases
Library          SeleniumLibrary

*** Variables ***
${URL}          https://rahulshettyacademy.com/loginpagePractise/
${Username}     rahulshettyacademy
${Password}     learning
${browser}

*** Keywords ***
Open the browser & launch the URL
    create webdriver    ${browser}  executable_path=../Resources/Drivers/${browser}
    go to               ${URL}