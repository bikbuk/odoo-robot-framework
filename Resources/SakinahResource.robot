*** Settings ***

Documentation  Special login Keywords For Odoo 10.
Resource    odoo_10_0_EE.robot
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

ClickPencil    [Arguments]    ${product}    ${qty_done}
    Modal   Click Element    xpath=//td[@data-field='product_id' and normalize-space(string())=normalize-space('${product}')]/following::i
    FloatWizard    stock.pack.operation    qty_done    ${qty_done}
    ButtonWizard    stock.pack.operation    save
    ElementPostCheck

Many2OneCreate  [Arguments]     ${model}    ${field}
    SelectNotebook  xpath=//input[@data-bt-testing-model_name='${model}' and @data-bt-testing-name='${field}']
    Modal   Click Element  xpath=//input[@data-bt-testing-model_name='${model}' and @data-bt-testing-name='${field}']
    Mouse Over  xpath=//ul[contains(@class,'ui-autocomplete') and not(contains(@style,'display: none'))]/li[last()]/a
    Click Link  xpath=//ul[contains(@class,'ui-autocomplete') and not(contains(@style,'display: none'))]/li[last()]/a
    ElementPostCheck

PurchaseKanbanBox    [Arguments]    ${name}

    Click Element    xpath=//div[@class='oe_kanban_card oe_kanban_global_click o_kanban_record' and descendant::span[contains(normalize-space(string()), normalize-space('${name}'))]]

SavePopUpWindow
    Wait Until Page Contains Element    xpath=//div[contains(@class,'o_cp_pager')]
    Click Button    xpath=//div[@class='modal-footer']/button[contains(@class,'btn-primary') and not(contains(@class,'o_form_button_edit'))]

DiscarPopUpWindow
    Wait Until Page Contains Element    xpath=//div[contains(@class,'o_cp_pager')]
    Click Button    xpath=//div[@class='modal-footer']/button[contains(@class,'o_form_button_cancel')]

EditPopUpWindow
    Wait Until Page Contains Element    xpath=//div[contains(@class,'o_cp_pager')]
    Click Button    xpath=//div[@class='modal-footer']/button[contains(@class,'o_form_button_edit')]

OKPopUpWindow
    Wait Until Page Contains Element    xpath=//div[contains(@class,'o_cp_pager')]
    Click Button    xpath=//div[@class='modal-footer']/button[@type_data_is='WidgetButton']

PaymentJournal     [Arguments]     ${model}    ${field}    ${value}
    SelectNotebook  xpath=//select[@data-bt-testing-model_name='${model}' and @data-bt-testing-name='${field}']
    Click Element  xpath=//div[contains(@div,modal)]//select[@data-bt-testing-model_name='${model}' and @data-bt-testing-name='${field}']
    Click Element  xpath=//div[contains(@div,modal)]//select[@data-bt-testing-model_name='${model}' and @data-bt-testing-name='${field}']/option[contains(text(), '${value}')]
    ElementPostCheck

WaitBeforeClose     [Arguments]     ${model}        ${button_name}
    Wait Until Element Is Not Visible     xpath=//button[@data-bt-testing-model_name='${model}' and @data-bt-testing-name='${button_name}']

ButtonConfig        [Arguments]     ${model}=       ${button_name}= ${class}=
    Run Keyword Unless  '${model}' == ''    Modal   Focus   xpath=//button[@data-bt-testing-model_name='${model}' and @data-bt-testing-name='${button_name}' and not(contains(@class,'o_form_invisible'))]
    Run Keyword Unless  '${model}' == ''    Modal   Click Button    xpath=//button[@data-bt-testing-model_name='${model}' and @data-bt-testing-name='${button_name}' and not(contains(@class,'o_form_invisible'))]
    Run Keyword If  '${model}' == ''    Modal   Focus   xpath=//button[@class='${class}']
    Run Keyword If  '${model}' == ''    Modal   Click Button    xpath=//button[@class='${class}']
    ElementPostCheck
