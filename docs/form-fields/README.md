Copyright 2019 by Early Diagnosis and Treatment Research Foundation, Vista Expertise Network, and Paraxial.

This manual is licensed under a Creative Commons Attribution-Share Alike 4.0 International license. 
Visit creativecommons.org for details.

### Introduction

The data dictionaries represent all of the fields for VA-PALS ELCAP web application forms. They are saved in graphs 
within the application database under the global **^%wd(17.040801)**. Those graphs are generated by running a Mumps 
routine that imports the TSV files in this directory.

### View & Edit Data Dictionaries

If you only want to view the data dictionaries, it is recommended you open the `data-dictionary-all.xlsm` file. 
This is a Microsoft Excel document with macros enabled that will, upon request, import each of the TSV files into a 
human-readable format.

If you must edit the files, this must be done in the TSV file manually with a text editor or with your favorite TSV 
editor (i.e. Excel). When complete, it is recommended that the TSV files be re-imported into the xlsm file noted above.

### Import TSV & Generate Data Dictionary Graph

This application and repo include a Mumps routine for importing TSV files to generate DD graphs. Below are verbatim 
commands you can run from the Mumps command line to individually generate the eight DD graphs, assuming you're working in one of 
our development environments such as a Docker container. To build all eight DD graphs at once, instead run the last command (DODD^SAMIADMN)

```
>D PRSTSV^SAMIFF("/home/osehra/lib/silver/a-sami-vapals-elcap--vo-osehra-github/docs/form-fields/","background.tsv","form fields - background")
>D PRSTSV^SAMIFF("/home/osehra/lib/silver/a-sami-vapals-elcap--vo-osehra-github/docs/form-fields/","biopsy.tsv","form fields - biopsy")
>D PRSTSV^SAMIFF("/home/osehra/lib/silver/a-sami-vapals-elcap--vo-osehra-github/docs/form-fields/","ct-evaluation.tsv","form fields - ct evaluation")
>D PRSTSV^SAMIFF("/home/osehra/lib/silver/a-sami-vapals-elcap--vo-osehra-github/docs/form-fields/","follow-up.tsv","form fields - follow up")
>D PRSTSV^SAMIFF("/home/osehra/lib/silver/a-sami-vapals-elcap--vo-osehra-github/docs/form-fields/","intake.tsv","form fields - intake")
>D PRSTSV^SAMIFF("/home/osehra/lib/silver/a-sami-vapals-elcap--vo-osehra-github/docs/form-fields/","intervention.tsv","form fields - intervention")
>D PRSTSV^SAMIFF("/home/osehra/lib/silver/a-sami-vapals-elcap--vo-osehra-github/docs/form-fields/","pet-evaluation.tsv","form fields - pet evaluation")
>D PRSTSV^SAMIFF("/home/osehra/lib/silver/a-sami-vapals-elcap--vo-osehra-github/docs/form-fields/","register.tsv","form fields - register")

>D DODD^SAMIADMN

```




