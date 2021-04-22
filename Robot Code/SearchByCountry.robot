*** Settings ***
Library     Selenium2Library
Library     String
Library     BuiltIn
Test Setup      Open Web Site Pantipmarket On Browser
Test Teardown   Close Browser

# ----------------------------------------------------------------------
# ชื่อผู้ทดสอบ : นายพันธกานต์ แก้วสังหาร  รหัสประจำตัว 61070139
# เป้าหมาย :  ทดสอบการค้นหาสินค้าหรือบริการตามประเทศ (Search By Country)
# ทดสอบเว็บไซต์ pantipmarket.com โดยมี Test Cases ดังต่อไปนี้
# ----------------------------------------------------------------------

*** Test Cases ***
TC01 - ค้นหาตามประเทศจีน (test to pass)
    กดดูสินค้าตามจังหวัดหรือประเทศ    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/button       //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/div/ul/li[108]/a         จีน
    Click Element   //*[@id="B3_table_data"]/table/tbody/tr[8]/td[4]
    Page Should Contain     สอบถาม
    Page Should Contain     ตกลงกันเอง

TC02 - ค้นหาตามประเทศสหรัฐอเมริกาและเลือกราคาตั้งแต่ 2000 ถึง 10000 บาท (test to pass)
    กดดูสินค้าตามจังหวัดหรือประเทศ    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/button       //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/div/ul/li[95]/a      สหรัฐอเมริกา
    Page Should Contain     แล้วแต่ตกลงกันครับ
    Wait Until Page Contains    9999 บาท
    Wait Until Page Contains    10,000 บาท
    Wait Until Page Contains    3000 บาท
    Input Text      filter[price1]      2000
    Input Text      filter[price2]      10000
    Click Button    btn_filter
    Page Should Not Contain     ไม่พบข้อมูล

TC03 - ค้นหาตามประเทศเนเธอร์แลนด์ (test to pass)
    กดดูสินค้าตามจังหวัดหรือประเทศ    //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/button       //*[@id="section_main_content"]/div/div[1]/div[2]/div[1]/div[2]/div[2]/div/div/ul/li[93]/a      เนเธอร์แลนด์
    Page Should Contain     สอบถาม

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Set Selenium Speed     	0.7 seconds
    Open Browser    url=https://www.pantipmarket.com     browser=safari
    Maximize Browser Window
    Wait Until Page Contains    สงวนลิขสิทธิ์ © 2561 บริษัท พันทิปมาร์เก็ต จำกัด

กดดูสินค้าตามจังหวัดหรือประเทศ
    [Arguments]     ${CLICK_BUTTON}     ${CLICK_ELEMENT}    ${PAGE_CONTAIN}
    Click Button    ${CLICK_BUTTON}
    Click Element    ${CLICK_ELEMENT}
    Wait Until Page Contains    ${PAGE_CONTAIN}
