#!/bin/bash
##########################################################################
# This Script is for ejecutate OMPI 
# by jaquer (Ivan Rodriguez)
#
###########################################################################
#	runMpi.sh is free software: you can redistribute it and/or modify
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
if [ "$#" -lt 2 ]; then
	echo  "USO <programa> <hostfile>"
	exit
else
	if [ -a $1 ]; then
		if [ -a $2 ]; then
			numberlines=$(cat $2 | wc -l)
			echo "$numberlines HOSTS"
			mpirun -mca plm_rsh_no_tree_spawn 1 -hostfile $2 -n $numberlines $1
		else
			echo "NO EXISTE EL ARCHIVO $2"
		fi
	else
		echo "NO EXISTE EL ARCHIVO $1"
	fi
fi
