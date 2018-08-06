*** Settings ***

Documentation  Test generated by SeleniumBuilder for OpenERP 9.0 Enterprise
Resource       odoo_10_0_EE.robot
Resource       SakinahResource.robot
Library        Collections
Library        ExtendedSelenium2Library
Variables      config.py

Suite Setup      Run Keywords      Set Up


*** Test Cases ***
Login as Riung
    LoginMember    riung@sakinahkerudung.com    booshes_clone

Riung Enter Inventory - Stock Operation
	MainMenu    210
    MainMenu    330

Create Stock Picking Riung - Jatinangor
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

Login as Jatinagor
    LoginMember    jtngr@sakinahkerudung.com    booshes_clone

Jatinangor Enter Inventory - Stock Operation
    MainMenu    210
    MainMenu    330

Jatinagor Validate Stock Picking
    SelectListView    stock.picking    name=JTNGR/IN/00003

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