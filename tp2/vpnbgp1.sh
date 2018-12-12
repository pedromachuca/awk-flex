#!/bin/bash
rm graph.txt
awk '
BEGIN{
	print "*********DEBUT***************\n";
	edgeA="";
	edgeB="";
	print"g=DiGraph()">>"graph.txt"
}{
	if($2!=$4){
		print "g.add_edge((\""$2"\",\""$4"\"))">>"graph.txt"
	}	
}END{
	print"g.show()">>"graph.txt"
	print"g.connected_components()">>"graph.txt"
	print "\n***********FIN***************";
}' $*

