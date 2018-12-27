SAMIUTST ;ven/lgc - Unit Test Utilities ; 12/27/18 12:41pm
 ;;18.0;SAMI;;
 ;
 ; Routine to push and pull information used during unit testing
 ;   of va-pals routines
 ;
START I $T(^%ut)="" W !,"*** UNIT TEST NOT INSTALLED ***" Q
 D EN^%ut($T(+0),2)
 Q
 ;
 Q  ; No entry from top
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
 ; @last-updated: 11/1/18 1:39pm
 ; @application: SAMI
 ; @version: 18.0
 ; @patch-list: none yet
 ;
 ; @to-do
 ;
 ; @section 1 code
 ;
 ; 
 ; Enter
 ;    arr   =  name of the array of unit test data to save
 ;             e.g. "poo" for poo(1)=xxx,poo(2)=yyy
 ;                  "^TMP("yottaForm",20523)"
 ;    title =  title of the unit test
 ;             e.g. PATLIST-SAMIHOM3
 ;    NOTE: deletes any earlier entry under this title, thus,
 ;          title must be unique
 ; Return
 ;    loads "vapals unit tests" Graphstore under the
 ;       title entry with the data from the array
SVUTARR(arr,title) ;
 q:'$d(arr)
 q:($g(title)="")
 n root s root=$$setroot^%wd("vapals unit tests")
 n gien s gien=$$GETGIEN(root,title)
 k @root@(gien)
 ; load data
 m @root@(gien)=arr
 q
 ;
 ;
 ; Enter
 ;     arr   = array by reference to fill with data from Graphstore
 ;     title = title of the unit test
 ; Return
 ;     arr   = data pulled from the title entry in "vapals unit tests"
 ;             Graphstore
PLUTARR(arr,title) ;
 K arr
 q:($g(title)="")
 n root s root=$$setroot^%wd("vapals unit tests")
 n gien s gien=$$GETGIEN(root,title)
 ; pull data
 M arr=@root@(gien)
 Q
 ;
 ;Enter
 ;   dfn   = dfn of patient to use as test patient
 ;   title = title of entry in "vapals unit tests"
 ;Return
 ;   pushes a copy of the patient entry in the
 ;     "patient-lookup" Graphstore into the
 ;     "vapals unit tests" Graphstore
SVTSTPT(dfn,title) ;
 q:($G(title)="")
 q:'$G(dfn)
 n rootut S rootut=$$setroot^%wd("vapals unit tests")
 n gienut S gienut=$$GETGIEN(rootut,title)
 k @rootut@(gienut)
 s @rootut@(gienut,"title")=title
 ; load data
 n rootpl s rootpl=$$setroot^%wd("patient-lookup")
 n gienpl s gienpl=$O(@rootpl@("dfn",dfn,0))
 m @rootut@(gienut)=@rootpl@(gienpl)
 q
 ;
 ;
 ;Enter
 ;   root   = root of "vapals unit tests" Graphstore
 ;   title  = title of unit test entry
 ;Return
 ;   gien of title in "vapals unit tests"
 ;   NOTE: if this title didn't exist, it is generated
GETGIEN(root,title) ;
 n gien s gien=$o(@root@("B",title,0))
 q:gien gien
 s gien=$o(@root@("A"),-1)+1
 s @root@(gien,"title")=title
 s @root@("B",title,gien)=""
 q gien
 ;
 ;
 ; Build and save an array of all routines used
 ;  by VAPALS.  Then generate and save an array
 ;  of these routines and their present checksums
 ;  as determined by CHECK1
 ;
BLDRTNS ;
 n temp,poo,arc,cnt,str
 s cnt=0
 f  s cnt=cnt+1 s str=$p($t(RTNS+cnt),";;",2) q:str=""  d
 . S temp(cnt)=str
 d SVUTARR(.temp,"vapals routines")
 d PLUTARR(.poo,"vapals routines")
 s cnt=0
 f  s cnt=$o(poo(cnt)) q:'cnt  d
 . n X,Y S X=poo(cnt) X ^%ZOSF("RSUM1")
 . s arc(poo(cnt))=Y
 s cnt="" f  s cnt=$o(arc(cnt)) q:(cnt="")  w !,cnt," = ",arc(cnt)
 d SVUTARR(.arc,"vapals routines checksums")
 q
 ;
 ;
UTCHKSM ; @TEST - Test VAPALS routines checksums
 n poo,arc,temp,nodea,nodet,utsuccess
 d PLUTARR(.temp,"vapals routines checksums")
 d PLUTARR(.poo,"vapals routines")
 s cnt=0,utsuccess=1
 f  s cnt=$o(poo(cnt)) q:'cnt  d
 . n X,Y S X=poo(cnt) X ^%ZOSF("RSUM1")
 . S arc(poo(cnt))=Y
 s nodea=$NA(arc),nodet=$NA(temp)
 w !,!
 f  s nodea=$q(@nodea),nodet=$q(@nodet) q:nodea=""  d
 . i '($qs(nodea,1)=$qs(nodet,1)) s utsuccess=0
 . i '(@nodea=@nodet) s utsuccess=0
 . w !,$qs(nodea,1),"-",@nodea,"   ",$qs(nodet,1),"-",@nodet
 w !,!
 i 'nodet="" s utsuccess=0
 ;
 d CHKEQ^%ut(utsuccess,1,"Testing VAPALS routines checksum FAILED!")
 q
 ;
UTSTGS ; @TEST - Save array to vapals unit tests graphstore
 n poo,arc,root,gienut,title,nodep,nodea
 s poo("TEST1")="TESTING ONE"
 s poo("TEST2")="TESTING TWO"
 s title="TEMP UNIT TEST ARRAY"
 d SVUTARR(.poo,title)
 d PLUTARR(.arc,title)
 ; KILL THE TEMPORARY ENTRY
 n rootut s rootut=$$setroot^%wd("vapals unit tests")
 n gienut s gienut=$$GETGIEN(rootut,title)
 k @rootut@(gienut)
 k @rootut@("B",title)
 s utsuccess=1
 s nodea=$na(arc),nodep=$na(poo)
 f  s nodea=$q(@nodea),nodep=$q(@nodep) q:nodea=""  d
 . i '($qs(nodea,1)=$qs(nodep,1)) s utsuccess=0
 . i '(@nodea=@nodep) s utsuccess=0
 i 'nodep="" s utsuccess=0
 D CHKEQ^%ut(utsuccess,1,"Testing saving/pulling from vapals unit test graphstore FAILED!")
 ;
SETROOT(name) ;
 n siglb s siglb="setroot^%wd("""_name_""")"
 d @siglb
 s siglb="^%wd(17.040801,""B"","""_name_""",0)"
 n si s si=$o(@siglb)
 n root s root="^%wd(17.040801,"_si_")"
 q root
 ;
RTNS ;
 ;;SAMIM2M
 ;;KBANSCAU
 ;;SAMIADMN
 ;;SAMICAS2
 ;;SAMICTC1
 ;;SAMICTD2
 ;;SAMICTR
 ;;SAMICTR0
 ;;SAMICTR1
 ;;SAMICTR9
 ;;SAMICTRA
 ;;SAMICTRX
 ;;SAMIFRM2
 ;;SAMIHOM3
 ;;SAMIIFF
 ;;SAMILOG
 ;;SAMIM2M
 ;;SAMINOTI
 ;;SAMIPTLK
 ;;SAMIRU
 ;;SAMISAV
 ;;SAMISRC2
 ;;SAMIUR1
 ;;SAMIVSTA
 ;;SAMIVSTS
 ;;
 ;
 ;
EOR ; end of routine SAMIUTST