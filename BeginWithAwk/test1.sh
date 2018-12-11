#!/bin/bash
awk '
BEGIN{  
	print "*********DEBUT***************\n";
	i=0;
}{
	if($1 =="interface")interface[++i] =$0;
	if($1 =="ip" && $2 =="address")interface_ip[i]=$0;
}END{
	for(id in interface){
		print id, interface[id], interface_ip[id];
	}
	print "\n***********FIN***************";

}' $*

#le shell a une taille limite de commande, le $* ne pourra prendre qu'autant de fichier que la taille#disponible de commande le permet


