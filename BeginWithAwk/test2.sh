#!/bin/bash
awk '
BEGIN{  
	print "*********DEBUT***************\n";
	i=0;
}{
	if($1 =="access-list"){
		def[$2]=$0;
	}
	if($1=="access-class"){
		ref[$2]=$0;
	}
}END{
	for(id in def){
		if(!(id in ref))print def[id]
	}
	for(id in ref){
		if(!(id in def))print ref[id]
	}
	print "\n***********FIN***************";

}' $*

#le shell a une taille limite de commande, le $* ne pourra prendre qu'autant de fichier que la taille#disponible de commande le permet


