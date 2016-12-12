#!/bin/bash
###########################################################################
# This Script is for copy files for OMPI
# by jaquer (Ivan Rodriguez)
#
###########################################################################
#	copyFilesOMPI.sh is free software: you can redistribute it and/or modify
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
if [ "$#" -lt 3 ]; then
	echo  "USO <programa> <hostfile> <host1> <host2> ....<hostN>"
	exit
else
	if [ -a $1 ]; then
		if [ -a $2 ]; then
			for host in "${@:3}"
			do
				echo "$host"
 				$(scp $1 $host:~/)
				$(scp $2 $host:~/)
			done
		else
			echo "NO EXISTE EL ARCHIVO $2"
		fi
	else
		echo "NO EXISTE EL ARCHIVO $1"
	fi
fi
