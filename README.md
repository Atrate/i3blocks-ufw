# i3blocks-ufw
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0) [![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-v2.0%20adopted-ff69b4.svg)](CODE_OF_CONDUCT.md)

A simple `bash` script designed for `i3blocks` that tells you whether UFW (a Linux firewall) is active or not.

## Installation

You will need to create a file in `sudoers.d` so that your user can execute `sudo ufw status` without entering their password.

In `/etc/sudoers.d/ufwstatus`:
```
Cmnd_Alias      UFWSTATUS = /usr/sbin/ufw status

%group          ALL=NOPASSWD: UFWSTATUS
```
where `group` is any group your user belongs to. Depending on the system configuration it can be `users`, your username, `sudo`, `wheel` or something else.

---

In `~/.config/i3blocks/config`:

```
[ufw]
command=<path/to/script>/i3blocks-ufw.sh
interval=60
#SHOW_INACTIVE=true
#SHOW_ACTIVE=false
#COLORIZE=false                                 # It seems formatting doesn't work in i3blocks
#BOLDEN=false                                   # but you can still set it to true for e.g. Polybar
#COL_GOOD='\033[0;0;32m'
#COL_BAD='\033[0;31m'
#MSG_ACTIVE="$COL_GOOD $BOLD UFW ON $NA"
#MSG_INACTIVE=$COL_BAD $BOLD UFW OFF! $NA"
```

## Contributing

For guidelines on how to contribute please refer to [CONTRIBUTING.md](./CONTRIBUTING.md). Please keep in mind that all pull/merge requests should be submitted to the [GitLab repo](https://gitlab.com/Atrate/i3blocks-ufw), since repos on e.g. GitHub are just mirrors.

## License
This project is licensed under the [GPL-3.0-or-later](https://www.gnu.org/licenses/gpl-3.0.html).
