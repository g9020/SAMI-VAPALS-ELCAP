SAMICTC1 ;ven/gpl - ceform copy routine ; 1/22/19 1:24pm
 ;;18.0;SAMI;;
 ;
 ;@license: see routine SAMIUL
 ;
 quit  ; no entry from top
 ;
CTCOPY(FROM,TO) ; copies a Ct Eval form selectively
 ; the following is generated from a graph - see genCTCOPY below
 S @TO@("ceanod")=$G(@FROM@("ceanod")) ; 
 S @TO@("cennod")=$G(@FROM@("cennod")) ; 
 S @TO@("cect1en")=$G(@FROM@("cect1en")) ; Endobronchial
 S @TO@("cect2en")=$G(@FROM@("cect2en")) ; Endobronchial
 S @TO@("cect3en")=$G(@FROM@("cect3en")) ; Endobronchial
 S @TO@("cect4en")=$G(@FROM@("cect4en")) ; Endobronchial
 S @TO@("cect5en")=$G(@FROM@("cect5en")) ; Endobronchial
 S @TO@("cect6en")=$G(@FROM@("cect6en")) ; Endobronchial
 S @TO@("cect7en")=$G(@FROM@("cect7en")) ; Endobronchial
 S @TO@("cect8en")=$G(@FROM@("cect8en")) ; Endobronchial
 S @TO@("cect9en")=$G(@FROM@("cect9en")) ; Endobronchial
 S @TO@("cect10en")=$G(@FROM@("cect10en")) ; Endobronchial
 S @TO@("cect1ll")=$G(@FROM@("cect1ll")) ; Most likely location
 S @TO@("cect2ll")=$G(@FROM@("cect2ll")) ; Most likely location
 S @TO@("cect3ll")=$G(@FROM@("cect3ll")) ; Most likely location
 S @TO@("cect4ll")=$G(@FROM@("cect4ll")) ; Most likely location
 S @TO@("cect5ll")=$G(@FROM@("cect5ll")) ; Most likely location
 S @TO@("cect6ll")=$G(@FROM@("cect6ll")) ; Most likely location
 S @TO@("cect7ll")=$G(@FROM@("cect7ll")) ; Most likely location
 S @TO@("cect8ll")=$G(@FROM@("cect8ll")) ; Most likely location
 S @TO@("cect9ll")=$G(@FROM@("cect9ll")) ; Most likely location
 S @TO@("cect10ll")=$G(@FROM@("cect10ll")) ; Most likely location
 S @TO@("cect1sn")=$G(@FROM@("cect1sn")) ; CT Series Number
 S @TO@("cect2sn")=$G(@FROM@("cect2sn")) ; CT Series Number
 S @TO@("cect3sn")=$G(@FROM@("cect3sn")) ; CT Series Number
 S @TO@("cect4sn")=$G(@FROM@("cect4sn")) ; CT Series Number
 S @TO@("cect5sn")=$G(@FROM@("cect5sn")) ; CT Series Number
 S @TO@("cect6sn")=$G(@FROM@("cect6sn")) ; CT Series Number
 S @TO@("cect7sn")=$G(@FROM@("cect7sn")) ; CT Series Number
 S @TO@("cect8sn")=$G(@FROM@("cect8sn")) ; CT Series Number
 S @TO@("cect9sn")=$G(@FROM@("cect9sn")) ; CT Series Number
 S @TO@("cect10sn")=$G(@FROM@("cect10sn")) ; CT Series Number
 S @TO@("cect1inl")=$G(@FROM@("cect1inl")) ; CT Image Number (Low
 S @TO@("cect1inh")=$G(@FROM@("cect1inh")) ; CT Image Number (Hig
 S @TO@("cect2inl")=$G(@FROM@("cect2inl")) ; CT Image Number (Low
 S @TO@("cect2inh")=$G(@FROM@("cect2inh")) ; CT Image Number (Hig
 S @TO@("cect3inl")=$G(@FROM@("cect3inl")) ; CT Image Number (Low
 S @TO@("cect3inh")=$G(@FROM@("cect3inh")) ; CT Image Number (Hig
 S @TO@("cect4inl")=$G(@FROM@("cect4inl")) ; CT Image Number (Low
 S @TO@("cect4inh")=$G(@FROM@("cect4inh")) ; CT Image Number (Hig
 S @TO@("cect5inl")=$G(@FROM@("cect5inl")) ; CT Image Number (Low
 S @TO@("cect5inh")=$G(@FROM@("cect5inh")) ; CT Image Number (Hig
 S @TO@("cect6inl")=$G(@FROM@("cect6inl")) ; CT Image Number (Low
 S @TO@("cect6inh")=$G(@FROM@("cect6inh")) ; CT Image Number (Hig
 S @TO@("cect7inl")=$G(@FROM@("cect7inl")) ; CT Image Number (Low
 S @TO@("cect7inh")=$G(@FROM@("cect7inh")) ; CT Image Number (Hig
 S @TO@("cect8inl")=$G(@FROM@("cect8inl")) ; CT Image Number (Low
 S @TO@("cect8inh")=$G(@FROM@("cect8inh")) ; CT Image Number (Hig
 S @TO@("cect9inl")=$G(@FROM@("cect9inl")) ; CT Image Number (Low
 S @TO@("cect9inh")=$G(@FROM@("cect9inh")) ; CT Image Number (Hig
 S @TO@("cect10inl")=$G(@FROM@("cect10inl")) ; CT Image Number (Low
 S @TO@("cect10inh")=$G(@FROM@("cect10inh")) ; CT Image Number (Hig
 S @TO@("cect1st")=$G(@FROM@("cect1st")) ; Nodule status
 S @TO@("cect2st")=$G(@FROM@("cect2st")) ; Nodule status
 S @TO@("cect3st")=$G(@FROM@("cect3st")) ; Nodule status
 S @TO@("cect4st")=$G(@FROM@("cect4st")) ; Nodule status
 S @TO@("cect5st")=$G(@FROM@("cect5st")) ; Nodule status
 S @TO@("cect6st")=$G(@FROM@("cect6st")) ; Nodule status
 S @TO@("cect7st")=$G(@FROM@("cect7st")) ; Nodule status
 S @TO@("cect8st")=$G(@FROM@("cect8st")) ; Nodule status
 S @TO@("cect9st")=$G(@FROM@("cect9st")) ; Nodule status
 S @TO@("cect10st")=$G(@FROM@("cect10st")) ; Nodule status
 S @TO@("cect1nt")=$G(@FROM@("cect1nt")) ; Nodule Consistency
 S @TO@("cect2nt")=$G(@FROM@("cect2nt")) ; Nodule Consistency
 S @TO@("cect3nt")=$G(@FROM@("cect3nt")) ; Nodule Consistency
 S @TO@("cect4nt")=$G(@FROM@("cect4nt")) ; Nodule Consistency
 S @TO@("cect5nt")=$G(@FROM@("cect5nt")) ; Nodule Consistency
 S @TO@("cect6nt")=$G(@FROM@("cect6nt")) ; Nodule Consistency
 S @TO@("cect7nt")=$G(@FROM@("cect7nt")) ; Nodule Consistency
 S @TO@("cect8nt")=$G(@FROM@("cect8nt")) ; Nodule Consistency
 S @TO@("cect9nt")=$G(@FROM@("cect9nt")) ; Nodule Consistency
 S @TO@("cect10nt")=$G(@FROM@("cect10nt")) ; Nodule Consistency
 S @TO@("cect1sl")=$G(@FROM@("cect1sl")) ; Length (mm)
 S @TO@("cect2sl")=$G(@FROM@("cect2sl")) ; Length (mm)
 S @TO@("cect3sl")=$G(@FROM@("cect3sl")) ; Length (mm)
 S @TO@("cect4sl")=$G(@FROM@("cect4sl")) ; Length (mm)
 S @TO@("cect5sl")=$G(@FROM@("cect5sl")) ; Length (mm)
 S @TO@("cect6sl")=$G(@FROM@("cect6sl")) ; Length (mm)
 S @TO@("cect7sl")=$G(@FROM@("cect7sl")) ; Length (mm)
 S @TO@("cect8sl")=$G(@FROM@("cect8sl")) ; Length (mm)
 S @TO@("cect9sl")=$G(@FROM@("cect9sl")) ; Length (mm)
 S @TO@("cect10sl")=$G(@FROM@("cect10sl")) ; Length (mm)
 S @TO@("cect1sw")=$G(@FROM@("cect1sw")) ; Maximum Width
 S @TO@("cect2sw")=$G(@FROM@("cect2sw")) ; Maximum Width
 S @TO@("cect3sw")=$G(@FROM@("cect3sw")) ; Maximum Width
 S @TO@("cect4sw")=$G(@FROM@("cect4sw")) ; Maximum Width
 S @TO@("cect5sw")=$G(@FROM@("cect5sw")) ; Maximum Width
 S @TO@("cect6sw")=$G(@FROM@("cect6sw")) ; Maximum Width
 S @TO@("cect7sw")=$G(@FROM@("cect7sw")) ; Maximum Width
 S @TO@("cect8sw")=$G(@FROM@("cect8sw")) ; Maximum Width
 S @TO@("cect9sw")=$G(@FROM@("cect9sw")) ; Maximum Width
 S @TO@("cect10sw")=$G(@FROM@("cect10sw")) ; Maximum Width
 S @TO@("cect1sh")=$G(@FROM@("cect1sh")) ; Height
 S @TO@("cect2sh")=$G(@FROM@("cect2sh")) ; Height
 S @TO@("cect3sh")=$G(@FROM@("cect3sh")) ; Height
 S @TO@("cect4sh")=$G(@FROM@("cect4sh")) ; Height
 S @TO@("cect5sh")=$G(@FROM@("cect5sh")) ; Height
 S @TO@("cect6sh")=$G(@FROM@("cect6sh")) ; Height
 S @TO@("cect7sh")=$G(@FROM@("cect7sh")) ; Height
 S @TO@("cect8sh")=$G(@FROM@("cect8sh")) ; Height
 S @TO@("cect9sh")=$G(@FROM@("cect9sh")) ; Height
 S @TO@("cect10sh")=$G(@FROM@("cect10sh")) ; Height
 S @TO@("cect1sv")=$G(@FROM@("cect1sv")) ; Volume
 S @TO@("cect2sv")=$G(@FROM@("cect2sv")) ; Volume
 S @TO@("cect3sv")=$G(@FROM@("cect3sv")) ; Volume
 S @TO@("cect4sv")=$G(@FROM@("cect4sv")) ; Volume
 S @TO@("cect5sv")=$G(@FROM@("cect5sv")) ; Volume
 S @TO@("cect6sv")=$G(@FROM@("cect6sv")) ; Volume
 S @TO@("cect7sv")=$G(@FROM@("cect7sv")) ; Volume
 S @TO@("cect8sv")=$G(@FROM@("cect8sv")) ; Volume
 S @TO@("cect9sv")=$G(@FROM@("cect9sv")) ; Volume
 S @TO@("cect10sv")=$G(@FROM@("cect10sv")) ; Volume
 S @TO@("cect1ssl")=$G(@FROM@("cect1ssl")) ; Solid Comp. Length
 S @TO@("cect1ssw")=$G(@FROM@("cect1ssw")) ; Solid Comp. Width
 S @TO@("cect2ssl")=$G(@FROM@("cect2ssl")) ; Solid Comp. Length
 S @TO@("cect2ssw")=$G(@FROM@("cect2ssw")) ; Solid Comp. Width
 S @TO@("cect3ssl")=$G(@FROM@("cect3ssl")) ; Solid Comp. Length
 S @TO@("cect3ssw")=$G(@FROM@("cect3ssw")) ; Solid Comp. Width
 S @TO@("cect4ssl")=$G(@FROM@("cect4ssl")) ; Solid Comp. Length
 S @TO@("cect4ssw")=$G(@FROM@("cect4ssw")) ; Solid Comp. Width
 S @TO@("cect5ssl")=$G(@FROM@("cect5ssl")) ; Solid Comp. Length
 S @TO@("cect5ssw")=$G(@FROM@("cect5ssw")) ; Solid Comp. Width
 S @TO@("cect6ssl")=$G(@FROM@("cect6ssl")) ; Solid Comp. Length
 S @TO@("cect6ssw")=$G(@FROM@("cect6ssw")) ; Solid Comp. Width
 S @TO@("cect7ssl")=$G(@FROM@("cect7ssl")) ; Solid Comp. Length
 S @TO@("cect7ssw")=$G(@FROM@("cect7ssw")) ; Solid Comp. Width
 S @TO@("cect8ssl")=$G(@FROM@("cect8ssl")) ; Solid Comp. Length
 S @TO@("cect8ssw")=$G(@FROM@("cect8ssw")) ; Solid Comp. Width
 S @TO@("cect9ssl")=$G(@FROM@("cect9ssl")) ; Solid Comp. Length
 S @TO@("cect9ssw")=$G(@FROM@("cect9ssw")) ; Solid Comp. Width
 S @TO@("cect10ssl")=$G(@FROM@("cect10ssl")) ; Solid Comp. Length
 S @TO@("cect10ssw")=$G(@FROM@("cect10ssw")) ; Solid Comp. Width
 S @TO@("cect1se")=$G(@FROM@("cect1se")) ; n
 S @TO@("cect1se")=$G(@FROM@("cect1se")) ;                 No
 S @TO@("cect2se")=$G(@FROM@("cect2se")) ; n
 S @TO@("cect2se")=$G(@FROM@("cect2se")) ;                 No
 S @TO@("cect3se")=$G(@FROM@("cect3se")) ; n
 S @TO@("cect3se")=$G(@FROM@("cect3se")) ;                 No
 S @TO@("cect4se")=$G(@FROM@("cect4se")) ; n
 S @TO@("cect4se")=$G(@FROM@("cect4se")) ;                 No
 S @TO@("cect5se")=$G(@FROM@("cect5se")) ; n
 S @TO@("cect5se")=$G(@FROM@("cect5se")) ;                 No
 S @TO@("cect6se")=$G(@FROM@("cect6se")) ; n
 S @TO@("cect6se")=$G(@FROM@("cect6se")) ;                 No
 S @TO@("cect7se")=$G(@FROM@("cect7se")) ; n
 S @TO@("cect7se")=$G(@FROM@("cect7se")) ;                 No
 S @TO@("cect8se")=$G(@FROM@("cect8se")) ; n
 S @TO@("cect8se")=$G(@FROM@("cect8se")) ;                 No
 S @TO@("cect9se")=$G(@FROM@("cect9se")) ; n
 S @TO@("cect9se")=$G(@FROM@("cect9se")) ;                 No
 S @TO@("cect10se")=$G(@FROM@("cect10se")) ; n
 S @TO@("cect10se")=$G(@FROM@("cect10se")) ;                 No
 S @TO@("cectin")=$G(@FROM@("cectin")) ; 1
 S @TO@("cectin")=$G(@FROM@("cectin")) ; 2
 S @TO@("cect1sp")=$G(@FROM@("cect1sp")) ; n
 S @TO@("cect1sp")=$G(@FROM@("cect1sp")) ;                 No
 S @TO@("cect2sp")=$G(@FROM@("cect2sp")) ; n
 S @TO@("cect2sp")=$G(@FROM@("cect2sp")) ;                 No
 S @TO@("cect3sp")=$G(@FROM@("cect3sp")) ; n
 S @TO@("cect3sp")=$G(@FROM@("cect3sp")) ;                 No
 S @TO@("cect4sp")=$G(@FROM@("cect4sp")) ; n
 S @TO@("cect4sp")=$G(@FROM@("cect4sp")) ;                 No
 S @TO@("cect5sp")=$G(@FROM@("cect5sp")) ; n
 S @TO@("cect5sp")=$G(@FROM@("cect5sp")) ;                 No
 S @TO@("cect6sp")=$G(@FROM@("cect6sp")) ; n
 S @TO@("cect6sp")=$G(@FROM@("cect6sp")) ;                 No
 S @TO@("cect7sp")=$G(@FROM@("cect7sp")) ; n
 S @TO@("cect7sp")=$G(@FROM@("cect7sp")) ;                 No
 S @TO@("cect8sp")=$G(@FROM@("cect8sp")) ; n
 S @TO@("cect8sp")=$G(@FROM@("cect8sp")) ;                 No
 S @TO@("cect9sp")=$G(@FROM@("cect9sp")) ; n
 S @TO@("cect9sp")=$G(@FROM@("cect9sp")) ;                 No
 S @TO@("cect10sp")=$G(@FROM@("cect10sp")) ; n
 S @TO@("cect10sp")=$G(@FROM@("cect10sp")) ;                 No
 S @TO@("cect1pld")=$G(@FROM@("cect1pld")) ; Distance
 S @TO@("cect2pld")=$G(@FROM@("cect2pld")) ; Distance
 S @TO@("cect3pld")=$G(@FROM@("cect3pld")) ; Distance
 S @TO@("cect4pld")=$G(@FROM@("cect4pld")) ; Distance
 S @TO@("cect5pld")=$G(@FROM@("cect5pld")) ; Distance
 S @TO@("cect6pld")=$G(@FROM@("cect6pld")) ; Distance
 S @TO@("cect7pld")=$G(@FROM@("cect7pld")) ; Distance
 S @TO@("cect8pld")=$G(@FROM@("cect8pld")) ; Distance
 S @TO@("cect9pld")=$G(@FROM@("cect9pld")) ; Distance
 S @TO@("cect10pld")=$G(@FROM@("cect10pld")) ; Distance
 S @TO@("cect1co")=$G(@FROM@("cect1co")) ; Comment
 S @TO@("cect2co")=$G(@FROM@("cect2co")) ; Comment
 S @TO@("cect3co")=$G(@FROM@("cect3co")) ; Comment
 S @TO@("cect4co")=$G(@FROM@("cect4co")) ; Comment
 S @TO@("cect5co")=$G(@FROM@("cect5co")) ; Comment
 S @TO@("cect6co")=$G(@FROM@("cect6co")) ; Comment
 S @TO@("cect7co")=$G(@FROM@("cect7co")) ; Comment
 S @TO@("cect8co")=$G(@FROM@("cect8co")) ; Comment
 S @TO@("cect9co")=$G(@FROM@("cect9co")) ; Comment
 S @TO@("cect10co")=$G(@FROM@("cect10co")) ; Comment
 S @TO@("cect1pd")=$G(@FROM@("cect1pd")) ; Pathologic diagnosis
 S @TO@("cect2pd")=$G(@FROM@("cect2pd")) ; Pathologic diagnosis
 S @TO@("cect3pd")=$G(@FROM@("cect3pd")) ; Pathologic diagnosis
 S @TO@("cect4pd")=$G(@FROM@("cect4pd")) ; Pathologic diagnosis
 S @TO@("cect5pd")=$G(@FROM@("cect5pd")) ; Pathologic diagnosis
 S @TO@("cect6pd")=$G(@FROM@("cect6pd")) ; Pathologic diagnosis
 S @TO@("cect7pd")=$G(@FROM@("cect7pd")) ; Pathologic diagnosis
 S @TO@("cect8pd")=$G(@FROM@("cect8pd")) ; Pathologic diagnosis
 S @TO@("cect9pd")=$G(@FROM@("cect9pd")) ; Pathologic diagnosis
 S @TO@("cect10pd")=$G(@FROM@("cect10pd")) ; Pathologic diagnosis
 S @TO@("cectancn")=$G(@FROM@("cectancn")) ; 1
 S @TO@("cectacn")=$G(@FROM@("cectacn")) ; 1
 S @TO@("ceem")=$G(@FROM@("ceem")) ; nv
 S @TO@("ceem")=$G(@FROM@("ceem")) ; no
 S @TO@("ceoca")=$G(@FROM@("ceoca")) ; n
 S @TO@("ceoca")=$G(@FROM@("ceoca")) ; y
 S @TO@("ceccv")=$G(@FROM@("ceccv")) ; e
 S @TO@("cecclm")=$G(@FROM@("cecclm")) ;               Left m
 S @TO@("ceccld")=$G(@FROM@("ceccld")) ;               LAD
 S @TO@("cecccf")=$G(@FROM@("cecccf")) ;               Circum
 S @TO@("ceccrc")=$G(@FROM@("ceccrc")) ;               RCA
 S @TO@("pa")=$G(@FROM@("pa")) ; n
 S @TO@("pa")=$G(@FROM@("pa")) ;            No
 ; Continue copy in second routine
 D CTCOPY2^SAMICTC2(FROM,TO)
 q
 ;
GENCTCPY ; generates the copy routine from a graph
 ;
 n root s root=$$setroot^%wd("ceform-fields")
 n fldf s fldf=$na(@root@("field"))
 w !,"generating copy from ",fldf
 n zi s zi=0
 f  s zi=$o(@fldf@(zi)) q:+zi=0  d  ;
 . i $g(@fldf@(zi,"copy"))'=1 q  ; only want copy fields
 . n name,label
 . s name=$g(@fldf@(zi,"name"))
 . s label=$g(@fldf@(zi,"label"))
 . s label=$e(label,1,20)
 . q:name=""
 . w !," S @TO@("""_name_""")=$G(@FROM@("""_name_""")) ; "_label
 q
 ;
