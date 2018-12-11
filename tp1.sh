#!/bin/bash
awk '
BEGIN{
	print "*********DEBUT***************\n";
}{
	if($1=="service" && $2=="password-encryption"){
		print "password encryption is implemented";
	}
	if($1 =="snmp-server" && $5!""){
		if($4=="RO"){
			print "Cette configuration implemente une access-list d''access droit = RO";	
		}
		else{
			print "Cette configuration implemente une access-list droit != RO";	
		}
	}
}END{
	print "\n***********FIN***************";
}' $*

