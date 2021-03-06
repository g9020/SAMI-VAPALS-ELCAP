SAMITIU ;SAMI/lgc/arc - HL7 PATIENT LIST TIU processing for VAPALS ;Dec 20, 2019@13:49
 ;;18.0;SAMI;;;Build 1
 ;
 quit  ; no entry from top
 ;
 ;
EN ;
 ;do ^ZTER
 ;
 ;
 ;---------- PREPARE FOR SENDING ACK/NAK --------------------------
 ;
 ; Move message from HL7 global to ^KBAP(
 ;
 new nodecnt,fields
 kill ^KBAP("SAMITIU")
 ;
 ; Save every segment to the ^KBAP("SAMITIU" global
 for  X HLNEXT Q:HLQUIT'>0  quit:HLNODE=""  do SVNODE
 ;
 ;Now run processing routine to put patient data
 ;   into VAPALS patient-lookup graph
 do RECTIU(.fields)
 ;
 ; Don't (ACK)nowledge ACK messages (ien into file 771.2)
 I $G(HL("MTP"))=1 Q
 ;
 ; Send ACK message
ACK D:'($get(%ut)) ACK^SAMIHL7
 ;
 Q
 ;
 ;
 ;@ppi
SVNODE ; Save HL7 segment to ^KBAP global
 new kbapcnt
 set ^KBAP("SAMITIU",0)=$get(^KBAP("SAMITIU",0))+1
 set kbapcnt=$get(^KBAP("SAMITIU",0))
 set ^KBAP("SAMITIU",kbapcnt)=HLNODE
 Q
 ;
 ;
 ;@ppi
RECTIU(fields) ; Parse contents of ^KBAP("SAMITIU") into patient-lookup graph
 ;@input
 ;  fields = variable by reference. Used when unit testing
 ;@output
 ;  fields = array of last entry parsed by PARSE
 ;
 kill fields
 new node,nodecnt,fieldstr
 set fieldstr="",nodecnt=0
 for  set nodecnt=$order(^KBAP("SAMITIU",nodecnt)) quit:'nodecnt  do
 . if ^KBAP("SAMITIU",nodecnt)["MSH^~" quit
 . if ^KBAP("SAMITIU",nodecnt)["active duty" do  quit
 .. set fieldstr=^KBAP("SAMITIU",nodecnt)
 .; ok we have a node with patient data
 . s node=^KBAP("SAMITIU",nodecnt)
 . do PARSE(node,fieldstr,.fields)
 .; do not update patient-lookup graph if doing unit testing
 . do:'$data(%ut) UPDTPTL^SAMIHL7(.fields)
 quit
 ;
 ;
 ;@ppi
PARSE(node,fieldstr,fields) ;
 ;@input
 ;   node     = node in ^KBAP("SAMITIU" global
 ;   fieldstr = delimited string of field names
 ;   fields   = array by reference
 ;@output
 ;   fields  = array with information from ^KBAP entry
 ;
 kill fields
 new fldcnt,ss
 for fldcnt=1:1:$length(fieldstr,"^") do
 . set ss=$piece(fieldstr,"^",fldcnt)
 . set fields(ss)=$piece(node,"^",fldcnt)
 .; we will have fields("sex")=M or F, fields("gender")=M^MALE or F^FEMALE
 . if ss="sex" do
 .. set fields("gender")=fields(ss)_"^"_$select(fields(ss)["M":"MALE",fields(ss)["F":"FEMALE",1:"")
 ;zw fields
 write !
 quit
 ;
 ;
EOR ;End of routine SAMITIU
