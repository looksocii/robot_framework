*** Settings ***
Library     Selenium2Library
Test Setup      Open Web Site Pantipmarket On Browser
# Test Teardown   Close Browser

*** Variables ***
${edit_txt}    xpath:/html/body/table/tbody/tr[2]/td/table/tbody/tr[2]/td[2]/form/table/tbody/tr[6]/td[2]


# ----------------------------------------------------------------------
# ชื่อผู้ทดสอบ : นายพัชรพล บุญชุ่ม  รหัสประจำตัว 61070136
# เป้าหมาย :  ทดสอบร้านค้าออนไลน์
# ทดสอบเว็บไซต์ pantipmarket.com โดยมี Test Cases ดังต่อไปนี้
# ----------------------------------------------------------------------

#แก้ไขข้อมูลสินค้า
#แก้ไขข้อมูลร้านค้า

*** Test Cases ***

#---------------- เแก้ไขสินค้า --------------------------#
TC01 - แก้ไขสินค้า เปลี่ยนข้อมูลสินค้า(Test to Pass)
    Click Link    xpath:/html/body/table/tbody/tr[4]/td/table/tbody/tr/td[2]/div[15]/table/tbody/tr[2]/td[2]/table/tbody/tr[5]/td/ul/li[2]/a
    Wait Until Page Contains    รายการ
    Set Selenium Speed      0.05 second
    Open Browser      url=https://www.pantipmarket.com/mall/center/BackOffice/edit_goods_item_list.php?goods_id=390352&shop_id=18195  browser=chrome
    Maximize Browser Window
    Input Text          mem_name       Core2931
    Input Password      mem_passwd     Core123456
    Submit Form
    Input Text      brand_txt       Product_Edit
    Submit Form
    Close Browser

*** Keywords ***
Open Web Site Pantipmarket On Browser
    Set Selenium Speed      0.2 second
    Open Browser    url=https://www.pantipmarket.com/mall/center/BackOffice/    browser=chrome
    Maximize Browser Window
    Input Text          mem_name       Core2931
    Input Password      mem_passwd     Core123456
    Submit Form
