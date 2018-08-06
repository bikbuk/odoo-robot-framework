# Please rename this file to config.py and adapt it to your needs

# Selenium

# Time till the next command is executed
SELENIUM_DELAY = 0

# How long a "Wait Until ..." command should wait
SELENIUM_TIMEOUT = 20
BROWSER = "ff"
Marionette= True

# Odoo
SERVER = "localhost"
ODOO_PORT = "8069"
ODOO_URL = "http://" + SERVER + ":" + ODOO_PORT
ODOO_DB = "demo"
USER = "admin"
PASSWORD = "admin"

# DB data
ODOO_DB_USER = "odoo"
ODOO_DB_PASSWORD = ""
ODOO_DB_PORT = "5432"
