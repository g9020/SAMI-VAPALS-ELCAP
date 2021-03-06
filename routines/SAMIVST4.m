SAMIVST4 ;;ven/arc/lgc - M2Broker calls for VA-PALS - ALL PTS  ;Jan 16, 2020@08:49
 ;;18.0;SAMI;;
 ;
 ;@license: see routine SAMIUL
 ;
 ; VA-PALS will be using Sam Habiel's [KBANSCAU] broker
 ;   to pull information from the VA server into the
 ;   VA-PALS client and, to push TIU notes generated by
 ;   VA-PALS forms onto the VA server.
 ; Using this broker between VistA instances requires
 ;   not only the IP and Port for the server be known,
 ;   but also, that the Access and Verify of the user
 ;   on the server be sent across as well.  This is
 ;   required as the user on the server must have the
 ;   necessary Context menu(s) allowing use of the
 ;   Remote Procedure(s).
 ; Seven parameters have been added to the client
 ;   VistA to prevent the necessity of hard coding
 ;   certain values and to allow for default values for others.
 ;   SAMI PORT
 ;   SAMI IP ADDRESS
 ;   SAMI ACCVER
 ;   SAMI DEFAULT PROVIDER
 ;   SAMI DEFAULT STATION NUMBER
 ;   SAMI TIU NOTE PRINT NAME
 ;   SAMI DEFAULT CLINIC IEN
 ; Note that the user selected must have active
 ;   credentials on both the Client and Server systems
 ;   and the following Broker context menu.
 ;      OR CPRS GUI CHART
 ;
 ;
 ;@routine-credits
 ;@primary development organization: Vista Expertise Network
 ;@primary-dev: Larry G. Carlson (lgc)
 ;@primary-dev: Alexis R. Carlson (arc)
 ;@additional-dev: Linda M. R. Yaw (lmry)
 ;@copyright:
 ;@license: see routine SAMIUL
 ;
 ;@last-updated: 2019-02-23
 ;@application: VA-PALS
 ;@version: 1.0
 ;
 ;
 ;@sac-exemption
 ; sac 2.2.8 Vendor specific subroutines may not be called directly
 ;  except by Kernel, Mailman, & VA Fileman.
 ; sac 2.3.3.2 No VistA package may use the following intrinsic
 ;  (system) variables unless they are accessed using Kernel or VA
 ;  FileMan supported references: $D[EVICE], $I[O], $K[EY],
 ;  $P[RINCIPAL], $ROLES, $ST[ACK], $SY[STEM], $Z*.
 ;  (Exemptions: Kernel & VA Fileman)
 ; sac 2.9.1: Application software must use documented Kernel
 ;  supported references to perform all platform specific functions.
 ;  (Exemptions: Kernel & VA Fileman)
 ;
 ; not from the top
 quit
 ;
 ;
 ;@dmi,@oi (Option: SAMI PULL VA-PALS PATIENTS)
ALLPTS ; Get all patients from a VA server by sequentially calling
 ;  for last names beginning with each letter of the
 ;  alphabet, building a complete array of patient names
 ;  in the ^SAMIUT("ALLPTS") global.  Once all the patient
 ;  names and demographics are pulled into this global,
 ;  the information is parsed into the 'patient-information'
 ;  graph in VA-PALS graph store database.
 ;
 ; Note : call directly or schedule option
 ;  SAMI PULL VA-PALS PATIENTS
 ;
 do ALLPTS1("ALLPTS")
 ; Now build a new 'patient-lookup' graph
 do MKGPH
 quit
 ;
 ;
 ;@dmi
