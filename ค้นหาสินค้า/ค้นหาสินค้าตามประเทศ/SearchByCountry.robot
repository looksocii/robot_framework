*** Settings ***
Library     Selenium2Library
Library     String
Library     BuiltIn
Test Setup      Open Web Site Pantipmarket On Browser
Test Teardown   Close Browser

# ----------------------------------------------------------------------
# ชื่อผู้ทดสอบ : นายพันธกานต์ แก้วสังหาร  รหัสประจำตัว 61070139
# เป้าหมาย :  ทดสอบการค้นหาสินค้าหรือบริการตามประเทศ
# ทดสอบเว็บไซต์ pantipmarket.com โดยมี Test Cases ดังต่อไปนี้
# ----------------------------------------------------------------------

*** Test Cases ***
TC01 - ค้นหาตามประเทศจีนและเลือกราคาตั้งแต่ 0 ถึง 1000 บาท (test to pass)
    Click Button    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/button
    Click Element    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/div/ul/li[68]/a

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Set Selenium Speed     	0.7 seconds
    Open Browser    url=https://www.pantipmarket.com     browser=safari
    Maximize Browser Window
    Wait Until Page Contains    สงวนลิขสิทธิ์ © 2561 บริษัท พันทิปมาร์เก็ต จำกัด
