*** Settings ***

Documentation  Test generated by SeleniumBuilder for OpenERP 9.0 Enterprise
Resource       odoo_10_0_EE.robot
Resource       SakinahResource.robot
Library        Collections
Library        ExtendedSelenium2Library
Variables      config.py

Suite Setup      Run Keywords      Set Up


*** Test Cases ***
Login as Gudang
    LoginMember    gudang@sakinahkerudung.com    booshes_clone

Enter Inventory - Stock Operation
	MainMenu    210
    MainMenu    331

Create Stock Picking Gudang - Riung
    Button    stock.picking    oe_list_add
    Many2OneSelect    stock.picking    parent_batch    Dummy Batch
    Many2OneSelect    stock.picking    warehouse_src_id    Gudang Pusat
    Many2OneSelect    stock.picking    warehouse_dest_id    Riung

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

    MainMenu    331

Create Stock Picking Gudang - Jatinangor
    Button    stock.picking    oe_list_add
    Many2OneSelect    stock.picking    parent_batch    Dummy Batch
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

    MainMenu    331

Create Stock Picking Gudang - Gerlong
    Button    stock.picking    oe_list_add
    Many2OneSelect    stock.picking    parent_batch    Dummy Batch
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

    MainMenu    331
