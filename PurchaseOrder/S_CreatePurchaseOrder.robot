*** Settings ***

Documentation  Test generated by SeleniumBuilder for OpenERP 9.0 Enterprise
Resource       ../Resources/odoo_10_0_EE.robot
Resource       ../Resources/SakinahResource.robot
Variables      ../Resources/config.py
Library        Collections
Library        SeleniumLibrary


Suite Setup      Run Keywords      Set Up

*** Test Cases ***
Login as Comisionare
    LoginMember    umiabi@sakinahkerudung.com    ${ODOO_DB}

Comisionare Enter Purchase - Purchase Order
	MainMenu    278
    MainMenu    328

Create Purchase Order
	Button    purchase.order    oe_list_add
	Many2OneSelect    purchase.order    partner_id    Aly
	#Choose File    xpath=//input[@class='o_form_input_file']    /home/alpakka/Pictures/haha.jpg
    Click Element    xpath=//button[@class='btn btn-default o_attach']
    Wait Until Page Contains Element    xpath=//div[@class='oe_attachment']
    Button    purchase.order    oe_form_button_save

Login as Accounting
    LoginMember    acc@sakinahkerudung.com    ${ODOO_DB}

Acc Enter Purchase - Purchase Order
    MainMenu    278
    MainMenu    294

Acc Edit Purchase Order
    PurchaseKanbanBox    PO00001
    Button    purchase.order    oe_form_button_edit

    Set Selenium Speed    0.2
    NewOne2Many    purchase.order    order_line
    X2Many-Many2OneSelect    purchase.order.line    product_id    [0051] Parfum
    X2Many-Float    purchase.order.line    product_qty    50.0
    X2Many-Float    purchase.order.line    price_subtotal    250000.0

    NewOne2Many    purchase.order    order_line
    X2Many-Many2OneSelect    purchase.order.line    product_id    [0055] Tempat Peniti
    X2Many-Float    purchase.order.line    product_qty    50.0
    X2Many-Float    purchase.order.line    price_subtotal    250000.0

    NewOne2Many    purchase.order    order_line
    X2Many-Many2OneSelect    purchase.order.line    product_id    [0056] Tas Selendang
    X2Many-Float    purchase.order.line    product_qty    50.0
    X2Many-Float    purchase.order.line    price_subtotal    375000.0
    Set Selenium Speed    0

    Button    purchase.order    button_confirm