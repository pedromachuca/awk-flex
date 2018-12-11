#!/bin/bash

awk '
BEGIN{
	print "*********DEBUT***************\n";
	inter="";
	ip="";
	access="";
}{
	if($1=="interface"||$1=="!"){
		
		if(inter!=""){
			print "",inter;
			if(ip==""){
				print"No IP";
			}	
			if(ip ~ /^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]).){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$/){
				print"Matches an IP"; 
			}
			if(access==""){
				print"No access group";
			}
			if(access=="TRUE"){
				print"Access group";
			}
		}
		inter=$2;
		ip="";
		access="";
	}
	if($1=="ip"&&$2=="address"){
		ip=$3;
	}
	if($2=="access-group"){
		access="TRUE";
	}



}END{
	print "\n***********FIN***************";
}' $*


#Ecrire un programme qui vérifie que toute interface ayant une adresse ip effective
#implémente un « access-group ».
