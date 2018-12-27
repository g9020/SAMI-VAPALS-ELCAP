SAMIUTSV ;ven/lgc - UNIT TEST for SAMISAV ; 12/18/18 12:34pm
 ;;18.0;SAMI;;
 ;
 ; @section 0 primary development
 ;
 ; @routine-credits
 ; @primary-dev: Larry Carlson (lgc)
 ;  larry@fiscientific.com
 ; @primary-dev-org: Vista Expertise Network (ven)
 ;  http://vistaexpertise.net
 ; @copyright: 2012/2018, ven, all rights reserved
 ; @license: Apache 2.0
 ;  https://www.apache.org/licenses/LICENSE-2.0.html
 ;
 ; @application: SAMI
 ; @version: 18.0
 ; @patch-list: none yet
 ;
 ; @to-do
 ;
 ; @section 1 code
 ;
START I $T(^%ut)="" W !,"*** UNIT TEST NOT INSTALLED ***" Q
 D EN^%ut($T(+0),2)
 Q
 ;
 ;
STARTUP n utsuccess
 Q
 ;
SHUTDOWN ; ZEXCEPT: utsuccess
 K utsuccess
 Q
 ;
 ;
UTSAVF ; @TEST - extrinsic which returns the form key to use
 ;SAVFILTR^SAMISAV
 ; First test.  Move ceform-2018-10-21 to ceform-yyyy-mm-dd
 ;   and delete the old entry
 n sid,form,SAMIUVARS,root,SAMIUPOO,SAMIUARC,useform,node
 s sid="XXX00001"
 s form="ceform-2018-10-21" ; form built by earlier unit test
 s SAMIUVARS("sidc")="11/7/2018"
 s SAMIUVARS("cedos")="10/29/2018"
 s root=$$setroot^%wd("vapals-patients")
 ; save off ceform built by earlier unit test
 m SAMIUPOO=@root@("graph","XXX00001","ceform-2018-10-21")
 s useform=$$SAVFILTR^SAMISAV(.sid,.form,.SAMIUVARS)
 s utsuccess=(useform="ceform-2018-10-29")
 i '$d(@root@("graph","XXX00001",useform)) s utsuccess=0
 ; kill the new form just generated
 k @root@("graph","XXX00001",useform)
 ; return the original form
 m @root@("graph","XXX00001","ceform-2018-10-21")=SAMIUPOO
 ;D CHKEQ^%ut(utsuccess,1,"extrinsic which returns the ceform key FAILED!")
 ;
 ;Now test for "siform"
 ;Start by saving the present siform
 s node=$na(@root@("graph","XXX00001","siform")),node=$q(@node)
 s form=$qs(node,5)
 k SAMIUPOO m SAMIUPOO=@root@("graph","XXX00001",form)
 k @root@("graph","XXX00001",form)
 ;Now pull in the siform saved earlier with an earlier date
 D PLUTARR^SAMIUTST(.SAMIUARC,"UTSAVF")
 m @root@("graph","XXX00001",form)=SAMIUARC
 ;Now we can see about testing as the siform pulled in
 ;  is from an earlier date
 s sid="XXX00001"
 s node=$na(@root@("graph","XXX00001","siform")),node=$q(@node)
 s form=$qs(node,5)
 s SAMIUVARS("sidc")=@root@("graph","XXX00001",form,"sidc")
 ; run the api
 s useform=$$SAVFILTR^SAMISAV(.sid,.form,.SAMIUVARS)
 s utsuccess=(useform="siform-2018-11-07")
 i '$d(@root@("graph","XXX00001",useform)) s utsuccess=0
 ; kill the new form just generated
 k @root@("graph","XXX00001",useform)
 ; return the original form
 m @root@("graph","XXX00001",form)=SAMIUPOO
 D CHKEQ^%ut(utsuccess,1,"extrinsic which returns the siform key FAILED!")
 q
 ;
 ;
EOR ;End of routine SAMIUSV