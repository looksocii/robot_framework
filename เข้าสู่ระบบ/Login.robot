*** Settings ***
Library     Selenium2Library
Test Setup      Open Web Site Pantipmarket On Browser
Test Teardown   Close Browser

# ----------------------------------------------------------------------
# ชื่อผู้ทดสอบ : นายพันธกานต์ แก้วสังหาร  รหัสประจำตัว 61070139
# เป้าหมาย :  ทดสอบระบบการสมัครสมาชิก
# ทดสอบเว็บไซต์ pantipmarket.com โดยมี Test Cases ดังต่อไปนี้
# ----------------------------------------------------------------------

*** Test Cases ***
TC01 - ไม่กรอกข้อมูลแล้วกดปุ่ม Login (test to fail)
    Click Button        login_popup_btn
    Alert Should Be Present    กรุณากรอก "Username" ด้วยค่ะ

TC02 - กรอกชื่อผู้ใช้และรหัสผ่านที่เป็นภาษาไทยแล้วกดปุ่ม Login (test to fail)
    Input Text      username    สมชาติหล่อดี
    Input Password     password     จอร์นชาวไร่
    Click Button        login_popup_btn
    Alert Should Be Present    กรุณากรอก "Username" ด้วยค่ะ

TC03 - กรอกชื่อผู้ใช้ผิดแต่รหัสผ่านถูกแล้วกดปุ่ม Login (test to fail)
    Input Text      username    testuser3445554
    Input Password     password     Testpassword1122
    Click Button        login_popup_btn
    Wait Until Page Contains    ไม่พบ Username

TC04 - กรอกชื่อผู้ใช้ถูกแต่รหัสผ่านผิดแล้วกดปุ่ม Login (test to fail)
    Input Text      username    testuser3445555
    Input Password     password     Testpassword1121
    Click Button        login_popup_btn
    Wait Until Page Contains    รหัสผ่านไม่ถูกต้อง

TC05 - กรอกชื่อผู้ใช้และรหัสถูกต้องครบถ้วนแล้วกดปุ่ม Login (test to pass)
    Input Text      username    testuser3445555
    Input Password     password     Testpassword1122
    Click Button        login_popup_btn
    Wait Until Page Contains    ยินดีต้อนรับคุณ

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Open Browser    url=https://www.pantipmarket.com     browser=safari
    Maximize Browser Window
    Wait Until Page Contains    ข่าวสารและกิจกรรม
    Mouse Down On Link      javascript:void(0);