ALLPTS1(SAMISS) ; Build ^SAMIUT(SAMISS global
 ;
 ;Input
 ;  SAMISS = Subscript name within ^SAMIUT global
 ;           to use for patient array
 ;           Specifically designed for UNIT TEST where
 ;           we don't wish to corrupt existing data set
 ;Exit
 ;  Builds ^SAMIUT(SAMISS global with all patient information
 ;    pulled from the VA server
 ;
 new SAMIXD,fini,CNTXT,RMPRC,CONSOLE,CNTNOPEN,SAMIXARR
 set CNTXT="HMP UI CONTEXT"
 set RMPRC="HMP PATIENT SELECT"
 set (CONSOLE,CNTNOPEN)=0
 set:'$length($get(SAMISS)) SAMISS="ALLPTS"
 ;
 kill ^SAMIUT(SAMISS)
 new I,J for I=65:1:90 do
 . set fini=$char(I)
 . kill SAMIXARR
 . set SAMIXARR(1)="NAME"
 . set SAMIXARR(2)=fini
 . do M2M^SAMIM2M(.SAMIXD,CNTXT,RMPRC,CONSOLE,CNTNOPEN,.SAMIXARR)
 . for J=1:1:$length(SAMIXD,$char(13,10)) do
 .. quit:'$length($piece(SAMIXD,$char(13,10),J))
 .. set ^SAMIUT(SAMISS,fini,J)=$piece(SAMIXD,$char(13,10),J)
 ;
 quit
 ;
 ;
 ;@dmi
MKGPH quit:'$data(^SAMIUT("ALLPTS"))
 ; Make Graph Store patient-lookup global from
 ;  ^SAMIUT("ALLPTS")
 ; e.g.
 ;   do MKGPH^KBAPUTL
 new si set si=$$CLRGRPS^SAMIVSTA("patient-lookup")
 quit:'$get(si)
 new gien,node,ptdata,root
 set root=$$setroot^%wd("patient-lookup")
 set gien=0
 new node set node=$name(^SAMIUT("ALLPTS"))
 new snode set snode=$piece(node,")")
 for  set node=$Q(@node) quit:node'[snode  do
 . set ptdata=@node
 . set gien=gien+1
 . set @root@(gien,"saminame")=$piece(ptdata,"^",4)
 . set @root@(gien,"sinamef")=$piece($piece($piece(ptdata,"^",4),",",2)," ")
 . set @root@(gien,"sinamel")=$piece($piece(ptdata,"^",4),",")
 . set @root@(gien,"sbdob")=$extract($piece(ptdata,"^",10),1,4)_"-"_$extract($piece(ptdata,"^",10),5,6)_"-"_$extract($piece(ptdata,"^",10),7,8)
 . set @root@(gien,"last5")=$piece(ptdata,"^",9)
 . set @root@(gien,"dfn")=$piece(ptdata,"^",12)
 . set @root@(gien,"gender")=$piece($piece($piece(ptdata,"pat-gender",2),"^",1,2),":",2)
 . set:($length($piece(ptdata,"^",12))) @root@("dfn",$piece(ptdata,"^",12),gien)=""
 . set:($length($piece(ptdata,"^",9))) @root@("last5",$piece(ptdata,"^",9),gien)=""
 .; Mixed case
 . set:($length($piece(ptdata,"^",4))) @root@("name",$piece(ptdata,"^",4),gien)=""
 .; Upper case
 . set:($length($piece(ptdata,"^",1))) @root@("name",$piece(ptdata,"^",1),gien)=""
 . if $length($piece(ptdata,"^",4)) do
 .. set @root@("saminame",$piece(ptdata,"^",4),gien)=""
 . if $length($piece($piece($piece(ptdata,"^",4),",",2)," ")) do
 .. set @root@("sinamef",$piece($piece($piece(ptdata,"^",4),",",2)," "),gien)=""
 . if $length($piece($piece(ptdata,"^",4),",")) do
 .. set @root@("sinamel",$piece($piece(ptdata,"^",4),","),gien)=""
 set @root@("Date Last Updated")=$$HTE^XLFDT($horolog)
 quit
 ;
 ;
 ;
 ;@rpi - PXRM REMINDERS AND CATEGORIES
 ;@oi - SAMI PULL REMINDERS
 ;@API-code: $$Reminders^SAMIVSTS -or- D Reminders^SAMIVSTS
 ; Pull Remiders off the server and build the
 ;    'reminders' Graphstore
 ;Enter
 ;   nothing required
 ;Return
 ;   If called as extrinsic
 ;      0 = rebuild of "reminders" Graphstore failed
 ;      n = number of reminders filed
RMDRS ;
 new CNTXT,RMPRC,CONSOLE,CNTNOPEN,SAMIXARR
 set CNTXT="OR CPRS GUI CHART"
 set RMPRC="PXRM REMINDERS AND CATEGORIES"
 set (CONSOLE,CNTNOPEN)=0
 do M2M^SAMIM2M(.SAMIXD,CNTXT,RMPRC,CONSOLE,CNTNOPEN,.SAMIXARR)
 ; if successful continue
 if '$length(SAMIXD,$char(13,10)) quit:$Q 0  quit
 new si set si=$$CLRGRPS^SAMIVSTA("reminders")
 if '$get(si) quit:$Q 0  quit
 new root set root=$$setroot^%wd("reminders")
 new gien set gien=0
 new I,rcnt,type,ien,name,prntname,rmdr
 set rcnt=0
 new if for i=1:1:$length(SAMIXD,$char(13,10)) do
 . set rmdr=$piece(SAMIXD,$char(13,10),i)
 . quit:($length(rmdr,"^")<3)
 . set rcnt=$get(rcnt)+1
 . set type=$piece(rmdr,U)
 . set ien=$piece(rmdr,U,2)
 . set name=$piece(rmdr,U,3)
 . set prntname=$piece(rmdr,U,4)
 . ;
 . set gien=gien+1
 . set @root@(gien,"type")=type
 . set @root@(gien,"ien")=ien
 . set @root@(gien,"name")=name
 . set @root@(gien,"printname")=prntname
 set @root@("Date Last Updated")=$$HTE^XLFDT($horolog)
 quit:$Q rcnt  quit
 ;
 ;
 ;
 ;@rpi -  ORQPT PROVIDERS
 ;@oi - SAMI PULL PROVIDERS
 ;@API-code: $$Providers^SAMIVSTS -or- D Providers^SAMIVSTS
 ; Pull Providers off the server and build the
 ;    'providers' Graphstore
 ;Enter
 ;   nothing required
 ;Return
 ;   If called as extrinsic
 ;      0 = rebuild of "providers" Graphstore failed
 ;      n = number of providers filed
PRVDRS ;
 new CNTXT,RMPRC,CONSOLE,CNTNOPEN,SAMIXARR
 set CNTXT="OR CPRS GUI CHART"
 set RMPRC="ORQPT PROVIDERS"
 set (CONSOLE,CNTNOPEN)=0
 do M2M^SAMIM2M(.SAMIXD,CNTXT,RMPRC,CONSOLE,CNTNOPEN,.SAMIXARR)
 ; if successful continue
 if '$length(SAMIXD,$char(13,10)) quit:$Q 0  quit
 new si set si=$$CLRGRPS^SAMIVSTA("providers")
 if '$get(si) quit:$Q 0  quit
 new root set root=$$setroot^%wd("providers")
 new gien set gien=0
 new I,pcnt,provduz,name,prvdr
 set pcnt=0
 for I=1:1:$length(SAMIXD,$char(13,10)) do
 . set prvdr=$piece(SAMIXD,$char(13,10),I)
 . quit:($length(prvdr,"^")<2)
 . set pcnt=$get(pcnt)+1
 . set provduz=$piece(prvdr,U)
 . set name=$piece(prvdr,U,2)
 . ;
 . set gien=gien+1
 . set @root@(gien,"duz")=provduz
 . set @root@(gien,"name")=name
 set @root@("Date Last Updated")=$$HTE^XLFDT($horolog)
 quit:$Q pcnt  quit
 ;
 ;
 ;
 ;@pi - SAMI PULL CLINICS
 ;@rpi -  ORWU1 NEWLOC
 ;@API-code: $$Clinics^SAMIVSTS -or- D Clinics^SAMIVSTS
 ; Pull Clinics off the server and build the
 ;    'clinics' Graphstore
 ;Enter
 ;   nothing required
 ;Return
 ;   If called as extrinsic
 ;      0 = rebuild of "clinics" Graphstore failed
 ;      n = number of clinics filed
CLINICS ;
 new CNTXT,RMPRC,CONSOLE,CNTNOPEN,SAMIXARR
 set CNTXT="OR CPRS GUI CHART"
 set RMPRC="ORWU1 NEWLOC"
 set (CONSOLE,CNTNOPEN)=0
 kill SAMIXARR
 set SAMIXARR(1)=" "
 set SAMIXARR(2)=1
 do M2M^SAMIM2M(.SAMIXD,CNTXT,RMPRC,CONSOLE,CNTNOPEN,.SAMIXARR)
 ; if successful continue
 if '$length(SAMIXD,$char(13,10)) quit:$Q 0  quit
 new si set si=$$CLRGRPS^SAMIVSTA("clinics")
 if '$get(si) quit:$Q 0  quit
 new root set root=$$setroot^%wd("clinics")
 new gien set gien=0
 new I,ccnt,clinien,name,cnc
 set ccnt=0
 for I=1:1:$length(SAMIXD,$char(13,10)) do
 . set cnc=$piece(SAMIXD,$char(13,10),I)
 . quit:($length(cnc,"^")<2)
 . set ccnt=$get(ccnt)+1
 . set clinien=$piece(cnc,U)
 . set name=$piece(cnc,U,2)
 . ;
 . set gien=gien+1
 . set @root@(gien,"ien")=clinien
 . set @root@(gien,"name")=name
 set @root@("Date Last Updated")=$$HTE^XLFDT($horolog)
 quit:$Q ccnt  quit
 ;
 ;
 ;@oi - SAMI PULL HEALTH FACTORS
 ;@rpi - ORWPCE GET HEALTH FACTORS TY
 ;@API-code: $$HealthFactors^SAMIVSTS -or- D HealthFactors^SAMIVSTS
 ; Pull Health Factors  off the server and build the
 ;    'health-factors' Graphstore
 ;Enter
 ;   nothing required
 ;Return
 ;   If called as extrinsic
 ;      0 = rebuild of "health-factors" Graphstore failed
 ;      n = number of health factors filed
HLTHFCT ; Clear the M Web Server files cache
 ;VEN/arc;test;function/procedure;dirty;silent;non-sac
 new CNTXT,RMPRC,CONSOLE,CNTNOPEN,SAMIXARR
 set CNTXT="OR CPRS GUI CHART"
 set RMPRC="ORWPCE GET HEALTH FACTORS TY"
 set (CONSOLE,CNTNOPEN)=0
 do M2M^SAMIM2M(.SAMIXD,CNTXT,RMPRC,CONSOLE,CNTNOPEN,.SAMIXARR)
 ; if successful continue
 if '$length(SAMIXD,$char(13,10)) quit:$Q 0  quit
 new si set si=$$CLRGRPS^SAMIVSTA("health-factors")
 if '$get(si) quit:$Q 0  quit
 new root set root=$$setroot^%wd("health-factors")
 new gien set gien=0
 new I,hcnt,ien,name,hfct
 set hcnt=0
 for I=1:1:$length(SAMIXD,$char(13,10)) do
 . set hfct=$piece(SAMIXD,$char(13,10),I)
 . quit:($length(hfct,"^")<2)
 . set hcnt=$get(hcnt)+1
 . set ien=$piece(hfct,U)
 . set name=$piece(hfct,U,2)
 . ;
 . set gien=gien+1
 . set @root@(gien,"ien")=ien
 . set @root@(gien,"name")=name
 . set:$length(name) @root@("name",name,gien)=""
 set @root@("Date Last Updated")=$$HTE^XLFDT($horolog)
 quit:$Q hcnt  quit
 ;
 ;
 ;@API-code: $$CLRGRPS^SAMIVSTS
 ;
 ; Clear a Graphstore global of data
 ;Enter
 ;   name = name of the Graphstore to clear
 ;Return
 ; if called as extrinsic function
 ;   0 = failure to find named Graphstore
 ;   ien (si) of the Graphstore in ^%wd(17.040801,
CLRGRPS ;
 if '($length($get(name))) quit:$Q 0  quit
 new root s root=$na(^%wd(17.040801))
 new si set si=$order(@root@("B",name,0))
 if $get(si) kill @root@(si) s @root@(si,0)=name
 else  do purgegraph^%wd(name) set si=$order(@root@("B",name,0))
 quit:$Q $get(si)  quit
 ;
EOR ; End of routine SAMIVST4