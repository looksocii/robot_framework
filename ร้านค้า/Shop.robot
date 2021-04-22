*** Settings ***
Library     Selenium2Library
Test Setup      Open Web Site Pantipmarket On Browser
# Test Teardown   Close Browser

*** Variables ***
${item_pic}    xpath=//*[@id="newuploadDIV"]/form/table/tbody/tr[1]/td/input
${imgFile}              ${CURDIR}/football.jpg

# ----------------------------------------------------------------------
# ชื่อผู้ทดสอบ : นายพัชรพล บุญชุ่ม  รหัสประจำตัว 61070136
# เป้าหมาย :  ทดสอบร้านค้าออนไลน์
# ทดสอบเว็บไซต์ pantipmarket.com โดยมี Test Cases ดังต่อไปนี้
# ----------------------------------------------------------------------

#เพิ่มสินค้าไม่มียี่ห้อ
#เพิ่มสินค้ามียี่ห้อ

*** Test Cases ***

#---------------- เพิ้่มสินค้าไม่มียี่ห้อ --------------------------#
TC03 - เพิ่มร้านค้า ไม่มียี่ห้อ(test to fail)
    Click Button        nobrand
    Submit Form
    wait Until Page Contains    เลือกหมวด (Category)
    Click Element               //*[@id="cateTD"]/table/tbody/tr[2]/td[1]/select/option[2]
    Submit Form
    wait Until Page Contains    ประเภทสินค้า: Category(Tags):
    Input Text            headline      Product Test
    Input Text            price         99
    Choose File     ${item_pic}       ${imgFile} 
    Click Button   //*[@id="newuploadDIV"]/form/table/tbody/tr[2]/td/input
    Click Button     submitname
    wait Until Page Contains   ระบบได้บันทึกตามต้องการแล้ว
    Submit Form 
    Close Browser

TC01 - เพิ่มสินค้า ไม่มียี่ห้อ ไม่เลือกหมวดหมู่ (test to fail)
    Click Button      nobrand
    Submit Form
    wait Until Page Contains    เลือกหมวด (Category)
    Submit Form
    Alert Should Be Present  เลือกหมวดสินค้าก่อน
    Close Browser

TC02 - เพิ่มสินค้า ไม่มียี่ห้อ ไม่ใส่ประเภท/ไม่ใส่ราคา(test to fail)
    Click Button        nobrand
    Submit Form
    wait Until Page Contains    เลือกหมวด (Category)
    Click Element               //*[@id="cateTD"]/table/tbody/tr[2]/td[1]/select/option[2]
    Submit Form
    wait Until Page Contains    ประเภทสินค้า: Category(Tags):
    Click Button          submitname
    Alert Should Be Present     ป้อนหัวข้อสำหรับสินค้าชิ้นนี้
    Close Browser


#---------------- เพิ้่มสินค้ามียี่ห้อ --------------------------#
TC04 - เพิ่มร้านค้า มียี่ห้อ(test to pass)
    Click Button    havebrand
    Input Text      engbrand        PRODUCT TEST
    Input Text      thaibrand       สินค้าทดลอง
    Input Text      model           ไม่มี
    Submit Form
    Wait Until Page Contains        ชื่อยี่ห้อ
    Submit Form
    wait Until Page Contains    เลือกหมวด (Category)
    Click Element               //*[@id="cateTD"]/table/tbody/tr[2]/td[1]/select/option[2]
    Submit Form
    Input Text      Meta-Overview       สินค้าทดลอง
    Submit Form
    Input Text      itempromote     สินค้าลิมิเต็ด
    Input Text      price           15000
    Choose File     ${item_pic}       ${imgFile} 
    Click Button   //*[@id="newuploadDIV"]/form/table/tbody/tr[2]/td/input
    Click Button     submitname
    Wait Until Page Contains        ชื่อยี่ห้อ
    Submit Form
    Close Browser

TC05 - เพิ่มร้านค้ามียี่ห้อ ไม่ใส่ชื่อยี่ห้อ/ชื่อรุ่น(test to fail)
    Click Button    havebrand
    Submit Form
    Alert Should Be Present     ป้อนชื่อยี่ห้อ(ภาษาอังกฤษ)
    Close Browser

TC06 - เพิ่มร้านค้ามียี่ห้อ ไม่ใส่เลือกหมวดหมู่(test to fail)
    Click Button    havebrand
    Input Text      engbrand        PRODUCT TEST
    Input Text      thaibrand       สินค้าทดลอง
    Input Text      model           ไม่มี
    Submit Form
    Wait Until Page Contains        ชื่อยี่ห้อ
    Submit Form
    wait Until Page Contains    เลือกหมวด (Category)
    Submit Form
    Alert Should Be Present     เลือกหมวดสินค้าก่อน
    Close Browser

TC07 - เพิ่มร้านค้ามียี่ห้อ ไม่ใส่ข้อมูลสินค้า(test to fail)
    Click Button    havebrand
    Input Text      engbrand        PRODUCT TEST
    Input Text      thaibrand       สินค้าทดลอง
    Input Text      model           ไม่มี
    Submit Form
    Wait Until Page Contains        ชื่อยี่ห้อ
    Submit Form
    wait Until Page Contains    เลือกหมวด (Category)
    Click Element               //*[@id="cateTD"]/table/tbody/tr[2]/td[1]/select/option[2]
    Submit Form
    Wait Until Page Contains    ประเภทสินค้า: Category(Tags)
    Submit Form
    Alert Should Be Present
    Close Browser

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Set Selenium Speed      0.2 second
    Open Browser    url=https://www.pantipmarket.com/mall/center/BackOffice/redirect.php?menu=1&Midx=2    browser=chrome
    Maximize Browser Window
    Input Text          mem_name       Core2931
    Input Password      mem_passwd     Core123456
    Submit Form
