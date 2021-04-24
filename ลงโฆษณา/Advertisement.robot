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
TC01 - กรอกข้อมูลสินค้าครบ ลงสำเร็จครังเเรกชื่อไม่ซ้ำ (test to pass)

    Wait Until Page Contains    ข้อมูลโฆษณา
    #Input Topic 
    Input Text      topic_th    สินค้าทดสอบ2

    #Selected Type
    Click Element    //*[@id="select_group"]
    Scroll Element Into View    //*[@id="lv"]/li[32]/div
    Wait Until Element Is Visible  //*[@id="lv"]/li[32]/div
    Click Element    //*[@id="lv"]/li[32]/div
    Click Element    css:body > div.jqibox > div.jqi > form > div.jqistates > div > div.jqibuttons > button.jqiprimarybutton

    # Input Description
    Input Text    css:#message_th  just a test post

    # Input Price
    Input Text     css:#price_text  1

    # Input Contact
    Input Text     css:#price_text  1

    # Input Address
    #Select From List By Value   css:#located_in_select_2    3_18_4_12

    #Select From List By Value   css:#located_in_select_3    3_18_4_12_182

    # Input Name
    #Input Text      css:#name_th    tester

    # Input Tel
    #Input Text      css:#telephone    0888888888

    # Drag Element

    Drag And Drop By Offset     css:#data_post > div:nth-child(6) > fieldset > div > div > div.frm_col.col-9 > div > div > div.bgSlider > div   379     0
    
    Sleep   3
    # Success Pop Up
    Click Element   css:body > div.jqibox > div.jqi > form > div.jqistates > div > div.jqibuttons > button
                    
TC02 - กรอกข้อมูลสินค้าไม่ครบ (test to fail)

    Wait Until Page Contains    ข้อมูลโฆษณา
    #Input Topic 
    Input Text      topic_th    สินค้าทดสอบ

    #Selected Type
    Click Element    //*[@id="select_group"]
    Scroll Element Into View    //*[@id="lv"]/li[32]/div
    Wait Until Element Is Visible  //*[@id="lv"]/li[32]/div
    Click Element    //*[@id="lv"]/li[32]/div
    Click Element    css:body > div.jqibox > div.jqi > form > div.jqistates > div > div.jqibuttons > button.jqiprimarybutton

    # Input Description
    Input Text    css:#message_th  just a test post

    # Input Price
    # Input Text     css:#price_text  1

    # Input Contact
    Input Text     css:#price_text  1

    # Input Address
    #Select From List By Value   css:#located_in_select_2    3_18_4_12

    #Select From List By Value   css:#located_in_select_3    3_18_4_12_182

    # Input Name
    #Input Text      css:#name_th    tester

    # Input Tel
    #Input Text      css:#telephone    0888888888

    # Drag Element

    Drag And Drop By Offset     css:#data_post > div:nth-child(6) > fieldset > div > div > div.frm_col.col-9 > div > div > div.bgSlider > div   379     0
    
    Sleep   3
    # Success Pop Up
    Click Element   css:body > div.jqibox > div.jqi > form > div.jqistates > div > div.jqibuttons > button



*** Keywords ***
Open Web Site Pantipmarket On Browser
    Set Selenium Speed     	0.7 seconds
    Open Browser    url=https://www.pantipmarket.com     browser=chrome
    Maximize Browser Window
    Mouse Down On Link      javascript:void(0);
    Input Text      username    testuser3445555
    Input Password     password     Testpassword1122
    Click Button        login_popup_btn
    Sleep   0.5 
    Wait Until Page Contains    ยินดีต้อนรับคุณ
    Click Link   https://www.pantipmarket.com/post
    Wait Until Page Contains  หากต้องการ สอบถามเกี่ยวกับการลงประกาศฟรี คลิกที่นี่
    

