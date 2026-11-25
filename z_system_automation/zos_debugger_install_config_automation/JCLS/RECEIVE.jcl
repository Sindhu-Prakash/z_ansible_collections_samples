//RECEIVE JOB CLASS=A,
//     MSGCLASS=A,REGION=0M,MSGLEVEL=(1,1),NOTIFY=&SYSUID
//RECEIVE  EXEC PGM=GIMSMP,REGION=0M,PARM='DATE=U'
//SMPCSI   DD DISP=SHR,
//            DSN={{ smphlq }}.CSI
//SMPHOLD  DD DUMMY                                                 
//SMPPTFIN DD DISP=SHR,DSN={{ zosmf_user }}.{{ ptf_files[0] | upper }}
{% for f in ptf_files[1:] %}
//         DD DISP=SHR,DSN={{ zosmf_user }}.{{ f | upper }}
{% endfor %}
//*                                                                           
//SMPCNTL  DD *                                                     
    SET BDY(GLOBAL).
    RECEIVE                                                            
    SYSMODS LIST .
/*                                                                 
