#! /bin/bash
# Displays UFW status for i3blocks

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>

set -a

SHOW_INACTIVE=${SHOW_INACTIVE:-true}
SHOW_ACTIVE=${SHOW_ACTIVE:-false}
COLORIZE=${COLORIZE:-true}
BOLDEN=${BOLDEN:-true}

NA='\033[0m'                                                            # This escape sequence clears the currently set colour

"$COLORIZE" && COL_BAD=${COL_BAD:-'\033[0;31m'} || COL_BAD=""           # Default COL_BAD is red (31)
"$COLORIZE" && COL_GOOD=${COL_GOOD:-'\033[0;0;32m'} || COL_GOOD=""      # Default COL_GOOD is green (32)
"$BOLDEN" && BOLD='\033[1m' || BOLD=""

"$SHOW_ACTIVE" && MSG_ACTIVE=${MSG_ACTIVE:-"$COL_GOOD $BOLD UFW ON $NA"} || MSG_ACTIVE=""
"$SHOW_INACTIVE" && MSG_INACTIVE=${MSG_INACTIVE:-"$COL_BAD $BOLD UFW OFF! $NA"} || MSG_ACTIVE=""

if ( sudo ufw status | grep -w active &>/dev/null ) ; then
    echo -e "$MSG_ACTIVE"
else
    echo -e "$MSG_INACTIVE"
fi
