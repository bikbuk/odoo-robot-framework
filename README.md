This is premade keyword forked from [brain-tec](https://github.com/brain-tec) 
to make test automation via browser using robotframework with seleniumlibrary for odoo

## Installation

```bash
pip install robotframework
pip install --upgrade robotframework-seleniumlibrary
git clone https://github.com/bikbuk/odoo-robot-framework.git
```
If you want to run the test on Firefox, you have to download geckodriver [here](https://github.com/mozilla/geckodriver/releases)

Extract the file, then put it on PATH


You can also find drivers for other browser [here](https://www.seleniumhq.org/download/)

## Run tests

Save the testfile (from SE Builder) in the same directory as the odoo-robot-framework and execute
```bash
pybot testfile.robot
```
