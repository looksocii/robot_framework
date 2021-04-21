*** Settings ***
Library     Selenium2Library
Library     String
Library     BuiltIn
Test Setup      Open Web Site Pantipmarket On Browser
Test Teardown   Close Browser

# ----------------------------------------------------------------------
# ชื่อผู้ทดสอบ : นายพันธกานต์ แก้วสังหาร  รหัสประจำตัว 61070139
# เป้าหมาย :  ทดสอบการค้นหาสินค้าหรือบริการตามจังหวัด
# ทดสอบเว็บไซต์ pantipmarket.com โดยมี Test Cases ดังต่อไปนี้
# ----------------------------------------------------------------------

*** Test Cases ***
TC01 - ค้นหาตามจังหวัดพังงาและเลือกราคาตั้งแต่ 0 ถึง 1000 บาท (test to pass)
    Click Button    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/button
    Click Element    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/div/ul/li[68]/a
    Wait Until Page Contains    พังงา
    Select From List By Value   //*[@id="filter:action"]    S1
    Select From List By Value   //*[@id="filter:product_status"]    N
    Select From List By Value   //*[@id="filter:member_type"]   M
    Input Text      filter[price1]      0
    Input Text      filter[price2]      1000
    Click Button    btn_form_filter
    Wait Until Page Contains    โปรแกรมทัวร์,แพ็คเกจทัวร์,พังงา,Phangnga

TC02 - ค้นหาตามจังหวัดอุดรธานีและเลือกราคาตั้งแต่ 0 ถึง 1000 บาท (test to pass)
    Click Button    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/button
    Click Element    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/div/ul/li[58]/a
    Wait Until Page Contains    อุดรธานี
    Select From List By Value   //*[@id="filter:action"]    S1
    Select From List By Value   //*[@id="filter:product_status"]    N
    Select From List By Value   //*[@id="filter:member_type"]   M
    Input Text      filter[price1]      0
    Input Text      filter[price2]      1000
    Click Button    btn_form_filter
    ${price1} =    Get Text    //*[@id="contentcolumn"]/div/div/ul/li[10]/div[3]/span
    ${str} =    Remove String   ${price1}     บาท
    ${val} =    Convert To Number    ${str}
    Should Be True    ${val} >= 0 and ${val} <= 1000
    ${price2} =    Get Text    //*[@id="contentcolumn"]/div/div/ul/li[9]/div[3]/span
    ${str} =    Remove String   ${price2}     บาท     ,
    ${val} =    Convert To Number    ${str}
    Should Be True    ${val} >= 0 and ${val} <= 1000

TC03 - ค้นหาตามจังหวัดอุดรธานีและเลือกราคาตั้งแต่ 200 ถึง 5 บาท (test to fail)
    Click Button    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/button
    Click Element    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/div/ul/li[58]/a
    Wait Until Page Contains    Standard Post
    Select From List By Value   //*[@id="filter:action"]    S1
    Select From List By Value   //*[@id="filter:product_status"]    N
    Select From List By Value   //*[@id="filter:member_type"]   M
    Input Text      filter[price1]      200
    Input Text      filter[price2]      5
    Click Button    btn_form_filter
    Wait Until Page Contains    ไม่พบข้อมูล

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Set Selenium Speed     	0.7 seconds
    Open Browser    url=https://www.pantipmarket.com     browser=safari
    Maximize Browser Window
    Wait Until Page Contains    สงวนลิขสิทธิ์ © 2561 บริษัท พันทิปมาร์เก็ต จำกัด
