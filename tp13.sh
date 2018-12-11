#!/bin/bash
awk '
BEGIN{
	print "*********DEBUT***************\n";
	line ="";
	aclin=aclout=0;
}{
	if($1=="line"||$1=="end"){

		if(line!=""){
			if(aclin==0){
				print"Erreur no aclin", line;
			}
			if(aclout==0){
				print"Erreur no aclout", line;
			}
		}	
		line=$0;
		aclin=aclout=0;
	}
	if($1=="access-class"&& $3=="in"){
		aclin=1;
	}
	if($1=="access-class"&& $3=="out"){
		aclout=1;
	}

}END{
	print "\n***********FIN***************";
}' $*



#Ecrire un programme qui vérifie que chaque « line » implémente une « access-
#class xx in » et une « access-class xx out ».
