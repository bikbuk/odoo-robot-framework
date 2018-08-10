*** Settings ***

Documentation  Test generated by SeleniumBuilder for OpenERP 9.0 Enterprise
Resource       Resources/odoo_10_0_EE.robot
Resource       Resources/SakinahResource.robot
Variables      Resources/config.py
Library        Collections
Library        SeleniumLibrary


Suite Setup      Run Keywords      Set Up

*** Test Cases ***
Create Database
    Set Global Variable     ${ODOO_URL_DB}     http://${SERVER}:${ODOO_PORT}
    Open Browser    ${ODOO_URL_DB}  browser=${BROWSER}
    Maximize Browser Window
    Go To                           ${ODOO_URL_DB}/web/database/manager
    Set Selenium Speed              ${SELENIUM_DELAY}
    Set Selenium Timeout            ${SELENIUM_TIMEOUT}
    Set Selenium Implicit Wait      ${SELENIUM_TIMEOUT}
    Click Button    xpath=//button[@data-target='.o_database_create']
    Wait Until Element is Visible   name=name
    Input Text      name=name   ${ODOO_DB}
    Input Text      name=login  ${user}
    Input Password  name=password   ${password}
    Click Element   xpath=//select[@id='country']
    Press Key       xpath=//select[@id='country']   niii
    Click Element   xpath=//input[@value='Continue' and @type='submit']
Install Modules
    Wait Until Page Contains Element   xpath=//a[@data-menu='5']       timeout=30min
    MainMenu    5
    Click Element   xpath=//div[@class='o_searchview_facet']/div[contains(@class,'fa-remove')]
    Input Text      xpath=//input[@class='o_searchview_input']      Selenium
    Press Key       xpath=//input[@class='o_searchview_input']      \\13
    Wait Until Page Contains    Web Selenium
    Click Element   xpath=//div[contains(@class,'o_kanban_view')]/div[1]/div[@class='oe_module_desc']/button
    Wait Until Element Is Visible   xpath=//a[@data-menu='5']       timeout=30min
    MainMenu    5
    Click Element   xpath=//div[contains(@class,'o_kanban_view')]/div[1]/div[@class='oe_module_desc']/button
    Wait Until Element Is Visible   xpath=//a[@data-menu='210']     timeout=30min
    MainMenu    210
    SubMenu     212
    SubSubMenu  251
    Radio       stock.config.settings   warehouse_and_location_usage_level  2
    ButtonConfig      stock.config.settings   execute  
    Wait Until Element Is Visible   xpath=//a[@data-menu='5']       timeout=30min
    MainMenu    5
    Click Element   xpath=//div[contains(@class,'o_kanban_view')]/div[2]/div[@class='oe_module_desc']/button
    Wait Until Element Is Visible   xpath=//a[@data-menu='5']       timeout=30min
    MainMenu    5
    Click Element   xpath=//div[contains(@class,'o_kanban_view')]/div[3]/div[@class='oe_module_desc']/button
    Wait Until Element Is Not Visible   xpath=//div[contains(@class,'o_kanban_view')]/div[3]/div[@class='oe_module_desc']/button    timeout=30min
Import Data
    BackToMainMenu
    MainMenu    278
    MainMenu    280
    Click Button    xpath=//button[@accesskey='l']
    Wait Until Element Is Visible   xpath=//button[contains(text(),'Import')]
    Click Button    xpath=//button[contains(text(),'Import')]
    Wait Until Element Is Visible   xpath=//label[@for='my-file-selector']
    Click Element   xpath=//label[@for='my-file-selector']
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'Import')]      timeout=30min
    Click Button    xpath=//button[contains(text(),'Import')]
    Wait Until Element Is Not Visible   xpath=//label[@for='my-file-selector']
    BackToMainMenu
    MainMenu    210
    Click Element   xpath=//li[@class='o_extra_menu_items']/a
    SubSubMenu  249
    Wait Until Element Is Visible   xpath=//div[contains(@class,'oe_kanban_global_click')]
    Click Button    xpath=//button[@accesskey='l']
    Wait Until Element Is Visible   xpath=//table[contains(@class,'o_list_view')]
    Click Button    xpath=//button[contains(text(),'Import')]
    Wait Until Element Is Visible   xpath=//label[@for='my-file-selector']
    Click Element   xpath=//label[@for='my-file-selector']
    Wait Until Element Is Enabled    xpath=//button[contains(text(),'Import')]      timeout=30min
    Click Button    xpath=//button[contains(text(),'Import')]
    Wait Until Element Is Not Visible   xpath=//label[@for='my-file-selector']      timeout=30min
    Close Browser


