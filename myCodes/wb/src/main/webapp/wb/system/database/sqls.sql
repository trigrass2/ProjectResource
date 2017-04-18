CREATE TABLE WB_COMPANY
(
  COMPANY_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  COMPANY_NAME {#NVARCHAR#}(50),
  ADDR {#NVARCHAR#}(50),
  COUNTRY {#NVARCHAR#}(20),
  REMARK {#NCLOB#}
);
CREATE TABLE WB_DEPT
(
  DEPT_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  DEPT_NAME {#NVARCHAR#}(50) NOT NULL,
  PARENT_DEPT {#VARCHAR#}(13) NOT NULL,
  ORDER_INDEX {#NUMERIC#}(8) NOT NULL
);
CREATE INDEX WB_DEPT_PARENT_DEPT ON WB_DEPT(PARENT_DEPT);
CREATE TABLE WB_DICT
(
  FIELD_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  TABLE_NAME {#VARCHAR#}(50) NOT NULL,
  FIELD_NAME {#VARCHAR#}(50) NOT NULL,
  DISP_TEXT {#NVARCHAR#}(50),
  LINK_TO {#VARCHAR#}(100),
  LISTABLE {#NUMERIC#}(1),
  EDITABLE {#NUMERIC#}(1),
  DISP_WIDTH {#NUMERIC#}(5),
  DISP_FORMAT {#VARCHAR#}(20),
  AUTO_WRAP {#NUMERIC#}(1),
  ALLOW_BLANK {#NUMERIC#}(1),
  READ_ONLY {#NUMERIC#}(1),
  KEY_NAME {#VARCHAR#}(50),
  FIELD_SIZE {#NUMERIC#}(8),
  DECIMAL_PRECISION {#NUMERIC#}(2),
  VALIDATOR {#NCLOB#},
  RENDERER {#NCLOB#}
);
CREATE UNIQUE INDEX WB_DICT_TABLE_NAME ON WB_DICT(TABLE_NAME,FIELD_NAME);
CREATE TABLE WB_DUAL
(
  DMY {#NUMERIC#}(1) NOT NULL
);
CREATE TABLE WB_EMPLOYEE
(
  EMPLOYEE_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  EMPLOYEE_CODE {#NVARCHAR#}(5) NOT NULL,
  REAL_NAME {#NVARCHAR#}(50) NOT NULL,
  BIRTH_DATE {#DATETIME#} NOT NULL,
  SEX {#VARCHAR#}(1) NOT NULL,
  DEPT_ID {#VARCHAR#}(13) NOT NULL,
  NATION {#VARCHAR#}(2),
  EMAIL {#VARCHAR#}(50),
  VACATION_HOURS {#NUMERIC#}(5),
  COMPANY_ID {#VARCHAR#}(13),
  REMARK {#NCLOB#}
);
CREATE UNIQUE INDEX WB_EMPLOYEE_EMPLOYEE_CODE ON WB_EMPLOYEE(EMPLOYEE_CODE);
CREATE INDEX WB_EMPLOYEE_DEPT_ID ON WB_EMPLOYEE(DEPT_ID);
CREATE TABLE WB_EMPLOYEE_DEPT
(
  DEPT_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  DEPT_NAME {#NVARCHAR#}(50) NOT NULL,
  PARENT_DEPT {#VARCHAR#}(13) NOT NULL,
  ORDER_INDEX {#NUMERIC#}(5) NOT NULL
);
CREATE INDEX WB_EMPLOYEE_DEPT_PARENT_DEPT ON WB_EMPLOYEE_DEPT(PARENT_DEPT);
CREATE TABLE WB_FLOW
(
  FLOW_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  FLOW_NAME {#NVARCHAR#}(100) NOT NULL,
  MODIFY_USER {#VARCHAR#}(13) NOT NULL,
  MODIFY_DATE {#DATETIME#} NOT NULL,
  REMARK {#NVARCHAR#}(200),
  FLOW_CONTENT {#NCLOB#}
);
CREATE UNIQUE INDEX WB_FLOW_FLOW_NAME ON WB_FLOW(FLOW_NAME);
CREATE TABLE WB_KEY
(
  KEY_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  KEY_NAME {#VARCHAR#}(50) NOT NULL,
  K {#VARCHAR#}(50) NOT NULL,
  V {#NVARCHAR#}(200) NOT NULL,
  TYPE {#NUMERIC#}(1) NOT NULL
);
CREATE UNIQUE INDEX WB_KEY_KEY_NAME ON WB_KEY(KEY_NAME,K);
CREATE TABLE WB_LOG
(
  LOG_DATE {#DATETIME#} NOT NULL,
  USER_NAME {#NVARCHAR#}(50) NOT NULL,
  IP {#VARCHAR#}(50) NOT NULL,
  LOG_TYPE {#NUMERIC#}(1) NOT NULL,
  MSG {#NVARCHAR#}(255) NOT NULL
);
CREATE INDEX WB_LOG_LOG_DATE ON WB_LOG(LOG_DATE);
CREATE TABLE WB_MISC
(
  ID_FIELD {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  STRING_FIELD {#NVARCHAR#}(20) NOT NULL,
  INT_FIELD {#NUMERIC#}(8),
  DOUBLE_FIELD {#NUMERIC#}(8,2),
  BOOL_FIELD {#NUMERIC#}(1),
  DATETIME_FIELD {#DATETIME#},
  CLOB_FIELD {#CLOB#},
  BLOB_FIELD {#BLOB#}
);
CREATE TABLE WB_PAGING
(
  V {#NUMERIC#}(5) NOT NULL
);
CREATE INDEX WB_PAGING_V ON WB_PAGING(V);
CREATE TABLE WB_RESOURCE
(
  RES_ID {#VARCHAR#}(200) NOT NULL PRIMARY KEY,
  RES_CONTENT {#BLOB#}
);
CREATE TABLE WB_ROLE
(
  ROLE_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  ROLE_NAME {#NVARCHAR#}(50) NOT NULL,
  REMARK {#NVARCHAR#}(200) NOT NULL,
  STATUS {#NUMERIC#}(1) NOT NULL
);
CREATE UNIQUE INDEX WB_ROLE_ROLE_NAME ON WB_ROLE(ROLE_NAME);
CREATE INDEX WB_ROLE_STATUS ON WB_ROLE(STATUS);
CREATE TABLE WB_ROUTE
(
  ROUTE_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  FLOW_ID {#VARCHAR#}(13) NOT NULL,
  MODIFY_DATE {#DATETIME#} NOT NULL,
  USER_ID {#VARCHAR#}(13) NOT NULL,
  ACTIVE_NODE {#NVARCHAR#}(50) NOT NULL,
  TITLE {#NVARCHAR#}(200) NOT NULL,
  STATUS {#NVARCHAR#}(50) NOT NULL,
  ROUTE_CONTENT {#NCLOB#}
);
CREATE INDEX WB_ROUTE_FLOW_ID ON WB_ROUTE(FLOW_ID);
CREATE INDEX WB_ROUTE_MODIFY_DATE ON WB_ROUTE(MODIFY_DATE);
CREATE INDEX WB_ROUTE_USER_ID ON WB_ROUTE(USER_ID);
CREATE INDEX WB_ROUTE_ACTIVE_NODE ON WB_ROUTE(ACTIVE_NODE);
CREATE TABLE WB_SN
(
  SN_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  SN_CODE {#VARCHAR#}(23) NOT NULL,
  AUTH_NAME {#NVARCHAR#}(200) NOT NULL,
  SN_PRICE {#NUMERIC#}(8) NOT NULL,
  SN_COUNT {#NUMERIC#}(5) NOT NULL,
  SN_TOTAL {#NUMERIC#}(9) NOT NULL,
  REG_DATE {#DATETIME#} NOT NULL,
  CONTACT {#NVARCHAR#}(50),
  EMAIL {#VARCHAR#}(100) NOT NULL,
  PHONE {#VARCHAR#}(30) NOT NULL,
  ADDRESS {#NVARCHAR#}(200) NOT NULL,
  SUPPORT {#NUMERIC#}(1) NOT NULL,
  STATUS {#NUMERIC#}(1) NOT NULL,
  REMARK {#NVARCHAR#}(200)
);
CREATE UNIQUE INDEX WB_SN_SN_CODE ON WB_SN(SN_CODE);
CREATE TABLE WB_STAFF
(
  KEY_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  USER_ID {#VARCHAR#}(13) NOT NULL,
  REAL_NAME {#NVARCHAR#}(100) NOT NULL,
  BIRTHDATE {#DATETIME#},
  EDU {#VARCHAR#}(1),
  NATION {#VARCHAR#}(2),
  TEL {#VARCHAR#}(30),
  EMAIL {#VARCHAR#}(100)
);
CREATE INDEX WB_STAFF_USER_ID ON WB_STAFF(USER_ID);
CREATE TABLE WB_SYS1
(
  SYS_IP {#VARCHAR#}(50) NOT NULL PRIMARY KEY
);
CREATE TABLE WB_SYS2
(
  SYS_DATE {#DATETIME#} NOT NULL,
  SYS_IP {#VARCHAR#}(50) NOT NULL,
  SYS_TITLE {#NVARCHAR#}(200),
  SYS_SN {#VARCHAR#}(23)
);
CREATE INDEX WB_SYS2_SYS_DATE ON WB_SYS2(SYS_DATE);
CREATE TABLE WB_TASK
(
  TASK_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  TASK_NAME {#NVARCHAR#}(200) NOT NULL,
  INTERVAL_TYPE {#NUMERIC#}(1) NOT NULL,
  INTERVAL_EXPRESS {#VARCHAR#}(10) NOT NULL,
  CLASS_NAME {#VARCHAR#}(200),
  SERVER_SCRIPT {#NCLOB#},
  BEGIN_DATE {#DATETIME#},
  END_DATE {#DATETIME#},
  STATUS {#NUMERIC#}(1) NOT NULL,
  REMARK {#NVARCHAR#}(255)
);
CREATE UNIQUE INDEX WB_TASK_TASK_NAME ON WB_TASK(TASK_NAME);
CREATE TABLE WB_USER
(
  USER_ID {#VARCHAR#}(13) NOT NULL PRIMARY KEY,
  USER_NAME {#NVARCHAR#}(50) NOT NULL,
  DISPLAY_NAME {#NVARCHAR#}(100) NOT NULL,
  PASSWORD {#VARCHAR#}(32) NOT NULL,
  STATUS {#NUMERIC#}(1) NOT NULL,
  CREATE_DATE {#DATETIME#} NOT NULL,
  LOGIN_TIMES {#NUMERIC#}(9) NOT NULL,
  EMAIL {#VARCHAR#}(100),
  USE_LANG {#VARCHAR#}(10),
  LAST_LOGIN {#DATETIME#}
);
CREATE UNIQUE INDEX WB_USER_USER_NAME ON WB_USER(USER_NAME);
CREATE INDEX WB_USER_DISPLAY_NAME ON WB_USER(DISPLAY_NAME);
CREATE TABLE WB_USER_ROLE
(
  USER_ID {#VARCHAR#}(13) NOT NULL,
  ROLE_ID {#VARCHAR#}(13) NOT NULL
);
CREATE INDEX WB_USER_ROLE_USER_ID ON WB_USER_ROLE(USER_ID);
CREATE INDEX WB_USER_ROLE_ROLE_ID ON WB_USER_ROLE(ROLE_ID);
CREATE TABLE WB_VALUE
(
  VAL_ID {#VARCHAR#}(200) NOT NULL PRIMARY KEY,
  VAL_CONTENT {#VARCHAR#}(255)
);