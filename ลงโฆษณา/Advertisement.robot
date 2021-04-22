*** Settings ***
Library     Selenium2Library
Library     String
Library     BuiltIn
Test Setup      Open Web Site Pantipmarket On Browser
Test Teardown   Close Browser

# ----------------------------------------------------------------------
# ชื่อผู้ทดสอบ : นายสหัสวรรษ ขันรักษา  รหัสประจำตัว 61070238
# เป้าหมาย :  ทดสอบฟีเจอร์การลงโฆษณา
# ทดสอบเว็บไซต์ pantipmarket.com โดยมี Test Cases ดังต่อไปนี้
# ----------------------------------------------------------------------

*** Test Cases ***
TC01 - กรอกข้อมูลสินค้าไม่ครบ (test to pass)

    # Click Element    //child::div[@class="bar_chart" and ./h1/text()="Book Sales"] 
    Wait Until Page Contains    ข้อมูลโฆษณา
    # Select From List By Value   //*[@id="filter:action"]    S1
    # Select From List By Value   //*[@id="filter:product_status"]    N
    # Select From List By Value   //*[@id="filter:member_type"]   M
    Input Text      topic_th    สินค้าทดสอบ
    Click Element    xpath://html/body/div[7]/form/div[1]/fieldset[1]/div[3]/div/div[2]/div/div[1]/div/input[1]
    Execute JavaScript    window.document.evaluate("//html/body/div[8]/div[2]/div[1]/ul/li[32]/div", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);    
    Wait Until Element Is Visible  xpath://html/body/div[8]/div[2]/div[1]/ul/li[32]/div
    Click Element    xpath://html/body/div[8]/div[2]/div[1]/ul/li[32]/div
    Wait Until Element Is Visible   xpath://html/body/div[13]/div[2]/form/div[2]/div/div[2]
    Click Element    xpath://html/body/div[13]/div[2]/form/div[2]/div/div[2]/button[1]
    Input Text     xpath://html/body/div[7]/form/div[1]/fieldset[2]/div[2]/div/div[1]/div[1]/textarea  just a test post
    Submit Form      //*[@id="data_post"]

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Set Selenium Speed     	0.7 seconds
    Open Browser    url=https://www.pantipmarket.com     browser=chrome
    Maximize Browser Window
    Click Link   https://www.pantipmarket.com/post
    Wait Until Page Contains  หากต้องการ สอบถามเกี่ยวกับการลงประกาศฟรี คลิกที่นี่

