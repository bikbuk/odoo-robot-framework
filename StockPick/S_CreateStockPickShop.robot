*** Settings ***

Documentation  Test generated by SeleniumBuilder for OpenERP 9.0 Enterprise
Resource       ../Resources/odoo_10_0_EE.robot
Resource       ../Resources/SakinahResource.robot
Variables      ../Resources/config.py
Library        Collections
Library        SeleniumLibrary
Suite Setup      Run Keywords      Set Up


*** Test Cases ***
Create Stock Picking Riung - Jatinangor
    LoginMember    riung@sakinahkerudung.com    ${ODOO_DB}
	MainMenu    210
    MainMenu    330

    Button    stock.picking    oe_list_add
    Many2OneSelect    stock.picking    warehouse_src_id    Riung
    Many2OneSelect    stock.picking    warehouse_dest_id    Jatinangor

    NewOne2Many    stock.picking    move_lines
    X2Many-Many2OneSelect    stock.move    product_id    [0051] Parfum
    X2Many-Float    stock.move    product_uom_qty    5.0

    NewOne2Many    stock.picking    move_lines
    X2Many-Many2OneSelect    stock.move    product_id    [0055] Tempat Peniti
    X2Many-Float    stock.move    product_uom_qty    5.0

    NewOne2Many    stock.picking    move_lines
    X2Many-Many2OneSelect    stock.move    product_id    [0056] Tas Selendang
    X2Many-Float    stock.move    product_uom_qty    5.0

    Button    stock.picking    action_confirm
    Button    stock.picking    action_assign
    WaitBeforeClose     stock.picking      action_assign
    Close Browser

Jatinagor Validate Stock Picking
    LoginMember    jtngr@sakinahkerudung.com    ${ODOO_DB}
    MainMenu    210
    MainMenu    330

    SelectListView    stock.picking    name=JTNGR/IN/${N_FAILURE}

    ClickPencil    [0051] Parfum
    FloatWizard    stock.pack.operation    qty_done    5.0
    ButtonWizard    stock.pack.operation    save

    ClickPencil    [0055] Tempat Peniti
    FloatWizard    stock.pack.operation    qty_done    5.0
    ButtonWizard    stock.pack.operation    save

    ClickPencil    [0056] Tas Selendang
    FloatWizard    stock.pack.operation    qty_done    5.0
    ButtonWizard    stock.pack.operation    save

    Button    stock.picking    do_new_transfer
    WaitBeforeClose     stock.picking      do_new_transfer
    Close Browser
