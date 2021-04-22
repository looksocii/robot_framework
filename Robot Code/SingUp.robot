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
TC01 - กรอกข้อมูลไม่ครบ (test to fail)
    กรอกข้อมูลและส่งแบบฟอร์มสมัครสมาชิก   USER_NAME=testusername123   PASSWORD=Testpassword1122    CONFIRM_PASSWORD=Testpassword1122    FRIST_NAME=Harry      LAST_NAME=     EMAIL=61070139@it.kmitl.ac.th     PHONE=0969368066      DISPLAY_NAME=Harry Potter
    Alert Should Be Present    กรุณาใส่ "นามสกุล" ให้ถูกต้องด้วยค่ะ

TC02 - รหัสผ่านและยืนยันรหัสผ่านไม่ตรงกัน (test to fail)
    กรอกข้อมูลและส่งแบบฟอร์มสมัครสมาชิก   testusername123   Testpassword1122    Aopnojfjfkdo122334    Harry     Potter   61070139@it.kmitl.ac.th     0969368066      Harry Potter
    Alert Should Be Present    กรุณาใส่ "Password (รหัสผ่าน)" ให้ตรงกับ "Confirm Password (ยืนยันรหัสผ่าน)" ด้วยค่ะ

TC03 - กรอกอีเมลซ้ำกับในระบบ (test to fail)
    กรอกข้อมูลและส่งแบบฟอร์มสมัครสมาชิก   testusername123   Testpassword1122    Testpassword1122    Harry     Potter   aop1122@hotmail.com     0969368066      Harry Potter
    Wait Until Page Contains    E-mail นี้เคยใช้สมัครสมาชิก เรียบร้อยแล้ว ท่านสามารถ Login ได้ทันทีที่

TC04 - กรอกอีเมลที่ไม่มีอยู่จริง (test to fail)
    # มีการเพิ่มข้อมูลลงในระบบแล้ว
    กรอกข้อมูลและส่งแบบฟอร์มสมัครสมาชิก  testuser22211   Pass999000    Pass999000    Gretn     Land   lil99933@gmail.com     0987887654      Gretn Land
    Wait Until Page Contains        คุณเป็นสมาชิก Pantipmarket.com เรียบร้อยแล้ว
    Page Should Not Contain         คุณเป็นสมาชิก Pantipmarket.com เรียบร้อยแล้ว

TC05 - กรอกข้อมูลครบถ้วน (test to pass)
    # มีการเพิ่มข้อมูลลงในระบบแล้ว
    กรอกข้อมูลและส่งแบบฟอร์มสมัครสมาชิก   testuser3445555   Testpassword1122    Testpassword1122    Ikrre     Uyri   61070139@it.kmitl.ac.th     0969368066      Jio Jo
    Wait Until Page Contains    คุณเป็นสมาชิก Pantipmarket.com เรียบร้อยแล้ว

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Open Browser    url=https://www.pantipmarket.com     browser=safari
    Maximize Browser Window
    Wait Until Page Contains    ข่าวสารและกิจกรรม
    Click Link   https://www.pantipmarket.com/member/register_option.php
    Wait Until Page Contains    ท่านสามารถ สมัครสมาชิก ผ่านทาง
    Click Image     ../../image/button/but_pantipmarket.png
    Wait Until Page Contains    กรุณาให้ข้อมูลเพิ่มเติม

กรอกข้อมูลและส่งแบบฟอร์มสมัครสมาชิก
    [Arguments]     ${USER_NAME}    ${PASSWORD}    ${CONFIRM_PASSWORD}  ${FRIST_NAME}   ${LAST_NAME}    ${EMAIL}    ${PHONE}    ${DISPLAY_NAME}
    Input Text      username    ${USER_NAME}
    Input Password  password    ${PASSWORD}
    Input Password  confirm_password    ${CONFIRM_PASSWORD}
    Input Text  name    ${FRIST_NAME}
    Input Text  sname   ${LAST_NAME}
    Input Text  email   ${EMAIL}
    Input Text  phone   ${PHONE}
    Input Text  display_name    ${DISPLAY_NAME}
    Select Checkbox     except_privacy_policy
    Submit Form
