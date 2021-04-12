*** Settings ***
Library         Selenium2Library

*** Test Cases ***
ค้นหาสินค้าหรือบริการ
    Open Browser    https://www.pantipmarket.com     browser=safari
    Input text  name=search_keyword  computer
    Click Button    name=search_button
    Wait Until Page Contains     ผลการค้นหา
    Click Link  //*[@id="listitem_container"]/div/ul/li[2]/span/a
    Close Browser