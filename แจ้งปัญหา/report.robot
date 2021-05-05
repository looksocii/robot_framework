*** Settings ***
Library     Selenium2Library
Test Setup      Open Web Site Pantipmarket On Browser
Test Teardown   Close Browser

# ----------------------------------------------------------------------
# ชื่อผู้ทดสอบ : นนททรัพย์ เซี่ยงฉิน  รหัสประจำตัว 61070095
# เป้าหมาย :  ทดสอบการแจ้งปัญหาการใช้งาน (Report Problem)
# ทดสอบเว็บไซต์ pantipmarket.com โดยมี Test Cases ดังต่อไปนี้
# ----------------------------------------------------------------------
*** Variables ***
${pic_report}       xpath=//*[@id="fileupload1"]
${imgFile}      ${CURDIR}/jett.jpg


*** Test Cases ***
TC01 - กรอกข้อมูลแจ้งปัญหาครบถ้วน (test to pass)
    Click Element        g_helpdesk
    Select From List By Value       g_helpdesk      107
    Input Text      notify_address      nontasabs@gmail.com
    Input Text      message        แจ้งปัญหาการใช้งาน
    Choose File     ${pic_report}     ${imgFile}
    Input Text      name        james
    Click Element       type_code
    Sleep                  4.5            # XXX input CAPTCHA manually here!
    Click Element       except_privacy_policy
    Click Element       submit

TC02 - กรอกข้อมูลแจ้งปัญหาไม่ครบ (test to fail)
    Input Text      notify_address      nontasabs@gmail.com
    Input Text      area_message        แจ้งปัญหาการใช้งาน
    Choose File     ${pic_report}     ${imgFile}
    Input Text      name        james
    Click Element       type_code
    Sleep                  4.5            # XXX input CAPTCHA manually here!
    Click Element       except_privacy_policy
    Click Element       submit
    Alert Should Be Present    กรุณาเลือกปัญหาที่ท่านต้องการสอบถามด้วยค่ะ

TC03 - กรอกปัญหาแต่ไม่กรอกอีเมล์ผู้แจ้ง (test to fail)
    Click Element        g_helpdesk
    Select From List By Value       g_helpdesk      107
    Input Text      message        แจ้งปัญหาการใช้งาน
    Choose File     ${pic_report}     ${imgFile}
    Input Text      name        james
    Click Element       type_code
    Sleep                  4.5            # XXX input CAPTCHA manually here!
    Click Element       except_privacy_policy
    Click Element       submit
    Alert Should Be Present    กรุณากรอกอีเมล์ผู้ส่งด้วยค่ะ

TC04 - กรอกปัญหา,อีเมล์แต่ไม่กรอกรายละเอียด (test to fail)
    Click Element        g_helpdesk
    Select From List By Value       g_helpdesk      25
    Input Text      notify_address      nontasabs@gmail.com    
    Choose File     ${pic_report}     ${imgFile}
    Input Text      name        james
    Click Element       type_code
    Sleep                  4.5            # XXX input CAPTCHA manually here!
    Click Element       except_privacy_policy
    Click Element       submit
    Alert Should Be Present    กรุณากรอกรายละเอียดด้วยค่ะ

TC05 - กรอกปัญหา,อีเมล์,รายละเอียด แต่ไม่ใส่รูปภาพแนบ (test to pass)
    Click Element        g_helpdesk
    Select From List By Value       g_helpdesk      107
    Input Text      notify_address      nontasabs@gmail.com
    Input Text      message        แจ้งปัญหาการใช้งาน
    Input Text      name        james
    Click Element       type_code
    Sleep                  4.5            # XXX input CAPTCHA manually here!
    Click Element       except_privacy_policy
    Click Element       submit

TC06 - กรอกปัญหา, อีเมล์,รายละเอียด,รูปภาพ แต่ไม่กรอกชื่อผู้ติดต่อ (test to fail)
    Click Element        g_helpdesk
    Select From List By Value       g_helpdesk      107
    Input Text      notify_address      nontasabs@gmail.com
    Input Text      message        แจ้งปัญหาการใช้งาน
    Choose File     ${pic_report}     ${imgFile}
    Click Element       type_code
    Sleep                  4.5            # XXX input CAPTCHA manually here!
    Click Element       except_privacy_policy
    Click Element       submit
    Alert Should Be Present    กรุณากรอกชื่อผู้ส่งด้วยค่ะ

TC07 - กรอกทุกอย่างแต่ไม่เลือกยอมรับนโยบาย (test to fail)
    Click Element        g_helpdesk
    Select From List By Value       g_helpdesk      107
    Input Text      notify_address      nontasabs@gmail.com
    Input Text      message        แจ้งปัญหาการใช้งาน
    Choose File     ${pic_report}     ${imgFile}
    Input Text      name        james
    Click Element       type_code
    Sleep                  4.5            # XXX input CAPTCHA manually here!
    Click Element       submit
    Alert Should Be Present    กรุณายอมรับนโยบายข้อมูลส่วนบุคคล

TC08 - กรอก Email ที่ไม่มีอยู่จริง (test to fail)
    Click Element        g_helpdesk
    Select From List By Value       g_helpdesk      107
    Input Text      notify_address      aasdoikjqweiojqweiojqwe@asdpoqkweopqwke.com
    Input Text      message        แจ้งปัญหาการใช้งาน
    Choose File     ${pic_report}     ${imgFile}
    Input Text      name        james
    Click Element       type_code
    Sleep                  4.5            # XXX input CAPTCHA manually here!
    Click Element       except_privacy_policy
    Click Element       submit

TC09 - ไม่ใส่ Captcha ที่ระบบให้มา (test to fail)
    Click Element        g_helpdesk
    Select From List By Value       g_helpdesk      107
    Input Text      notify_address      nontasabs@gmail.com
    Input Text      message        แจ้งปัญหาการใช้งาน
    Choose File     ${pic_report}     ${imgFile}
    Input Text      name        james
    Click Element       except_privacy_policy
    Click Element       submit


TC10 - กรอก Captcha ให้ผิดจากที่ระบบกำหนด (test to fail)
    Click Element        g_helpdesk
    Select From List By Value       g_helpdesk      107
    Input Text      notify_address      nontasabs@gmail.com
    Input Text      message        แจ้งปัญหาการใช้งาน
    Choose File     ${pic_report}     ${imgFile}
    Input Text      name        james
    Input Text       type_code      222
    Click Element       except_privacy_policy
    Click Element       submit
    

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Set Selenium Speed  0.2 seconds
    Open Browser    url=http://www.pantip.com/members/helpdesk/market.php     browser=chrome
    Maximize Browser Window


