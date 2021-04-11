*** Settings ***
Library         Selenium2Library

*** Test Cases ***
เข้า Google
    Open Browser    https://www.google.co.th     browser=safari
    Input Text  q   Hello World!!!!
    # Press Keys  q   RETURN
