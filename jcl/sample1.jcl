//JCL      JOB CLASS=A,MSGCLASS=H,MSGLEVEL=(1,1)
//*********************************************
//***********************************
//* CMD1 ( DISP BEFORE )
//***********************************
//TSO1     EXEC PGM=IKJEFT1A
//SYSTSPRT DD DISP=(NEW,PASS),DSN=&&Z77941T,
//           UNIT=SYSDA,SPACE=(TRK,(10,10)),
//           DCB=(RECFM=FB,BLKSIZE=0,LRECL=80)
//SYSTSIN  DD *
LISTUSER
/*
//***********************************
//* CMD2 ( CHANGE)
//***********************************
//TSO2     EXEC PGM=IKJEFT1A
//SYSTSPRT DD *
//SYSTSIN  DD *
//***CHANGE COMMAND HERE
/*
//***********************************
//* CMD3 ( DISP AFTER )
//***********************************
//TSO3     EXEC PGM=IKJEFT1A
//SYSTSPRT DD DISP=(NEW,PASS),DSN=&&Z77941T2,
//           UNIT=SYSDA,SPACE=(TRK,(10,10)),
//           DCB=(RECFM=FB,BLKSIZE=0,LRECL=80)
//SYSTSIN  DD *
LISTUSER
/*
//***********************************
//* COMPARE
//***********************************
//COMPARE  EXEC PGM=ISRSUPC,
//         PARM=(DELTAL,LINECMP,'','')
//OUTDD    DD SYSOUT=*
//OLDDD    DD DISP=(OLD,PASS),DSN=&&Z77941T
//NEWDD    DD DISP=(OLD,PASS),DSN=&&Z77941T2
//*
//***********************************
//* DISP
//***********************************
//DISP     EXEC PGM=IEBGENER
//SYSPRINT DD DUMMY
//SYSUT1   DD DISP=(OLD,DELETE),DSN=&&Z77941T
//SYSUT1   DD DISP=(OLD,DELETE),DSN=&&Z77941T2
//SYSUT2   DD SYSOUT=*
//SYSIN    DD DUMMY
//*