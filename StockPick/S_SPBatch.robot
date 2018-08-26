*** Settings ***

Documentation  Test generated by SeleniumBuilder for OpenERP 9.0 Enterprise
Resource       ../Resources/odoo_10_0_EE.robot
Resource       ../Resources/SakinahResource.robot
Variables      ../Resources/config.py
Library        Collections
Library        SeleniumLibrary

Suite Setup      Run Keywords      Set Up

*** Test Cases ***
Login as Gudang
    Set Global Variable    ${batch_name}    Batch
    LoginMember    gudang@sakinahkerudung.com    ${ODOO_DB}
    MainMenu    210

Create Stock Picking Gudang - Riung
    Button    stock.picking    oe_list_add
    Many2OneSelect    stock.picking    parent_batch    ${BATCH1}

    Many2OneSelect    stock.picking    warehouse_src_id    Gudang Pusat
    Many2OneSelect    stock.picking    warehouse_dest_id    Riung

    NewOne2Many    stock.picking    move_lines
    X2Many-Many2OneSelect    stock.move    product_id    [0051] Parfum
    X2Many-Float    stock.move    product_uom_qty    20.0

    NewOne2Many    stock.picking    move_lines
    X2Many-Many2OneSelect    stock.move    product_id    [0055] Tempat Peniti
    X2Many-Float    stock.move    product_uom_qty    20.0

    NewOne2Many    stock.picking    move_lines
    X2Many-Many2OneSelect    stock.move    product_id    [0056] Tas Selendang
    X2Many-Float    stock.move    product_uom_qty    20.0

    Button    stock.picking    action_confirm
    Button    stock.picking    action_assign
    Button    stock.picking    do_new_transfer
    Button      stock.immediate.transfer    process
    WaitBeforeClose     stock.picking    do_new_transfer
    MainMenu    331

Create Stock Picking Gudang - Jatinangor
    Button    stock.picking    oe_list_add
    Many2OneSelect    stock.picking    parent_batch    ${BATCH1}
    Many2OneSelect    stock.picking    warehouse_src_id    Gudang Pusat
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
    Button    stock.picking    do_new_transfer
    Button      stock.immediate.transfer    process
    WaitBeforeClose     stock.picking    do_new_transfer
    MainMenu    331

Create Stock Picking Gudang - Gerlong
    Button    stock.picking    oe_list_add
    Many2OneSelect    stock.picking    parent_batch    ${BATCH1}
    Many2OneSelect    stock.picking    warehouse_src_id    Gudang Pusat
    Many2OneSelect    stock.picking    warehouse_dest_id    Gerlong

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
    Button    stock.picking    do_new_transfer
    Button      stock.immediate.transfer    process
    WaitBeforeClose     stock.picking    do_new_transfer
    Close Browser

Riung Receive Stock From Gudang
    LoginMember    riung@sakinahkerudung.com    ${ODOO_DB}
    MainMenu    210
    MainMenu    330

    SelectListView    stock.picking    name=RIUNG/IN/00001

    Button    stock.picking    do_new_transfer
    Button      stock.immediate.transfer    process
    WaitBeforeClose     stock.picking    do_new_transfer
    Close Browser

Jatinangor Receive Stock From Gudang
    LoginMember    jtngr@sakinahkerudung.com    ${ODOO_DB}
    MainMenu    210
    MainMenu    330
    
    SelectListView    stock.picking    name=JTNGR/IN/00001

    Button    stock.picking    do_new_transfer
    Button      stock.immediate.transfer    process
    WaitBeforeClose     stock.picking    do_new_transfer
    Close Browser

Gerlong Receive Stock From Gudang
    LoginMember    gerlong@sakinahkerudung.com    ${ODOO_DB}
    MainMenu    210
    MainMenu    330
   
    SelectListView    stock.picking    name=GRLNG/IN/00001

    Button    stock.picking    do_new_transfer
    Button      stock.immediate.transfer    process
    WaitBeforeClose     stock.picking    do_new_transfer
    Close Browser
