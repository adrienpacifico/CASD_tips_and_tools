# CASD tips & tools

CASD tips & tools is meant to share ressources about the usage of the [CASD](https://www.casd.eu) (standing for "CENTRE D’ACCÈS SÉCURISÉ AUX DONNÉES").

### Memory constraint

This concerns you if you have "Memory Error" (or memroy overflow)

CASD basic configuration is only 8 GB of RAM. It can make things really tedious when you have to deal with big tables. In order to merge two tables of 4 GB, you need to use 16 GB or RAM. If you try to process a merge of two table of 4 GB you will first fill your RAM, then the system will SWAP (write on the hard disk drive instead of writing into RAM), inside a file named `pagefile.sys` which is limited by default to 24 GB on the CASD. 

#### Solutions

1. You can ask the CASD to increase the `pagefile.sys`file over 24 GB (e.g to 70 GB).
  * Beware that memory will be loss on in the available space of your `M:` and `P:` spaces, you only have 200GB on the basic CASD     configuration.
  
2. You can manage your operation by `chunks` , or use a subsample of your data.


### Software usage

CASD provide preinstalled softwares on a Windows server (SAS, Stata). The official list is [here](https://www.casd.eu/technologie/environnement-de-travail/logiciels-disponibles/). 
CASD is willingly installing some open-source software for free, and will ask for monney to installs others. Contributors of this repo are more than welcome to create a list of freely installable softwares and those for which you need to pay.

#### Import a GitHub repo
TODO

### Use other data type than the one provided by [INSEE](https://www.insee.fr/fr/accueil)
Data on CASD are often provided as SAS table. SAS is proprietary, expensive and innaccessible, it should [not be promoted or used](https://www.gnu.org/philosophy/shouldbefree.en.html). SAS tables are encoded in a proprietary file format, you thus need to use SAS in order to use them.
1. You can run [this SAS code](https://github.com/adrienpacifico/CASD_utils/blob/master/Export_SAS_to_CSV_from_Source.sas) to export all your Data to CSV.
2. You can use packages made for your data annalysis software that reverse ingeniered the SAS format (see [SAS7BDAT](https://bitbucket.org/jaredhobbs/sas7bdat) for python, and [SAS7BDAT](https://github.com/BioStatMatt/sas7bdat) for R). Depending on the packages provided by CASD you may or may not have access to them.
