Libname EDP "S:\EDP\EDP 2015";

%MACRO Convert2CSV(Libname);
    DATA MEMBERS;
    SET SASHELP.VMEMBER(WHERE= (LIBNAME = "&Libname"));
    RETAIN OBS 0;
    OBS = OBS+1;
    KEEP MEMNAME OBS;
    RUN;
    PROC SQL;
    SELECT MIN(OBS) INTO :MIN
    FROM MEMBERS;
    QUIT;
    %LOCAL D;
     %DO D = &MIN %TO &MAX;
      PROC SQL;
      SELECT COMPRESS(MEMNAME) INTO: Table
       FROM MEMBERS
       WHERE OBS=&D;
    QUIT;
    PROC EXPORT DBMS=CSV DATA=&Libname..&Table /* Replace CSV by DTA for stata export */
    /* You need to create P:\mon_dossier */
    OUTFILE="P:\mon_dossier\&Table..CSV";  /* Replace CSV by .dta for stata export */
    RUN;
   %END;
%MEND;
%Convert2CSV(EDP)