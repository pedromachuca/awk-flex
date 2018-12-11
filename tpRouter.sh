#!/bin/bash
awk '
BEGIN{  
	print "*********DEBUT***************\n";
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

#Ecrire un programme « générique » qui contrôle les ACLs définies mais pas
#appliquées et les ACLs appliquées, mais pas définies.
#a. On se limitera aux ACLs définies de type « access-list »
#b. On se limitera aux ACLs appliquées de type « access-class », « access-group »


#ip access-group BLOCK_VIRUS => référence et appliqué
#ip access-list extended BLOCK_VIRUS

#access-list 23 permit 10.0.168.143 => definition de l'acl 23 mais non référencé
#access-list 24 permit 10.0.168.133 => definition de l'acl 24 mais non référencé

#access-class 44 out => access-list 44 non définie
#access-class 33 in=> access-list 44 non définie
#access-class 44 out=> access-list 44 non définie

#snmp-server community esiea RW 77 => reference acl extended BLOCK_VIRUS et définie
#snmp-server community esiea1 RO 77

