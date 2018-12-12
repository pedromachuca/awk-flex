#!/bin/bash

awk '
BEGIN{
	print "*********DEBUT***************\n";
	pe="";
	client="";
	route="";
}{
	if($1=="hostname"){
		pe =$2;
	}
	if($1=="ip"){
		client = $3;
	}
	if($1=="route-target"){
		print pe"-"client,$2,$3 > "inventaire.txt"
	}
	
	

}END{
	print "\n***********FIN***************";
}' $*
cat inventaire.txt | grep "export" | sort -k 3 > export.txt
cat inventaire.txt | grep "import" | sort -k 3 > import.txt

join -j 3 export.txt import.txt >route.txt



#import pe1 clientA export 1
#	pe1 clientA import 1
#créer un fichier qui contient l'inventaire
#créer fichier d'export qui ne contient que les exports >>import.txt
#créer fichier d'export qui ne contient que les imports >>export.txt
#grep sur import (idem export)
#man join
