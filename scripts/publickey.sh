#!/bin/bash
###########################################################################
# Script for add keys to remote host
# the script needs to have created the .pub file in ~/.ssh/id_rsa.pub
# by jaquer (Ivan Rodriguez)
#
###########################################################################
#	publickey.sh is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
###########################################################################
if [ "$#" -lt 1 ]; then
	echo  "USO <host1> <host2> ... <hostN>"
	exit
else
	if [ -a ~/.ssh/id_rsa.pub ]; then 
		for host in "$@"
			do
				echo "$host"
 				$(ssh-copy-id -i ~/.ssh/id_rsa.pub $host)
			done
	else
		echo "NO ESTA CREADO ~/.ssh/id_rsa.pub "
	fi
fi
