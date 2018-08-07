** Settings ***

Documentation  Special login Keywords For Odoo 10.
Library	    SeleniumLibrary
Library  	String
Library     connection_erp.py
Library     Collections


*** Keywords ***
LoginAdmin   [Arguments]    ${db}
    Set Global Variable     ${ODOO_URL_DB}     http://${SERVER}:${ODOO_PORT}
    Open Browser    ${ODOO_URL_DB}  browser=${BROWSER}
    Go To                           ${ODOO_URL_DB}/web/database/selector
    Set Selenium Speed              ${SELENIUM_DELAY}
    Set Selenium Timeout            ${SELENIUM_TIMEOUT}
    Set Selenium Implicit Wait      ${SELENIUM_TIMEOUT}
    Click Element   xpath=//div[1]/div//a[@href="/web?db=${db}"]
    #Run Keyword and Ignore error    Click element   //a[@href="/web/login"]
    Wait Until Element is Visible   name=login
    Input Text  name=login  aa@aa.com
    Input Password  name=password   123
    Click Button    xpath=//div[contains(@class,'oe_login_buttons')]/button[@type='submit']
    #Wait Until Page Contains Element 	xpath=//div[contains(@class, 'o_application_switcher')]	timeout=30 sec

LoginMember   [Arguments]    ${user}    ${db}
    Set Global Variable     ${ODOO_URL_DB}     http://${SERVER}:${ODOO_PORT}
    Open Browser    ${ODOO_URL_DB}  browser=${BROWSER}
    Go To                           ${ODOO_URL_DB}/web/database/selector
    Set Selenium Speed              ${SELENIUM_DELAY}
    Set Selenium Timeout            ${SELENIUM_TIMEOUT}
    Set Selenium Implicit Wait      ${SELENIUM_TIMEOUT}
    Click Element   xpath=//div[1]/div//a[@href="/web?db=${db}"]
    #Run Keyword and Ignore error    Click element   //a[@href="/web/login"]
    Wait Until Element is Visible   name=login
    Input Text  name=login  ${user}
    Input Password  name=password   go50cabang
    Click Button    xpath=//div[contains(@class,'oe_login_buttons')]/button[@type='submit']

ClickPencil    [Arguments]    ${product}
    Click Element    xpath=//td[@data-field='product_id' and normalize-space(string())=normalize-space('${product}')]/following::i

PurchaseKanbanBox    [Arguments]    ${name}
    Click Element    xpath=//div[@class='oe_kanban_card oe_kanban_global_click o_kanban_record' and descendant::span[contains(normalize-space(string()), normalize-space('${name}'))]]