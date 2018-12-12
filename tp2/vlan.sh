#!/bin/bash
awk '
BEGIN{
	print "*********DEBUT***************\n";
	cat=""
	inter=""
	vlan=""
}{
	if($1=="hostname"){
		cat=$2
	}
	if($1=="interface"){
		inter = $2
	}
	if($1=="switchport"&&$2=="access"&&$3=="vlan"){
		vlan =$4
		print cat,vlan>> vlan.txt
	}
}END{
	print "\n***********FIN***************";
}' $*

#catX Interface communique catX Interface via vlanX
