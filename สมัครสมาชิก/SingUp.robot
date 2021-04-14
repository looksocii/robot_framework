*** Settings ***
Library     Selenium2Library
Test Setup      Open Web Site Pantipmarket On Browser
# Test Teardown   Close Browser

# ทดสอบการสมัครสมาชิกของเว็บไซต์ pantipmarket.com โดยมี Test Case ดังต่อไปนี้
*** Test Cases ***
# กรอกข้อมูลครบถ้วน (test to pass)
#     Input Text      username    aopup1122
#     Input Password  password    Puntakarn1234567890
#     Input Password  confirm_password    Puntakarn1234567890
#     Input Text  name    พันธกานต์
#     Input Text  sname   แก้วสังหาร
#     Input Text  email   aop1122@hotmail.com
#     Input Text  phone   0801800391
#     Input Text  display_name    พันธกานต์ แก้วสังหาร
#     Select Checkbox     except_privacy_policy

กรอกข้อมูลไม่ครบ (test to fail)
    Input Text      username    aopup1122
    Input Password  password    Puntakarn1234567890
    Input Password  confirm_password    Puntakarn1234567890
    Input Text  name    พันธกานต์
    # Input Text  sname   แก้วสังหาร
    Input Text  email   aop1122@hotmail.com
    Input Text  phone   0801800391
    Input Text  display_name    พันธกานต์ แก้วสังหาร
    Select Checkbox     except_privacy_policy
    Click Button    //*[@id="btn_register_submit"]
    Alert Should Be Present    กรุณาใส่ "นามสกุล" ให้ถูกต้องด้วยค่ะ

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Open Browser    url=https://www.pantipmarket.com     browser=safari
    Maximize Browser Window
    Wait Until Page Contains    ข่าวสารและกิจกรรม
    Click Link   https://www.pantipmarket.com/member/register_option.php
    Wait Until Page Contains    ท่านสามารถ สมัครสมาชิก ผ่านทาง
    Click Image     ../../image/button/but_pantipmarket.png
    Wait Until Page Contains    กรุณาให้ข้อมูลเพิ่มเติม
