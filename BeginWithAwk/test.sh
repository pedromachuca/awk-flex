#!/bin/bash
awk '
BEGIN{  
	print "*********DEBUT***************\n";
}{
	if($1 =="interface")interface =$0;
	if($1 =="ip" && $2 =="address")print interface $0;
}END{
	print "\n***********FIN***************";

}' $*

#le shell a une taille limite de commande, le $* ne pourra prendre qu'autant de fichier que la taille#disponible de commande le permet


