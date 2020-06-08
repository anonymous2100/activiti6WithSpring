-- MySQL数据库activiti6.0.0手动【建】表语句
-- 
-- 
-- 
-- 创建activiti6.0.0的所有表结构，【同时增加表和字段注释】
-- activiti6.0.0的建表语句所在位置（需要下载Activiti6.0的源码） 
-- D:\Activiti-activiti-6.0.0\modules\activiti-engine\src\main\resources\org\activiti\db\create
-- 
-- 建表结构的语句在下面三个文件中（版本号在5.6.4以及以上的mysql需要执行如下脚本）
-- activiti.mysql.create.engine.sql
-- activiti.mysql.create.identity.sql
-- activiti.mysql.create.history.sql

create table ACT_GE_PROPERTY (
    NAME_ varchar(64) ,
    VALUE_ varchar(300),
    REV_ integer,
    primary key (NAME_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_GE_PROPERTY modify column NAME_ varchar(64)  comment '属性名称 ';
alter table ACT_GE_PROPERTY modify column VALUE_ varchar(300)  comment '属性值 ';
alter table ACT_GE_PROPERTY modify column REV_ integer  comment '数据版本 ';
alter table ACT_GE_PROPERTY comment '流程引擎属性表';

insert into ACT_GE_PROPERTY values ('schema.version', '6.0.0.4', 1);
insert into ACT_GE_PROPERTY values ('schema.history', 'create(6.0.0.4)', 1);
insert into ACT_GE_PROPERTY values ('next.dbid', '1', 1);


create table ACT_GE_BYTEARRAY (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(255),
    DEPLOYMENT_ID_ varchar(64),
    BYTES_ LONGBLOB,
    GENERATED_ TINYINT,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_GE_BYTEARRAY modify column   ID_ varchar(64) comment '主键  ';
alter table ACT_GE_BYTEARRAY modify column   REV_ integer comment '数据版本  ';
alter table ACT_GE_BYTEARRAY modify column  NAME_ varchar(255) comment '资源名称 ';
alter table ACT_GE_BYTEARRAY modify column  DEPLOYMENT_ID_ varchar(64) comment '部署资源id，与ACT_RE_DEPLOYMENT的主键关联 ';
alter table ACT_GE_BYTEARRAY modify column  BYTES_ LONGBLOB comment '资源内容  ';
alter table ACT_GE_BYTEARRAY modify column  GENERATED_ TINYINT comment '由Activit自动产生的数据，0表示false，1表示true  ';
alter table ACT_GE_BYTEARRAY comment '流程引擎资源表 ';


create table ACT_RE_DEPLOYMENT (
    ID_ varchar(64),
    NAME_ varchar(255),
    CATEGORY_ varchar(255),
    KEY_ varchar(255),
    TENANT_ID_ varchar(255) default '',
    DEPLOY_TIME_ timestamp NULL,
    ENGINE_VERSION_ varchar(255),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_RE_DEPLOYMENT modify column  ID_ varchar(64)  comment '主键 ' ;
alter table ACT_RE_DEPLOYMENT modify column  NAME_ varchar(255)   comment '部署名称 ' ;
alter table ACT_RE_DEPLOYMENT modify column  CATEGORY_ varchar(255)   comment '部署数据分类 ' ;
alter table ACT_RE_DEPLOYMENT modify column  KEY_ varchar(255)  comment ' ' ;
alter table ACT_RE_DEPLOYMENT modify column  TENANT_ID_ varchar(255)  comment ' ' ;
alter table ACT_RE_DEPLOYMENT modify column  DEPLOY_TIME_ timestamp  comment '部署时间 ' ;
alter table ACT_RE_DEPLOYMENT modify column  ENGINE_VERSION_ varchar(255)  comment ' ' ;
alter table ACT_RE_DEPLOYMENT comment '流程部署信息表 ' ;

create table ACT_RE_MODEL (
    ID_ varchar(64) not null,
    REV_ integer,
    NAME_ varchar(255),
    KEY_ varchar(255),
    CATEGORY_ varchar(255),
    CREATE_TIME_ timestamp null,
    LAST_UPDATE_TIME_ timestamp null,
    VERSION_ integer,
    META_INFO_ varchar(4000),
    DEPLOYMENT_ID_ varchar(64),
    EDITOR_SOURCE_VALUE_ID_ varchar(64),
    EDITOR_SOURCE_EXTRA_VALUE_ID_ varchar(64),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

 
alter table ACT_RE_MODEL modify column    ID_ varchar(64)   comment '主键 ' ;
alter table ACT_RE_MODEL modify column    REV_ integer comment '数据版本 ' ;
alter table ACT_RE_MODEL modify column    NAME_ varchar(255) comment '名称 ' ;
alter table ACT_RE_MODEL modify column    KEY_ varchar(255) comment '流程模型的key ' ;
alter table ACT_RE_MODEL modify column    CATEGORY_ varchar(255) comment '分类 ' ;
alter table ACT_RE_MODEL modify column    CREATE_TIME_ timestamp  comment '创建时间 ' ;
alter table ACT_RE_MODEL modify column    LAST_UPDATE_TIME_ timestamp comment '最新修改时间' ;
alter table ACT_RE_MODEL modify column    VERSION_ integer comment '版本 ' ;
alter table ACT_RE_MODEL modify column    META_INFO_ varchar(4000) comment '以json格式保存流程定义的信息 ' ;
alter table ACT_RE_MODEL modify column    DEPLOYMENT_ID_ varchar(64) comment '流程模型部署id ' ;
alter table ACT_RE_MODEL modify column    EDITOR_SOURCE_VALUE_ID_ varchar(64)  comment ' ' ;
alter table ACT_RE_MODEL modify column    EDITOR_SOURCE_EXTRA_VALUE_ID_ varchar(64) comment ' ' ;
alter table ACT_RE_MODEL modify column    TENANT_ID_ varchar(255) comment ' ' ;

alter table ACT_RE_MODEL comment '流程模型信息表  ' ;


create table ACT_RU_EXECUTION (
    ID_ varchar(64),
    REV_ integer,
    PROC_INST_ID_ varchar(64),
    BUSINESS_KEY_ varchar(255),
    PARENT_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    SUPER_EXEC_ varchar(64),
    ROOT_PROC_INST_ID_ varchar(64),
    ACT_ID_ varchar(255),
    IS_ACTIVE_ TINYINT,
    IS_CONCURRENT_ TINYINT,
    IS_SCOPE_ TINYINT,
    IS_EVENT_SCOPE_ TINYINT,
    IS_MI_ROOT_ TINYINT,
    SUSPENSION_STATE_ integer,
    CACHED_ENT_STATE_ integer,
    TENANT_ID_ varchar(255) default '',
    NAME_ varchar(255),
    START_TIME_ datetime,
    START_USER_ID_ varchar(255),
    LOCK_TIME_ timestamp NULL,
    IS_COUNT_ENABLED_ TINYINT,
    EVT_SUBSCR_COUNT_ integer, 
    TASK_COUNT_ integer, 
    JOB_COUNT_ integer, 
    TIMER_JOB_COUNT_ integer,
    SUSP_JOB_COUNT_ integer,
    DEADLETTER_JOB_COUNT_ integer,
    VAR_COUNT_ integer, 
    ID_LINK_COUNT_ integer,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_RU_EXECUTION modify column  ID_ varchar(64) comment '主键id' ;
alter table ACT_RU_EXECUTION modify column  REV_ integer comment '数据版本' ;
alter table ACT_RU_EXECUTION modify column  PROC_INST_ID_ varchar(64) comment '流程实例id' ;
alter table ACT_RU_EXECUTION modify column  BUSINESS_KEY_ varchar(255) comment '业务主键id' ;
alter table ACT_RU_EXECUTION modify column  PARENT_ID_ varchar(64) comment '父节点实例id' ;
alter table ACT_RU_EXECUTION modify column  PROC_DEF_ID_ varchar(64) comment '流程定义id' ;
alter table ACT_RU_EXECUTION modify column  SUPER_EXEC_ varchar(64) comment '' ;
alter table ACT_RU_EXECUTION modify column  ROOT_PROC_INST_ID_ varchar(64) comment '' ;
alter table ACT_RU_EXECUTION modify column  ACT_ID_ varchar(255) comment '节点实例ID，即ACT_HI_ACTINST中ID' ;
alter table ACT_RU_EXECUTION modify column  IS_ACTIVE_ TINYINT comment '是否激活' ;
alter table ACT_RU_EXECUTION modify column  IS_CONCURRENT_ TINYINT comment '是否为并行（true或false）' ;
alter table ACT_RU_EXECUTION modify column  IS_SCOPE_ TINYINT comment '' ;
alter table ACT_RU_EXECUTION modify column  IS_EVENT_SCOPE_ TINYINT comment '' ;
alter table ACT_RU_EXECUTION modify column  IS_MI_ROOT_ TINYINT comment '' ;
alter table ACT_RU_EXECUTION modify column  SUSPENSION_STATE_ integer comment '是否挂起，1激活，2挂起' ;
alter table ACT_RU_EXECUTION modify column  CACHED_ENT_STATE_ integer comment '' ;
alter table ACT_RU_EXECUTION modify column  TENANT_ID_ varchar(255) default '' comment '' ;
alter table ACT_RU_EXECUTION modify column  NAME_ varchar(255) comment '名称' ;
alter table ACT_RU_EXECUTION modify column  START_TIME_ datetime comment '开始时间' ;
alter table ACT_RU_EXECUTION modify column  START_USER_ID_ varchar(255) comment '' ;
alter table ACT_RU_EXECUTION modify column  LOCK_TIME_ timestamp  comment '' ;
alter table ACT_RU_EXECUTION modify column  IS_COUNT_ENABLED_ TINYINT comment '' ;
alter table ACT_RU_EXECUTION modify column  EVT_SUBSCR_COUNT_ integer comment '' ; 
alter table ACT_RU_EXECUTION modify column  TASK_COUNT_ integer comment '' ; 
alter table ACT_RU_EXECUTION modify column  JOB_COUNT_ integer comment '' ; 
alter table ACT_RU_EXECUTION modify column  TIMER_JOB_COUNT_ integer comment '' ;
alter table ACT_RU_EXECUTION modify column  SUSP_JOB_COUNT_ integer comment '' ;
alter table ACT_RU_EXECUTION modify column  DEADLETTER_JOB_COUNT_ integer comment '' ;
alter table ACT_RU_EXECUTION modify column  VAR_COUNT_ integer comment '' ; 
alter table ACT_RU_EXECUTION modify column  ID_LINK_COUNT_ integer comment '' ;

alter table ACT_RU_EXECUTION comment '运行时流程执行实例' ;


create table ACT_RU_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(255) NOT NULL,
    LOCK_EXP_TIME_ timestamp NULL,
    LOCK_OWNER_ varchar(255),
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp NULL,
    REPEAT_ varchar(255),
    HANDLER_TYPE_ varchar(255),
    HANDLER_CFG_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_RU_JOB modify column  ID_ varchar(64)   comment '主键id ' ;
alter table ACT_RU_JOB modify column  REV_ integer comment '数据版本 ' ;
alter table ACT_RU_JOB modify column  TYPE_ varchar(255)   comment '类型' ;
alter table ACT_RU_JOB modify column  LOCK_EXP_TIME_ timestamp  comment '锁定释放时间 ' ;
alter table ACT_RU_JOB modify column  LOCK_OWNER_ varchar(255) comment '挂起者 ' ;
alter table ACT_RU_JOB modify column  EXCLUSIVE_ boolean comment ' ' ;
alter table ACT_RU_JOB modify column  EXECUTION_ID_ varchar(64) comment '执行实例id ' ;
alter table ACT_RU_JOB modify column  PROCESS_INSTANCE_ID_ varchar(64) comment '流程实例id ' ;
alter table ACT_RU_JOB modify column  PROC_DEF_ID_ varchar(64) comment '流程定义id ' ;
alter table ACT_RU_JOB modify column  RETRIES_ integer comment ' ' ;
alter table ACT_RU_JOB modify column  EXCEPTION_STACK_ID_ varchar(64) comment '异常信息id ' ;
alter table ACT_RU_JOB modify column  EXCEPTION_MSG_ varchar(4000) comment '异常信息 ' ;
alter table ACT_RU_JOB modify column  DUEDATE_ timestamp NULL comment '到期时间 ' ;
alter table ACT_RU_JOB modify column  REPEAT_ varchar(255) comment '重复 ' ;
alter table ACT_RU_JOB modify column  HANDLER_TYPE_ varchar(255) comment '处理类型 ' ;
alter table ACT_RU_JOB modify column  HANDLER_CFG_ varchar(4000) comment '处理标识 ' ;
alter table ACT_RU_JOB modify column  TENANT_ID_ varchar(255) default '' comment ' ' ;
   
alter table ACT_RU_JOB comment '运行时作业(异步) ' ;



create table ACT_RU_TIMER_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(255) NOT NULL,
    LOCK_EXP_TIME_ timestamp NULL,
    LOCK_OWNER_ varchar(255),
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp NULL,
    REPEAT_ varchar(255),
    HANDLER_TYPE_ varchar(255),
    HANDLER_CFG_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

 alter table ACT_RU_TIMER_JOB modify column ID_ varchar(64)  comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column REV_ integer comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column TYPE_ varchar(255)  comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column LOCK_EXP_TIME_ timestamp  comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column LOCK_OWNER_ varchar(255) comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column EXCLUSIVE_ boolean comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column EXECUTION_ID_ varchar(64) comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column PROCESS_INSTANCE_ID_ varchar(64) comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column PROC_DEF_ID_ varchar(64) comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column RETRIES_ integer comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column EXCEPTION_STACK_ID_ varchar(64) comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column EXCEPTION_MSG_ varchar(4000) comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column DUEDATE_ timestamp  comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column REPEAT_ varchar(255) comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column HANDLER_TYPE_ varchar(255) comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column HANDLER_CFG_ varchar(4000) comment ' ' ;
 alter table ACT_RU_TIMER_JOB modify column TENANT_ID_ varchar(255) default '' comment ' ' ;
  
alter table ACT_RU_TIMER_JOB comment '任务定时器表(异步) ';


create table ACT_RU_SUSPENDED_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(255) NOT NULL,
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    RETRIES_ integer,
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp NULL,
    REPEAT_ varchar(255),
    HANDLER_TYPE_ varchar(255),
    HANDLER_CFG_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table  ACT_RU_SUSPENDED_JOB modify column ID_ varchar(64)  comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column REV_ integer comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column TYPE_ varchar(255)  comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column EXCLUSIVE_ boolean comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column EXECUTION_ID_ varchar(64) comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column PROCESS_INSTANCE_ID_ varchar(64) comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column PROC_DEF_ID_ varchar(64) comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column RETRIES_ integer comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column EXCEPTION_STACK_ID_ varchar(64) comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column EXCEPTION_MSG_ varchar(4000) comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column DUEDATE_ timestamp  comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column REPEAT_ varchar(255) comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column HANDLER_TYPE_ varchar(255) comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column HANDLER_CFG_ varchar(4000) comment ' ' ;
alter table  ACT_RU_SUSPENDED_JOB modify column TENANT_ID_ varchar(255) comment ' ' ;

alter table  ACT_RU_SUSPENDED_JOB comment  '暂停运行的任务(异步) ' ; 


create table ACT_RU_DEADLETTER_JOB (
    ID_ varchar(64) NOT NULL,
    REV_ integer,
    TYPE_ varchar(255) NOT NULL,
    EXCLUSIVE_ boolean,
    EXECUTION_ID_ varchar(64),
    PROCESS_INSTANCE_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    EXCEPTION_STACK_ID_ varchar(64),
    EXCEPTION_MSG_ varchar(4000),
    DUEDATE_ timestamp NULL,
    REPEAT_ varchar(255),
    HANDLER_TYPE_ varchar(255),
    HANDLER_CFG_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_RU_DEADLETTER_JOB modify column  ID_ varchar(64)  comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  REV_ integer comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  TYPE_ varchar(255)  comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  EXCLUSIVE_ boolean comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  EXECUTION_ID_ varchar(64) comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  PROCESS_INSTANCE_ID_ varchar(64) comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  PROC_DEF_ID_ varchar(64) comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  EXCEPTION_STACK_ID_ varchar(64) comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  EXCEPTION_MSG_ varchar(4000) comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  DUEDATE_ timestamp  comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  REPEAT_ varchar(255) comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  HANDLER_TYPE_ varchar(255) comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  HANDLER_CFG_ varchar(4000) comment ' ' ;
alter table ACT_RU_DEADLETTER_JOB modify column  TENANT_ID_ varchar(255) comment ' ' ;
  
alter table ACT_RU_DEADLETTER_JOB comment '执行失败的任务表(异步)  ' ;


create table ACT_RE_PROCDEF (
    ID_ varchar(64) not null,
    REV_ integer,
    CATEGORY_ varchar(255),
    NAME_ varchar(255),
    KEY_ varchar(255) not null,
    VERSION_ integer not null,
    DEPLOYMENT_ID_ varchar(64),
    RESOURCE_NAME_ varchar(4000),
    DGRM_RESOURCE_NAME_ varchar(4000),
    DESCRIPTION_ varchar(4000),
    HAS_START_FORM_KEY_ TINYINT,
    HAS_GRAPHICAL_NOTATION_ TINYINT,
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(255) default '',
    ENGINE_VERSION_ varchar(255),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

 alter table ACT_RE_PROCDEF modify column  ID_ varchar(64)  comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  REV_ integer comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  CATEGORY_ varchar(255) comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  NAME_ varchar(255) comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  KEY_ varchar(255)  comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  VERSION_ integer  comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  DEPLOYMENT_ID_ varchar(64) comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  RESOURCE_NAME_ varchar(4000) comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  DGRM_RESOURCE_NAME_ varchar(4000) comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  DESCRIPTION_ varchar(4000) comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  HAS_START_FORM_KEY_ TINYINT comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  HAS_GRAPHICAL_NOTATION_ TINYINT comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  SUSPENSION_STATE_ integer comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  TENANT_ID_ varchar(255) comment ' ' ;
 alter table ACT_RE_PROCDEF modify column  ENGINE_VERSION_ varchar(255) comment ' ' ;

alter table ACT_RE_PROCDEF  comment '流程定义信息 ' ;


create table ACT_RU_TASK (
    ID_ varchar(64),
    REV_ integer,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    NAME_ varchar(255),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    TASK_DEF_KEY_ varchar(255),
    OWNER_ varchar(255),
    ASSIGNEE_ varchar(255),
    DELEGATION_ varchar(64),
    PRIORITY_ integer,
    CREATE_TIME_ timestamp NULL,
    DUE_DATE_ datetime,
    CATEGORY_ varchar(255),
    SUSPENSION_STATE_ integer,
    TENANT_ID_ varchar(255) default '',
    FORM_KEY_ varchar(255),
    CLAIM_TIME_ datetime,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;
    
alter table ACT_RU_TASK modify column  ID_ varchar(64) comment '主键id ' ;
alter table ACT_RU_TASK modify column  REV_ integer comment '数据版本' ;
alter table ACT_RU_TASK modify column  EXECUTION_ID_ varchar(64) comment '执行实例id ' ;
alter table ACT_RU_TASK modify column  PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
alter table ACT_RU_TASK modify column  PROC_DEF_ID_ varchar(64) comment '流程定义id ' ;
alter table ACT_RU_TASK modify column  NAME_ varchar(255) comment '节点定义名称 ' ;
alter table ACT_RU_TASK modify column  PARENT_TASK_ID_ varchar(64) comment '父节点实例id ' ;
alter table ACT_RU_TASK modify column  DESCRIPTION_ varchar(4000) comment '节点定义描述 ' ;
alter table ACT_RU_TASK modify column  TASK_DEF_KEY_ varchar(255) comment '任务定义id ' ;
alter table ACT_RU_TASK modify column  OWNER_ varchar(255) comment '实际签收人，拥有者（一般情况下为空，只有在委托时才有值） ' ;
alter table ACT_RU_TASK modify column  ASSIGNEE_ varchar(255) comment '签收人或委托人 ' ;
alter table ACT_RU_TASK modify column  DELEGATION_ varchar(64) comment '委托类型 ' ;
alter table ACT_RU_TASK modify column  PRIORITY_ integer comment '优先级别 ' ;
alter table ACT_RU_TASK modify column  CREATE_TIME_ timestamp  comment '创建时间 ' ;
alter table ACT_RU_TASK modify column  DUE_DATE_ datetime comment '过期时间 ' ;
alter table ACT_RU_TASK modify column  CATEGORY_ varchar(255) comment '节点分类 ' ;
alter table ACT_RU_TASK modify column  SUSPENSION_STATE_ integer comment '是否挂起，1-激活，2-挂起 ' ;
alter table ACT_RU_TASK modify column  TENANT_ID_ varchar(255) default '' comment ' ' ;
alter table ACT_RU_TASK modify column  FORM_KEY_ varchar(255) comment ' ' ;
alter table ACT_RU_TASK modify column  CLAIM_TIME_ datetime comment ' ' ;
  
alter table ACT_RU_TASK comment '运行时任务节点表 ' ;


create table ACT_RU_IDENTITYLINK (
    ID_ varchar(64),
    REV_ integer,
    GROUP_ID_ varchar(255),
    TYPE_ varchar(255),
    USER_ID_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    PROC_DEF_ID_ varchar(64),    
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

 alter table ACT_RU_IDENTITYLINK modify column ID_ varchar(64) comment '主键id ' ;
 alter table ACT_RU_IDENTITYLINK modify column REV_ integer comment '数据版本 ' ;
 alter table ACT_RU_IDENTITYLINK modify column GROUP_ID_ varchar(255) comment '组id ' ;
 alter table ACT_RU_IDENTITYLINK modify column TYPE_ varchar(255) comment '类型 ' ;
 alter table ACT_RU_IDENTITYLINK modify column USER_ID_ varchar(255) comment '用户id ' ;
 alter table ACT_RU_IDENTITYLINK modify column TASK_ID_ varchar(64) comment '节点实例id ' ;
 alter table ACT_RU_IDENTITYLINK modify column PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
 alter table ACT_RU_IDENTITYLINK modify column PROC_DEF_ID_ varchar(64) comment '流程定义id ' ;    
  
alter table ACT_RU_IDENTITYLINK comment '运行时流程人员表，主要存储任务节点与参与者的相关信息 ' ;



create table ACT_RU_VARIABLE (
    ID_ varchar(64) not null,
    REV_ integer,
    TYPE_ varchar(255) not null,
    NAME_ varchar(255) not null,
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    TASK_ID_ varchar(64),
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_RU_VARIABLE modify column ID_ varchar(64)  comment '主键id ' ;
alter table ACT_RU_VARIABLE modify column REV_ integer comment '数据版本 ' ;
alter table ACT_RU_VARIABLE modify column TYPE_ varchar(255)  comment '类型 ' ;
alter table ACT_RU_VARIABLE modify column NAME_ varchar(255)  comment '名称 ' ;
alter table ACT_RU_VARIABLE modify column EXECUTION_ID_ varchar(64) comment '执行实例id ' ;
alter table ACT_RU_VARIABLE modify column PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
alter table ACT_RU_VARIABLE modify column TASK_ID_ varchar(64) comment '节点实例id ' ;
alter table ACT_RU_VARIABLE modify column BYTEARRAY_ID_ varchar(64) comment '字节表的ID，（ACT_GE_BYTEARRAY） ' ;
alter table ACT_RU_VARIABLE modify column DOUBLE_ double comment '存储变量类型为Double ' ;
alter table ACT_RU_VARIABLE modify column LONG_ bigint comment '存储变量类型为long ' ;
alter table ACT_RU_VARIABLE modify column TEXT_ varchar(4000) comment '存储变量值类型为String，如此处存储持久化对象时，指jpa对象的class ' ;
alter table ACT_RU_VARIABLE modify column TEXT2_ varchar(4000) comment '此处存储的是JPA持久化对象时，才会有值。此值为对象ID ' ;

alter table ACT_RU_VARIABLE comment '运行时流程变量数据表 ' ;



create table ACT_RU_EVENT_SUBSCR (
    ID_ varchar(64) not null,
    REV_ integer,
    EVENT_TYPE_ varchar(255) not null,
    EVENT_NAME_ varchar(255),
    EXECUTION_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTIVITY_ID_ varchar(64),
    CONFIGURATION_ varchar(255),
    CREATED_ timestamp not null DEFAULT CURRENT_TIMESTAMP,
    PROC_DEF_ID_ varchar(64),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_RU_EVENT_SUBSCR modify column ID_ varchar(64) comment '主键 ' ;
alter table ACT_RU_EVENT_SUBSCR modify column REV_ integer comment '数据版本 ' ;
alter table ACT_RU_EVENT_SUBSCR modify column EVENT_TYPE_ varchar(255) comment '事件类型 ' ;
alter table ACT_RU_EVENT_SUBSCR modify column EVENT_NAME_ varchar(255) comment '事件名称 ' ;
alter table ACT_RU_EVENT_SUBSCR modify column EXECUTION_ID_ varchar(64) comment '事件所在的执行流程id ' ;
alter table ACT_RU_EVENT_SUBSCR modify column PROC_INST_ID_ varchar(64) comment '事件所在的流程实例id ' ;
alter table ACT_RU_EVENT_SUBSCR modify column ACTIVITY_ID_ varchar(64) comment '具体事件活动实例id ' ;
alter table ACT_RU_EVENT_SUBSCR modify column CONFIGURATION_ varchar(255) comment '事件的属性配置 ' ;
alter table ACT_RU_EVENT_SUBSCR modify column CREATED_ timestamp  comment '事件的创建时间 ' ;
alter table ACT_RU_EVENT_SUBSCR modify column PROC_DEF_ID_ varchar(64) comment '流程定义id ' ;
alter table ACT_RU_EVENT_SUBSCR modify column TENANT_ID_ varchar(255) comment ' ' ;

alter table ACT_RU_EVENT_SUBSCR comment '运行时事件描述表  ' ;



create table ACT_EVT_LOG (
    LOG_NR_ bigint auto_increment,
    TYPE_ varchar(64),
    PROC_DEF_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    TIME_STAMP_ timestamp not null,
    USER_ID_ varchar(255),
    DATA_ LONGBLOB,
    LOCK_OWNER_ varchar(255),
    LOCK_TIME_ timestamp null,
    IS_PROCESSED_ tinyint default 0,
    primary key (LOG_NR_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_EVT_LOG modify column LOG_NR_ bigint   comment ' ' ;
alter table ACT_EVT_LOG modify column TYPE_ varchar(64) comment ' ' ;
alter table ACT_EVT_LOG modify column PROC_DEF_ID_ varchar(64) comment ' ' ;
alter table ACT_EVT_LOG modify column PROC_INST_ID_ varchar(64) comment ' ' ;
alter table ACT_EVT_LOG modify column EXECUTION_ID_ varchar(64) comment ' ' ;
alter table ACT_EVT_LOG modify column TASK_ID_ varchar(64) comment ' ' ;
alter table ACT_EVT_LOG modify column TIME_STAMP_ timestamp  comment ' ' ;
alter table ACT_EVT_LOG modify column USER_ID_ varchar(255) comment ' ' ;
alter table ACT_EVT_LOG modify column DATA_ LONGBLOB comment ' ' ;
alter table ACT_EVT_LOG modify column LOCK_OWNER_ varchar(255) comment ' ' ;
alter table ACT_EVT_LOG modify column LOCK_TIME_ timestamp  comment ' ' ;
alter table ACT_EVT_LOG modify column IS_PROCESSED_ tinyint  comment ' ' ;

alter table ACT_EVT_LOG comment '事件日志表(实验性质)  ' ;



create table ACT_PROCDEF_INFO (
	ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64) not null,
    REV_ integer,
    INFO_JSON_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_PROCDEF_INFO modify column ID_ varchar(64)   comment '主键id ' ;
alter table ACT_PROCDEF_INFO modify column PROC_DEF_ID_ varchar(64)   comment '流程定义id ' ;
alter table ACT_PROCDEF_INFO modify column REV_ integer comment '数据版本 ' ;
alter table ACT_PROCDEF_INFO modify column INFO_JSON_ID_ varchar(64) comment ' ' ;

alter table ACT_PROCDEF_INFO comment '流程定义的动态变更信息表  ' ;



create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION(BUSINESS_KEY_);
create index ACT_IDX_EXEC_ROOT on ACT_RU_EXECUTION(ROOT_PROC_INST_ID_);
create index ACT_IDX_TASK_CREATE on ACT_RU_TASK(CREATE_TIME_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK(USER_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK(GROUP_ID_);
create index ACT_IDX_EVENT_SUBSCR_CONFIG_ on ACT_RU_EVENT_SUBSCR(CONFIGURATION_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE(TASK_ID_);
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK(PROC_DEF_ID_);
create index ACT_IDX_INFO_PROCDEF on ACT_PROCDEF_INFO(PROC_DEF_ID_);

alter table ACT_GE_BYTEARRAY
    add constraint ACT_FK_BYTEARR_DEPL 
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);

alter table ACT_RE_PROCDEF
    add constraint ACT_UNIQ_PROCDEF
    unique (KEY_,VERSION_, TENANT_ID_);
    
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCINST 
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_) on delete cascade on update cascade;

alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PARENT 
    foreign key (PARENT_ID_) 
    references ACT_RU_EXECUTION (ID_) on delete cascade;
    
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_SUPER 
    foreign key (SUPER_EXEC_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_TSKASS_TASK 
    foreign key (TASK_ID_) 
    references ACT_RU_TASK (ID_);
    
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_ATHRZ_PROCEDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF(ID_);
    
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_IDL_PROCINST
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);       
    
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_TASK
  	add constraint ACT_FK_TASK_PROCDEF
  	foreign key (PROC_DEF_ID_)
  	references ACT_RE_PROCDEF (ID_);
  
alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_EXE 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION(ID_);

alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_BYTEARRAY 
    foreign key (BYTEARRAY_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);

alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_EXCEPTION 
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_EXCEPTION 
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_EXCEPTION 
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_EXCEPTION 
    foreign key (EXCEPTION_STACK_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_EVENT_SUBSCR
    add constraint ACT_FK_EVENT_EXEC
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION(ID_);
    
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE 
    foreign key (EDITOR_SOURCE_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE_EXTRA 
    foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_DEPLOYMENT 
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);        

alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_JSON_BA 
    foreign key (INFO_JSON_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_PROCDEF_INFO
    add constraint ACT_UNIQ_INFO_PROCDEF
    unique (PROC_DEF_ID_);

-- create history
create table ACT_HI_PROCINST (
    ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64) not null,
    BUSINESS_KEY_ varchar(255),
    PROC_DEF_ID_ varchar(64) not null,
    START_TIME_ datetime(3) not null,
    END_TIME_ datetime(3),
    DURATION_ bigint,
    START_USER_ID_ varchar(255),
    START_ACT_ID_ varchar(255),
    END_ACT_ID_ varchar(255),
    SUPER_PROCESS_INSTANCE_ID_ varchar(64),
    DELETE_REASON_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    NAME_ varchar(255),
    primary key (ID_),
    unique (PROC_INST_ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_HI_PROCINST modify column ID_ varchar(64)  comment '主键id ' ;
alter table ACT_HI_PROCINST modify column PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
alter table ACT_HI_PROCINST modify column BUSINESS_KEY_ varchar(255) comment '业务主键，业务表单的id ' ;
alter table ACT_HI_PROCINST modify column PROC_DEF_ID_ varchar(64)  comment '流程定义id ' ;
alter table ACT_HI_PROCINST modify column START_TIME_ datetime(3)  comment '开始时间 ' ;
alter table ACT_HI_PROCINST modify column END_TIME_ datetime(3) comment '结束时间 ' ;
alter table ACT_HI_PROCINST modify column DURATION_ bigint comment '耗时 ' ;
alter table ACT_HI_PROCINST modify column START_USER_ID_ varchar(255) comment '起草人 ' ;
alter table ACT_HI_PROCINST modify column START_ACT_ID_ varchar(255) comment '开始节点的ID ' ;
alter table ACT_HI_PROCINST modify column END_ACT_ID_ varchar(255) comment '结束节点的ID ' ;
alter table ACT_HI_PROCINST modify column SUPER_PROCESS_INSTANCE_ID_ varchar(64) comment '父流程实例ID ' ;
alter table ACT_HI_PROCINST modify column DELETE_REASON_ varchar(4000) comment '该流程实例删除的原因 ' ;
alter table ACT_HI_PROCINST modify column TENANT_ID_ varchar(255) default '' comment ' ' ;
alter table ACT_HI_PROCINST modify column NAME_ varchar(255) comment ' ' ;
  
alter table ACT_HI_PROCINST   comment '历史流程实例表 ' ;

create table ACT_HI_ACTINST (
    ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64) not null,
    EXECUTION_ID_ varchar(64) not null,
    ACT_ID_ varchar(255) not null,
    TASK_ID_ varchar(64),
    CALL_PROC_INST_ID_ varchar(64),
    ACT_NAME_ varchar(255),
    ACT_TYPE_ varchar(255) not null,
    ASSIGNEE_ varchar(255),
    START_TIME_ datetime(3) not null,
    END_TIME_ datetime(3),
    DURATION_ bigint,
    DELETE_REASON_ varchar(4000),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

 alter table ACT_HI_ACTINST modify column ID_ varchar(64) comment '主键id ' ;
 alter table ACT_HI_ACTINST modify column PROC_DEF_ID_ varchar(64) comment '流程定义id ' ;
 alter table ACT_HI_ACTINST modify column PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
 alter table ACT_HI_ACTINST modify column EXECUTION_ID_ varchar(64) comment '执行实例id ' ;
 alter table ACT_HI_ACTINST modify column ACT_ID_ varchar(255) comment '节点定义id ' ;
 alter table ACT_HI_ACTINST modify column TASK_ID_ varchar(64) comment '任务实例ID 其他节点类型实例ID在这里为空 ' ;
 alter table ACT_HI_ACTINST modify column CALL_PROC_INST_ID_ varchar(64) comment '调用外部流程的流程实例ID ' ;
 alter table ACT_HI_ACTINST modify column ACT_NAME_ varchar(255) comment '节点定义名称 ' ;
 alter table ACT_HI_ACTINST modify column ACT_TYPE_ varchar(255) comment '节点类型 ' ;
 alter table ACT_HI_ACTINST modify column ASSIGNEE_ varchar(255) comment '签收人 ' ;
 alter table ACT_HI_ACTINST modify column START_TIME_ datetime(3) comment '开始时间 ' ;
 alter table ACT_HI_ACTINST modify column END_TIME_ datetime(3) comment '结束时间' ;
 alter table ACT_HI_ACTINST modify column DURATION_ bigint comment '耗时，毫秒值 ' ;
 alter table ACT_HI_ACTINST modify column DELETE_REASON_ varchar(4000) comment '删除节点原因 ' ;
 alter table ACT_HI_ACTINST modify column TENANT_ID_ varchar(255) comment ' ' ;
  
alter table ACT_HI_ACTINST   comment '历史节点表 ' ;



create table ACT_HI_TASKINST (
    ID_ varchar(64) not null,
    PROC_DEF_ID_ varchar(64),
    TASK_DEF_KEY_ varchar(255),
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    NAME_ varchar(255),
    PARENT_TASK_ID_ varchar(64),
    DESCRIPTION_ varchar(4000),
    OWNER_ varchar(255),
    ASSIGNEE_ varchar(255),
    START_TIME_ datetime(3) not null,
    CLAIM_TIME_ datetime(3),
    END_TIME_ datetime(3),
    DURATION_ bigint,
    DELETE_REASON_ varchar(4000),
    PRIORITY_ integer,
    DUE_DATE_ datetime(3),
    FORM_KEY_ varchar(255),
    CATEGORY_ varchar(255),
    TENANT_ID_ varchar(255) default '',
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

  alter table ACT_HI_TASKINST modify column ID_ varchar(64) comment '主键id ' ;
  alter table ACT_HI_TASKINST modify column PROC_DEF_ID_ varchar(64) comment '流程定义id ' ;
  alter table ACT_HI_TASKINST modify column TASK_DEF_KEY_ varchar(255) comment '节点定义id ' ;
  alter table ACT_HI_TASKINST modify column PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
  alter table ACT_HI_TASKINST modify column EXECUTION_ID_ varchar(64) comment '执行实例id ' ;
  alter table ACT_HI_TASKINST modify column NAME_ varchar(255) comment '名称 ' ;
  alter table ACT_HI_TASKINST modify column PARENT_TASK_ID_ varchar(64) comment '父节点实例id ' ;
  alter table ACT_HI_TASKINST modify column DESCRIPTION_ varchar(4000) comment '描述 ' ;
  alter table ACT_HI_TASKINST modify column OWNER_ varchar(255) comment '实际签收人；任务的拥有者 ' ;
  alter table ACT_HI_TASKINST modify column ASSIGNEE_ varchar(255) comment '签收人或被委托人 ' ;
  alter table ACT_HI_TASKINST modify column START_TIME_ datetime(3) comment '开始时间 ' ;
  alter table ACT_HI_TASKINST modify column CLAIM_TIME_ datetime(3) comment '提醒时间 ' ;
  alter table ACT_HI_TASKINST modify column END_TIME_ datetime(3) comment '结束时间 ' ;
  alter table ACT_HI_TASKINST modify column DURATION_ bigint comment '耗时，毫秒值 ' ;
  alter table ACT_HI_TASKINST modify column DELETE_REASON_ varchar(4000) comment '删除原因(completed,deleted) ' ;
  alter table ACT_HI_TASKINST modify column PRIORITY_ integer comment '优先级别 ' ;
  alter table ACT_HI_TASKINST modify column DUE_DATE_ datetime(3) comment '过期时间 ' ;
  alter table ACT_HI_TASKINST modify column FORM_KEY_ varchar(255) comment ' 节点定义的表单key值；desinger节点定义的form_key属性' ;
  alter table ACT_HI_TASKINST modify column CATEGORY_ varchar(255) comment '分类 ' ;
  alter table ACT_HI_TASKINST modify column TENANT_ID_ varchar(255) comment ' ' ;

 alter table ACT_HI_TASKINST   comment '历史任务实例表 ' ;




create table ACT_HI_VARINST (
    ID_ varchar(64) not null,
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    NAME_ varchar(255) not null,
    VAR_TYPE_ varchar(100),
    REV_ integer,
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    CREATE_TIME_ datetime(3),
    LAST_UPDATED_TIME_ datetime(3),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

  alter table ACT_HI_VARINST modify column ID_ varchar(64)  comment '主键id ' ;
  alter table ACT_HI_VARINST modify column PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
  alter table ACT_HI_VARINST modify column EXECUTION_ID_ varchar(64) comment '执行实例id ' ;
  alter table ACT_HI_VARINST modify column TASK_ID_ varchar(64) comment '任务实例id ' ;
  alter table ACT_HI_VARINST modify column NAME_ varchar(255)  comment '名称 ' ;
  alter table ACT_HI_VARINST modify column VAR_TYPE_ varchar(100) comment '参数类型 ' ;
  alter table ACT_HI_VARINST modify column REV_ integer comment '数据版本 ' ;
  alter table ACT_HI_VARINST modify column BYTEARRAY_ID_ varchar(64) comment '字节表ID，ACT_GE_BYTEARRAY表的主键 ' ;
  alter table ACT_HI_VARINST modify column DOUBLE_ double comment '存储DoubleType类型的数据 ' ;
  alter table ACT_HI_VARINST modify column LONG_ bigint comment '存储LongType类型的数据' ;
  alter table ACT_HI_VARINST modify column TEXT_ varchar(4000) comment ' ' ;
  alter table ACT_HI_VARINST modify column TEXT2_ varchar(4000) comment '此处存储的是JPA持久化对象时，才会有值。此值为对象ID ' ;
  alter table ACT_HI_VARINST modify column CREATE_TIME_ datetime(3) comment '创建时间 ' ;
  alter table ACT_HI_VARINST modify column LAST_UPDATED_TIME_ datetime(3) comment '上次更新时间 ' ;

 alter table ACT_HI_VARINST   comment '历史的流程运行中的变量信息  ' ;


create table ACT_HI_DETAIL (
    ID_ varchar(64) not null,
    TYPE_ varchar(255) not null,
    PROC_INST_ID_ varchar(64),
    EXECUTION_ID_ varchar(64),
    TASK_ID_ varchar(64),
    ACT_INST_ID_ varchar(64),
    NAME_ varchar(255) not null,
    VAR_TYPE_ varchar(255),
    REV_ integer,
    TIME_ datetime(3) not null,
    BYTEARRAY_ID_ varchar(64),
    DOUBLE_ double,
    LONG_ bigint,
    TEXT_ varchar(4000),
    TEXT2_ varchar(4000),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_HI_DETAIL modify column  ID_ varchar(64) comment '主键id' ;
alter table ACT_HI_DETAIL modify column  TYPE_ varchar(255)  comment '类型 ' ;
alter table ACT_HI_DETAIL modify column  PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
alter table ACT_HI_DETAIL modify column  EXECUTION_ID_ varchar(64) comment '执行实例id ' ;
alter table ACT_HI_DETAIL modify column  TASK_ID_ varchar(64) comment '任务实例id ' ;
alter table ACT_HI_DETAIL modify column  ACT_INST_ID_ varchar(64) comment '节点实例id ' ;
alter table ACT_HI_DETAIL modify column  NAME_ varchar(255) comment '名称 ' ;
alter table ACT_HI_DETAIL modify column  VAR_TYPE_ varchar(255) comment '参数类型 ' ;
alter table ACT_HI_DETAIL modify column  REV_ integer comment '数据版本 ' ;
alter table ACT_HI_DETAIL modify column  TIME_ datetime(3) comment '创建时间，时间戳 ' ;
alter table ACT_HI_DETAIL modify column  BYTEARRAY_ID_ varchar(64) comment '字节表ID，ACT_GE_BYTEARRAY表的ID ' ;
alter table ACT_HI_DETAIL modify column  DOUBLE_ double comment '存储变量类型为Double ' ;
alter table ACT_HI_DETAIL modify column  LONG_ bigint comment '存储变量类型为long ' ;
alter table ACT_HI_DETAIL modify column  TEXT_ varchar(4000) comment '存储变量值类型为String ' ;
alter table ACT_HI_DETAIL modify column  TEXT2_ varchar(4000) comment '此处存储的是JPA持久化对象时，才会有值。此值为对象ID ' ;
	
alter table ACT_HI_DETAIL   comment '历史详情表，提供历史变量的查询  ' ;


create table ACT_HI_COMMENT (
    ID_ varchar(64) not null,
    TYPE_ varchar(255),
    TIME_ datetime(3) not null,
    USER_ID_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    ACTION_ varchar(255),
    MESSAGE_ varchar(4000),
    FULL_MSG_ LONGBLOB,
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_HI_COMMENT modify column ID_ varchar(64)  comment '主键id ' ;
alter table ACT_HI_COMMENT modify column TYPE_ varchar(255) comment '类型 ' ;
alter table ACT_HI_COMMENT modify column TIME_ datetime(3) comment '填写时间 ' ;
alter table ACT_HI_COMMENT modify column USER_ID_ varchar(255) comment '用户id，即填写人 ' ;
alter table ACT_HI_COMMENT modify column TASK_ID_ varchar(64) comment '节点任务（实例）id ' ;
alter table ACT_HI_COMMENT modify column PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
alter table ACT_HI_COMMENT modify column ACTION_ varchar(255) comment '行为类型 ' ;
alter table ACT_HI_COMMENT modify column MESSAGE_ varchar(4000) comment '基本内容，用于存放流程产生的信息，比如审批意见 ' ;
alter table ACT_HI_COMMENT modify column FULL_MSG_ LONGBLOB comment '全部内容，附件地址 ' ;

 alter table ACT_HI_COMMENT   comment '历史的批注信息 ' ;



create table ACT_HI_ATTACHMENT (
    ID_ varchar(64) not null,
    REV_ integer,
    USER_ID_ varchar(255),
    NAME_ varchar(255),
    DESCRIPTION_ varchar(4000),
    TYPE_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    URL_ varchar(4000),
    CONTENT_ID_ varchar(64),
    TIME_ datetime(3),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_HI_ATTACHMENT modify column ID_ varchar(64) comment '主键id ' ;
alter table ACT_HI_ATTACHMENT modify column REV_ integer comment '数据版本 ' ;
alter table ACT_HI_ATTACHMENT modify column USER_ID_ varchar(255) comment '用户id ' ;
alter table ACT_HI_ATTACHMENT modify column NAME_ varchar(255) comment '附件名称 ' ;
alter table ACT_HI_ATTACHMENT modify column DESCRIPTION_ varchar(4000) comment '附件描述 ' ;
alter table ACT_HI_ATTACHMENT modify column TYPE_ varchar(255) comment '类型 ' ;
alter table ACT_HI_ATTACHMENT modify column TASK_ID_ varchar(64) comment '任务实例id；节点实例id ' ;
alter table ACT_HI_ATTACHMENT modify column PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
alter table ACT_HI_ATTACHMENT modify column URL_ varchar(4000) comment '附件地址' ;
alter table ACT_HI_ATTACHMENT modify column CONTENT_ID_ varchar(64) comment '字节表的ID，ACT_GE_BYTEARRAY的ID ' ;
alter table ACT_HI_ATTACHMENT modify column TIME_ datetime(3) comment '创建时间，时间戳 ' ;

alter table ACT_HI_ATTACHMENT   comment '历史的流程附件  ' ;


create table ACT_HI_IDENTITYLINK (
    ID_ varchar(64),
    GROUP_ID_ varchar(255),
    TYPE_ varchar(255),
    USER_ID_ varchar(255),
    TASK_ID_ varchar(64),
    PROC_INST_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

 alter table ACT_HI_IDENTITYLINK modify column ID_ varchar(64) comment '主键id ' ;
 alter table ACT_HI_IDENTITYLINK modify column GROUP_ID_ varchar(255) comment '组id ' ;
 alter table ACT_HI_IDENTITYLINK modify column TYPE_ varchar(255) comment '类型 ' ;
 alter table ACT_HI_IDENTITYLINK modify column USER_ID_ varchar(255) comment '用户id ' ;
 alter table ACT_HI_IDENTITYLINK modify column TASK_ID_ varchar(64) comment '任务id ' ;
 alter table ACT_HI_IDENTITYLINK modify column PROC_INST_ID_ varchar(64) comment '流程实例id ' ;
 
alter table ACT_HI_IDENTITYLINK   comment '历史流程人员表 ' ;



create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_);
create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_);
create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_);
create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_);
create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_);
create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_);
create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_);
create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_);
create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_NAME_TYPE on ACT_HI_VARINST(NAME_, VAR_TYPE_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST(TASK_ID_);
create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_);
create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_IDENT_LNK_USER on ACT_HI_IDENTITYLINK(USER_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK(TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK(PROC_INST_ID_);
create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST(PROC_INST_ID_);



-- create identity
create table ACT_ID_GROUP (
    ID_ varchar(64),
    REV_ integer,
    NAME_ varchar(255),
    TYPE_ varchar(255),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_ID_GROUP modify column ID_ varchar(64) comment ' 主键' ;
alter table ACT_ID_GROUP modify column REV_ integer comment '数据版本 ' ;
alter table ACT_ID_GROUP modify column NAME_ varchar(255) comment '用户组名称 ' ;
alter table ACT_ID_GROUP modify column TYPE_ varchar(255) comment '用户组类型，类型不由Activit提供，某些业务中，Activit会根据该字段进行查询 ' ;

alter table ACT_ID_GROUP   comment '用户组表 ' ;



create table ACT_ID_MEMBERSHIP (
    USER_ID_ varchar(64),
    GROUP_ID_ varchar(64),
    primary key (USER_ID_, GROUP_ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

alter table ACT_ID_MEMBERSHIP modify column USER_ID_ varchar(64) comment '用户ID，不能为null   ' ;
alter table ACT_ID_MEMBERSHIP modify column GROUP_ID_ varchar(64)comment '用户组ID，不能为null   ' ;

alter table ACT_ID_MEMBERSHIP   comment '用户和组关系表 ' ;



create table ACT_ID_USER (
    ID_ varchar(64),
    REV_ integer,
    FIRST_ varchar(255),
    LAST_ varchar(255),
    EMAIL_ varchar(255),
    PWD_ varchar(255),
    PICTURE_ID_ varchar(64),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

 alter table ACT_ID_USER modify column  ID_ varchar(64) comment '主键id ' ;
 alter table ACT_ID_USER modify column  REV_ integer comment '数据版本 ' ;
 alter table ACT_ID_USER modify column  FIRST_ varchar(255) comment '姓 ' ;
 alter table ACT_ID_USER modify column  LAST_ varchar(255) comment '名 ' ;
 alter table ACT_ID_USER modify column  EMAIL_ varchar(255) comment '邮箱 ' ;
 alter table ACT_ID_USER modify column  PWD_ varchar(255) comment '密码' ;
 alter table ACT_ID_USER modify column  PICTURE_ID_ varchar(64) comment ' ' ;
 
 alter table ACT_ID_USER comment '用户信息表 ' ;
	

create table ACT_ID_INFO (
    ID_ varchar(64),
    REV_ integer,
    USER_ID_ varchar(64),
    TYPE_ varchar(64),
    KEY_ varchar(255),
    VALUE_ varchar(255),
    PASSWORD_ LONGBLOB,
    PARENT_ID_ varchar(255),
    primary key (ID_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE utf8_bin;

 alter table ACT_ID_INFO modify column  ID_ varchar(64) comment '主键id' ;
 alter table ACT_ID_INFO modify column  REV_ integer comment '数据版本 ' ;
 alter table ACT_ID_INFO modify column  USER_ID_ varchar(64) comment '用户id ' ;
 alter table ACT_ID_INFO modify column  TYPE_ varchar(64) comment '类型 ' ;
 alter table ACT_ID_INFO modify column  KEY_ varchar(255) comment '键 ' ;
 alter table ACT_ID_INFO modify column  VALUE_ varchar(255) comment '值 ' ;
 alter table ACT_ID_INFO modify column  PASSWORD_ LONGBLOB comment ' ' ;
 alter table ACT_ID_INFO modify column  PARENT_ID_ varchar(255) comment ' ' ;
 
 alter table ACT_ID_INFO comment '用户详细信息 ' ;
	


alter table ACT_ID_MEMBERSHIP 
    add constraint ACT_FK_MEMB_GROUP 
    foreign key (GROUP_ID_) 
    references ACT_ID_GROUP (ID_);

alter table ACT_ID_MEMBERSHIP 
    add constraint ACT_FK_MEMB_USER 
    foreign key (USER_ID_) 
    references ACT_ID_USER (ID_);





