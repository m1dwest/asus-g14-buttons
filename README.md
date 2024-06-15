# asus-g14-buttons
Scripts that enable (some of) the media and function buttons for the ROG Zephyrus G14 GA401 laptop.
## Dependencies
* [asusctl](https://gitlab.com/asus-linux/asusctl)
* [acpid](https://archlinux.org/packages/extra/x86_64/acpid/)
* [brightnessctl](https://archlinux.org/packages/extra/x86_64/brightnessctl/)
## Installation
### Automatic Installation
Use install script (dependencies will not be installed):
``` bash
./install.sh
```
### Manual Installation
Copy all the directories to `/etc/acpi`. Don't forget to check for and remove any existing handlers, such as `anything`, that handle all the events:
```
# Pass all events to our one handler script
event=.*
```
After making any changes to the /etc/acpi/events directory, the acpid.service needs to be restarted:
``` bash
systemctl restart acpid.service
```
