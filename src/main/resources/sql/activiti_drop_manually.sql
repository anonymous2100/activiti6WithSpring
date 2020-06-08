-- MySQL数据库activiti6.0.0手动【删】表语句
-- 
-- 
-- 
-- 删除activiti6.0.0的所有表结构
-- activiti6.0.0的删除语句所在位置（需要下载Activiti6.0的源码） 
-- D:\Activiti-activiti-6.0.0\modules\activiti-engine\src\main\resources\org\activiti\db\drop
-- 
-- 删除表结构的语句在下面三个文件中
-- activiti.mysql.drop.engine.sql
-- activiti.mysql.drop.history.sql
-- activiti.mysql.drop.identity.sql

-- drop engine
drop index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION;
drop index ACT_IDX_TASK_CREATE on ACT_RU_TASK;
drop index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK;
drop index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK;
drop index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE;
drop index ACT_IDX_INFO_PROCDEF on ACT_PROCDEF_INFO;

alter table ACT_GE_BYTEARRAY 
    drop FOREIGN KEY ACT_FK_BYTEARR_DEPL;

alter table ACT_RU_EXECUTION
    drop FOREIGN KEY ACT_FK_EXE_PROCINST;

alter table ACT_RU_EXECUTION 
    drop FOREIGN KEY ACT_FK_EXE_PARENT;

alter table ACT_RU_EXECUTION 
    drop FOREIGN KEY ACT_FK_EXE_SUPER;
    
alter table ACT_RU_EXECUTION 
    drop FOREIGN KEY ACT_FK_EXE_PROCDEF;

alter table ACT_RU_IDENTITYLINK
    drop FOREIGN KEY ACT_FK_TSKASS_TASK;

alter table ACT_RU_IDENTITYLINK
    drop FOREIGN KEY ACT_FK_ATHRZ_PROCEDEF;
    
alter table ACT_RU_TASK
	drop FOREIGN KEY ACT_FK_TASK_EXE;

alter table ACT_RU_TASK
	drop FOREIGN KEY ACT_FK_TASK_PROCINST;
	
alter table ACT_RU_TASK
	drop FOREIGN KEY ACT_FK_TASK_PROCDEF;
    
alter table ACT_RU_VARIABLE
    drop FOREIGN KEY ACT_FK_VAR_EXE;
    
alter table ACT_RU_VARIABLE
	drop FOREIGN KEY ACT_FK_VAR_PROCINST;    

alter table ACT_RU_VARIABLE
    drop FOREIGN KEY ACT_FK_VAR_BYTEARRAY;

alter table ACT_RU_JOB
    drop FOREIGN KEY ACT_FK_JOB_EXECUTION;
    
alter table ACT_RU_JOB 
    drop foreign key ACT_FK_JOB_PROCESS_INSTANCE;
    
alter table ACT_RU_JOB 
    drop foreign key ACT_FK_JOB_PROC_DEF;

alter table ACT_RU_JOB 
    drop foreign key ACT_FK_JOB_EXCEPTION;
    
alter table ACT_RU_TIMER_JOB 
    drop foreign key ACT_FK_TIMER_JOB_EXECUTION;
    
alter table ACT_RU_TIMER_JOB 
    drop foreign key ACT_FK_TIMER_JOB_PROCESS_INSTANCE;
    
alter table ACT_RU_TIMER_JOB 
    drop foreign key ACT_FK_TIMER_JOB_PROC_DEF;
    
alter table ACT_RU_TIMER_JOB 
    drop foreign key ACT_FK_TIMER_JOB_EXCEPTION;
    
alter table ACT_RU_SUSPENDED_JOB 
    drop foreign key ACT_FK_SUSPENDED_JOB_EXECUTION;
    
alter table ACT_RU_SUSPENDED_JOB 
    drop foreign key ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE;
    
alter table ACT_RU_SUSPENDED_JOB 
    drop foreign key ACT_FK_SUSPENDED_JOB_PROC_DEF;
    
alter table ACT_RU_SUSPENDED_JOB 
    drop foreign key ACT_FK_SUSPENDED_JOB_EXCEPTION;
    
alter table ACT_RU_DEADLETTER_JOB 
    drop foreign key ACT_FK_DEADLETTER_JOB_EXECUTION;
    
alter table ACT_RU_DEADLETTER_JOB 
    drop foreign key ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE;
    
alter table ACT_RU_DEADLETTER_JOB 
    drop foreign key ACT_FK_DEADLETTER_JOB_PROC_DEF;
    
alter table ACT_RU_DEADLETTER_JOB 
    drop foreign key ACT_FK_DEADLETTER_JOB_EXCEPTION;
    
alter table ACT_RU_EVENT_SUBSCR
    drop FOREIGN KEY ACT_FK_EVENT_EXEC;

alter table ACT_RE_MODEL 
    drop FOREIGN KEY ACT_FK_MODEL_SOURCE;

alter table ACT_RE_MODEL 
    drop FOREIGN KEY ACT_FK_MODEL_SOURCE_EXTRA;
    
alter table ACT_RE_MODEL 
    drop FOREIGN KEY ACT_FK_MODEL_DEPLOYMENT;

alter table ACT_PROCDEF_INFO 
    drop FOREIGN KEY ACT_FK_INFO_JSON_BA;
    
alter table ACT_PROCDEF_INFO 
    drop FOREIGN KEY ACT_FK_INFO_PROCDEF;
    
drop index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK;
drop index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR;
    
drop table if exists ACT_GE_PROPERTY;
drop table if exists ACT_RU_VARIABLE;
drop table if exists ACT_GE_BYTEARRAY;
drop table if exists ACT_RE_DEPLOYMENT;
drop table if exists ACT_RE_MODEL;
drop table if exists ACT_RU_IDENTITYLINK;
drop table if exists ACT_RU_TASK;
drop table if exists ACT_RE_PROCDEF;
drop table if exists ACT_RU_EXECUTION;
drop table if exists ACT_RU_JOB;
drop table if exists ACT_RU_TIMER_JOB;
drop table if exists ACT_RU_SUSPENDED_JOB;
drop table if exists ACT_RU_DEADLETTER_JOB;
drop table if exists ACT_RU_EVENT_SUBSCR;
drop table if exists ACT_EVT_LOG;
drop table if exists ACT_PROCDEF_INFO;
-- drop history
drop index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST;
drop index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST;
drop index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST;
drop index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST;
drop index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL;
drop index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL;
drop index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL;
drop index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL;
drop index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL;
drop index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST;
drop index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST;
drop index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST;
drop index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK;
drop index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK;
drop index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK;
drop index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST;

drop table if exists ACT_HI_PROCINST;
drop table if exists ACT_HI_ACTINST;
drop table if exists ACT_HI_VARINST;
drop table if exists ACT_HI_TASKINST;
drop table if exists ACT_HI_DETAIL;
drop table if exists ACT_HI_COMMENT;
drop table if exists ACT_HI_ATTACHMENT;
drop table if exists ACT_HI_IDENTITYLINK;

-- drop identity
alter table ACT_ID_MEMBERSHIP 
    drop FOREIGN KEY ACT_FK_MEMB_GROUP;
    
alter table ACT_ID_MEMBERSHIP 
    drop FOREIGN KEY ACT_FK_MEMB_USER;

drop table if exists ACT_ID_INFO;
drop table if exists ACT_ID_MEMBERSHIP;
drop table if exists ACT_ID_GROUP;
drop table if exists ACT_ID_USER;







 
 
 
  
 