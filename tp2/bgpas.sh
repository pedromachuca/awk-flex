#!/bin/bash
rm routeorigine.txt

awk '
BEGIN{
	print "*********DEBUT***************\n";
	r="";
	ipsrc="";
	ipdst="";
	assrc="";
	asdest="";
}{
	if($1=="hostname"){
		r=$2;
	}
	if($1=="ip"&&$2=="address"){
		ipsrc = $3;
	}
	if($1=="router"){
		assrc=$3
	}
	if($3=="remote-as"){
		asdst=$4
		ipdst=$2
		print ipsrc" ",assrc" vers "asdst" via ",ipdst >> "routeorigine.txt"
		print ipdst" ",asdst" vers "assrc" via ",ipsrc >> "routeorigine.txt"
	}


}END{
	print "\n***********FIN***************";
}' $*
cat routeorigine.txt | sort | uniq -d > goodroute.txt
#cat inventaire.txt | grep "export" | sort -k 3 > export.txt
#cat inventaire.txt | grep "import" | sort -k 3 > import.txt

#join -j 3 export.txt import.txt >route.txt


# r1 10.0.0.1  
# 4 vers 2 via 13.0.0.1 
# 4 vers 1 via 11.0.0.1 
#Inverse:
# 2 vers 4 via 10.0.0.1



#r2 10.0.0.2 
# 4 vers 2 via 13.0.0.2

#r3 11.0.0.1 
# 1 vers 4 via 10.0.0.1
# 1 vers 4 via 10.0.0.2


