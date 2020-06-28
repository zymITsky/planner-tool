
DROP DATABASE IF EXISTS nikeplanner1;

CREATE DATABASE IF NOT EXISTS nikeplanner1;

use nikeplanner1;

-- =============================
-- Table of PT_USER_PROFILE_TAB
-- =============================

DROP TABLE IF EXISTS PT_USER_PROFILE_TAB;

CREATE TABLE IF NOT EXISTS PT_USER_PROFILE_TAB (
	USER_ID INT NOT NULL AUTO_INCREMENT, 
	USER_NAME VARCHAR(30) NOT NULL, 
	USER_PASSWORD VARCHAR(200) NOT NULL, 
	CONSTRAINT pk_PT_USER_PROFILE_TAB PRIMARY KEY (USER_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB
COMMENT = 'PT: User Master Entity';

CREATE INDEX idx_USER_NAME_2_PT_USER_PROFILE_TAB ON PT_USER_PROFILE_TAB (USER_NAME);

-- ==========================
-- Table of PT_USER_ROLE_TAB
-- ==========================

DROP TABLE IF EXISTS PT_USER_ROLE_TAB;

CREATE TABLE IF NOT EXISTS PT_USER_ROLE_TAB (
	USER_ROLE_ID INT NOT NULL AUTO_INCREMENT, 
	ROLE_NAME VARCHAR(30) NOT NULL, 
	CONSTRAINT pk_PT_USER_ROLE_TAB PRIMARY KEY (USER_ROLE_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB
COMMENT = 'PT: User Role Master Entity';

CREATE INDEX idx_ROLE_NAME_2_PT_USER_ROLE_TAB ON PT_USER_ROLE_TAB (ROLE_NAME);

-- ==================================
-- Table of PT_USER_ROLE_MAPPING_TAB
-- ==================================

DROP TABLE IF EXISTS PT_USER_ROLE_MAPPING_TAB;

CREATE TABLE IF NOT EXISTS PT_USER_ROLE_MAPPING_TAB (
	USER_ID INT NOT NULL, 
	USER_ROLE_ID INT NOT NULL, 
	CONSTRAINT fk_PT_USER_ROLE_MAPPING_TAB_USER_ID FOREIGN KEY (USER_ID) REFERENCES PT_USER_PROFILE_TAB (USER_ID), 
	CONSTRAINT fk_PT_USER_ROLE_MAPPING_TAB_USER_ROLE_ID FOREIGN KEY (USER_ROLE_ID) REFERENCES PT_USER_ROLE_TAB (USER_ROLE_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB
COMMENT = 'PT: User and Role Mapping';

CREATE INDEX IDX_PT_USER_ROLE_MAPPING_TAB_USER_ID ON PT_USER_ROLE_MAPPING_TAB (USER_ID);
CREATE INDEX IDX_PT_USER_ROLE_MAPPING_TAB_USER_ROLE_ID ON PT_USER_ROLE_MAPPING_TAB (USER_ROLE_ID);

-- =====================================
-- Table of PT_USER_ROLE_PERMISSION_TAB
-- =====================================

DROP TABLE IF EXISTS PT_USER_ROLE_PERMISSION_TAB;

CREATE TABLE IF NOT EXISTS PT_USER_ROLE_PERMISSION_TAB (
	USER_ROLE_PERMISSION_ID INT NOT NULL AUTO_INCREMENT, 
	PERMISSION VARCHAR(30) NOT NULL, 
	CONSTRAINT pk_PT_USER_ROLE_PERMISSION_TAB PRIMARY KEY (USER_ROLE_PERMISSION_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB
COMMENT = 'PT: Role Permission Master Entity';

-- =============================================
-- Table of PT_USER_ROLE_PERMISSION_MAPPING_TAB
-- =============================================

DROP TABLE IF EXISTS PT_USER_ROLE_PERMISSION_MAPPING_TAB;

CREATE TABLE IF NOT EXISTS PT_USER_ROLE_PERMISSION_MAPPING_TAB (
	USER_ROLE_ID INT NOT NULL, 
	USER_ROLE_PERMISSION_ID INT NOT NULL, 
	CONSTRAINT fk_PT_USER_ROLE_PERMISSION_MAPPING_TAB_USER_ROLE_ID FOREIGN KEY (USER_ROLE_ID) REFERENCES PT_USER_ROLE_TAB (USER_ROLE_ID), 
	CONSTRAINT fk_PT_USER_ROLE_PERMISSION_MAPPING_TAB_USER_ROLE_PERMISSION_ID FOREIGN KEY (USER_ROLE_PERMISSION_ID) REFERENCES PT_USER_ROLE_PERMISSION_TAB (USER_ROLE_PERMISSION_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB
COMMENT = 'PT: User Role and Permission Mapping';

CREATE INDEX IDX_PT_USER_ROLE_PERMISSION_MAPPING_TAB_USER_ROLE_ID ON PT_USER_ROLE_PERMISSION_MAPPING_TAB (USER_ROLE_ID);
CREATE INDEX IDX_PT_USER_ROLE_PERMISSION_MAPPING_TAB_USER_ROLE_PERMISSION_ID ON PT_USER_ROLE_PERMISSION_MAPPING_TAB (USER_ROLE_PERMISSION_ID);

-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

-- ==================================
-- Table of PT_STAFF_DETAIL_TEST_TAB
-- ==================================

DROP TABLE IF EXISTS PT_STAFF_DETAIL_TEST_TAB;

CREATE TABLE IF NOT EXISTS PT_STAFF_DETAIL_TEST_TAB (
	STAFF_ID INT NOT NULL AUTO_INCREMENT, 
	FIRST_NAME VARCHAR(50) NOT NULL, 
	LAST_NAME VARCHAR(50) NOT NULL, 
	IMAGE_B64 TEXT, 
	GENDER VARCHAR(10) NOT NULL, 
	POSITION VARCHAR(80) NOT NULL, 
	EMAIL VARCHAR(150) NOT NULL, 
	OFFICE VARCHAR(80) NOT NULL, 
	EXTN VARCHAR(20) NOT NULL, 
	AGE INT DEFAULT 0 NOT NULL, 
	SALARY DOUBLE NOT NULL, 
	START_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
	TIME_MILLIS BIGINT DEFAULT 0 NOT NULL, 
	CONSTRAINT pk_PT_STAFF_DETAIL_TEST_TAB PRIMARY KEY (STAFF_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB;

-- =========================================
-- Table of PT_STAFF_SALARY_DETAIL_TEST_TAB
-- =========================================

DROP TABLE IF EXISTS PT_STAFF_SALARY_DETAIL_TEST_TAB;

CREATE TABLE IF NOT EXISTS PT_STAFF_SALARY_DETAIL_TEST_TAB (
	STAFF_SALARY_ID INT NOT NULL AUTO_INCREMENT, 
	-- STAFF_REF_ID INT DEFAULT 0 NOT NULL, 
	FULL_NAME VARCHAR(100) NOT NULL, 
	IMAGE_B64 TEXT, 
	GROSS DOUBLE NOT NULL, 
	BASE DOUBLE NOT NULL, 
	COMPENSATION DOUBLE NOT NULL, 
	INCENTIVE DOUBLE NOT NULL, 
	CONSTRAINT pk_PT_STAFF_SALARY_DETAIL_TEST_TAB PRIMARY KEY (STAFF_SALARY_ID) 
	-- CONSTRAINT fk_PT_STAFF_SALARY_DETAIL_TEST_TAB_2_PT_STAFF_DETAIL_TEST_TAB FOREIGN KEY (STAFF_REF_ID) REFERENCES PT_STAFF_DETAIL_TEST_TAB (STAFF_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB;

-- CREATE INDEX idx_PT_STAFF_SALARY_DETAIL_TEST_TAB_2_PT_STAFF_DETAIL_TEST_TAB ON PT_STAFF_SALARY_DETAIL_TEST_TAB (STAFF_REF_ID);

-- =======================================
-- Table of PT_ASSORTMENT_PLAN_DETAIL_TAB
-- =======================================

DROP TABLE IF EXISTS PT_ASSORTMENT_PLAN_DETAIL_TAB;

CREATE TABLE IF NOT EXISTS PT_ASSORTMENT_PLAN_DETAIL_TAB (
	ASSORTMENT_PLAN_ID INT NOT NULL AUTO_INCREMENT, 
	IMAGE_B64 TEXT, 
	DIVISION VARCHAR(30) NOT NULL, 
	PRODUCT_ID INT DEFAULT 0 NOT NULL, 
	STYLE VARCHAR(30) NOT NULL, 
	PRODUCT_CODE VARCHAR(40) NOT NULL, 
	GENDER VARCHAR(10) NOT NULL, 
	AGE VARCHAR(20) NOT NULL, 
	STYLE_NAME VARCHAR(50) NOT NULL, 
	COLOR_DESCRIPTION VARCHAR(100) NOT NULL, 
	CN_MSRP DOUBLE NOT NULL, 
	ATTRIBUTE_1 VARCHAR(30) NOT NULL, 
	ATTRIBUTE_2 VARCHAR(30) NOT NULL, 
	STYLE_RANK INT DEFAULT 0 NOT NULL, 
	COLOR_RANK INT DEFAULT 0 NOT NULL, 
	SLS_WK INT DEFAULT 0 NOT NULL, 
	NUM_DOORS INT DEFAULT 0 NOT NULL, 
	REFERENCE_STYLE VARCHAR(30) NOT NULL, 
	CONSTRAINT pk_PT_ASSORTMENT_PLAN_DETAIL_TAB PRIMARY KEY (ASSORTMENT_PLAN_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB;

-- =========================================
-- Table of PT_BUY_PLAN_TOP2DOWN_DETAIL_TAB
-- =========================================

DROP TABLE IF EXISTS PT_BUY_PLAN_TOP2DOWN_DETAIL_TAB;

CREATE TABLE IF NOT EXISTS PT_BUY_PLAN_TOP2DOWN_DETAIL_TAB (
	BP_TOP2DOWN_ID INT NOT NULL AUTO_INCREMENT, 
	ASSORTMENT_PLAN_ID INT DEFAULT 0 NOT NULL, 
	STYLE_PENETRATION DOUBLE NOT NULL, 
	TTL_REVENUE DOUBLE NOT NULL, 
	ST_PERCENT DOUBLE NOT NULL, 
	TTL_BUY_UNITS INT DEFAULT 0 NOT NULL, 
	PRD_SEASON VARCHAR(10) NOT NULL, 
	COMMIT_GATE INT DEFAULT 0 NOT NULL, 
	CREATED_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
	CONSTRAINT pk_PT_BUY_PLAN_TOP2DOWN_DETAIL_TAB PRIMARY KEY (BP_TOP2DOWN_ID) 
	-- CONSTRAINT fk_PT_BUY_PLAN_TOP2DOWN_DETAIL_TAB_2_PT_ASSORTMENT_PLAN_DETAIL_TAB FOREIGN KEY (ASSORTMENT_PLAN_ID) REFERENCES PT_ASSORTMENT_PLAN_DETAIL_TAB (ASSORTMENT_PLAN_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB;

CREATE INDEX idx_ASSORTMENT_PLAN_ID_2_PT_ASSORTMENT_PLAN_DETAIL_TAB ON PT_BUY_PLAN_TOP2DOWN_DETAIL_TAB (ASSORTMENT_PLAN_ID);

CREATE VIEW PT_BP_TOP2DOWN_LATEST_TRANS_V AS 
SELECT assortment.ASSORTMENT_PLAN_ID, assortment.IMAGE_B64, assortment.DIVISION, assortment.PRODUCT_ID, assortment.STYLE, assortment.PRODUCT_CODE, assortment.GENDER, assortment.AGE, STYLE_NAME, assortment.COLOR_DESCRIPTION, assortment.CN_MSRP, assortment.ATTRIBUTE_1, assortment.ATTRIBUTE_2, assortment.STYLE_RANK, assortment.COLOR_RANK, 
ifnull(top2down.BP_TOP2DOWN_ID, 0) AS BP_TOP2DOWN_ID, 
ifnull(top2down.STYLE_PENETRATION, 0.0) AS STYLE_PENETRATION, 
ifnull(top2down.TTL_REVENUE, 0.0) AS TTL_REVENUE, 
ifnull(top2down.ST_PERCENT, 0.0) AS ST_PERCENT, 
ifnull(top2down.TTL_BUY_UNITS, 0) AS TTL_BUY_UNITS
FROM PT_ASSORTMENT_PLAN_DETAIL_TAB AS assortment 
LEFT JOIN (
SELECT t1.* 
FROM PT_BUY_PLAN_TOP2DOWN_DETAIL_TAB AS t1 
INNER JOIN (
SELECT ASSORTMENT_PLAN_ID, PRD_SEASON, max(COMMIT_GATE) as COMMIT_GATE FROM PT_BUY_PLAN_TOP2DOWN_DETAIL_TAB GROUP BY ASSORTMENT_PLAN_ID, PRD_SEASON 
) AS t2 
ON t1.ASSORTMENT_PLAN_ID = t2.ASSORTMENT_PLAN_ID AND t1.PRD_SEASON = t2.PRD_SEASON AND t1.COMMIT_GATE = t2.COMMIT_GATE
) AS top2down 
ON assortment.ASSORTMENT_PLAN_ID = top2down.ASSORTMENT_PLAN_ID 
ORDER BY assortment.PRODUCT_ID;

-- ==========================================
-- Table of PT_BUY_PLAN_BOTTOM2UP_DETAIL_TAB
-- ==========================================

DROP TABLE IF EXISTS PT_BUY_PLAN_BOTTOM2UP_DETAIL_TAB;

CREATE TABLE IF NOT EXISTS PT_BUY_PLAN_BOTTOM2UP_DETAIL_TAB (
	BP_BOTTOM2UP_ID INT NOT NULL AUTO_INCREMENT, 
	ASSORTMENT_PLAN_ID INT DEFAULT 0 NOT NULL, 
	HISTORY_APS DOUBLE NOT NULL, 
	GROWTH_PERCENT_1 DOUBLE NOT NULL, 
	APS_PLAN DOUBLE NOT NULL, 
	ST_PERCENT_PLAN DOUBLE NOT NULL, 
	MD_PERCENT DOUBLE NOT NULL, 
	HISTORY_BUY_UNITS INT DEFAULT 0 NOT NULL, 
	GROWTH_PERCENT_2 DOUBLE NOT NULL, 
	PLAN_BUY_UNITS INT DEFAULT 0 NOT NULL, 
	PRD_SEASON VARCHAR(10) NOT NULL, 
	COMMIT_GATE INT DEFAULT 0 NOT NULL, 
	CREATED_DATE TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
	CONSTRAINT pk_PT_BUY_PLAN_BOTTOM2UP_DETAIL_TAB PRIMARY KEY (BP_BOTTOM2UP_ID) 
	-- CONSTRAINT fk_PT_BUY_PLAN_BOTTOM2UP_DETAIL_TAB_2_PT_ASSORTMENT_PLAN_DETAIL_TAB FOREIGN KEY (ASSORTMENT_PLAN_ID) REFERENCES PT_ASSORTMENT_PLAN_DETAIL_TAB (ASSORTMENT_PLAN_ID)
)
-- DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci
ENGINE = InnoDB;

CREATE INDEX idx_ASSORTMENT_PLAN_ID_2_PT_ASSORTMENT_PLAN_DETAIL_TAB ON PT_BUY_PLAN_BOTTOM2UP_DETAIL_TAB (ASSORTMENT_PLAN_ID);

CREATE VIEW PT_BP_BOTTOM2UP_LATEST_TRANS_V AS 
SELECT assortment.*, 
ifnull(bottom2up.BP_BOTTOM2UP_ID, 0) AS BP_BOTTOM2UP_ID, 
ifnull(bottom2up.HISTORY_APS, 0.0) AS HISTORY_APS, 
ifnull(bottom2up.GROWTH_PERCENT_1, 0.0) AS GROWTH_PERCENT_1, 
ifnull(bottom2up.APS_PLAN, 0.0) AS APS_PLAN, 
ifnull(bottom2up.ST_PERCENT_PLAN, 0.0) AS ST_PERCENT_PLAN, 
ifnull(bottom2up.MD_PERCENT, 0.0) AS MD_PERCENT, 
ifnull(bottom2up.HISTORY_BUY_UNITS, 0) AS HISTORY_BUY_UNITS, 
ifnull(bottom2up.GROWTH_PERCENT_2, 0.0) AS GROWTH_PERCENT_2, 
ifnull(bottom2up.PLAN_BUY_UNITS, 0) AS PLAN_BUY_UNITS 
FROM PT_ASSORTMENT_PLAN_DETAIL_TAB AS assortment 
LEFT JOIN (
SELECT t1.* 
FROM PT_BUY_PLAN_BOTTOM2UP_DETAIL_TAB AS t1 
INNER JOIN (
SELECT ASSORTMENT_PLAN_ID, PRD_SEASON, max(COMMIT_GATE) as COMMIT_GATE FROM PT_BUY_PLAN_BOTTOM2UP_DETAIL_TAB GROUP BY ASSORTMENT_PLAN_ID, PRD_SEASON 
) AS t2 
ON t1.ASSORTMENT_PLAN_ID = t2.ASSORTMENT_PLAN_ID AND t1.PRD_SEASON = t2.PRD_SEASON AND t1.COMMIT_GATE = t2.COMMIT_GATE
) AS bottom2up 
ON assortment.ASSORTMENT_PLAN_ID = bottom2up.ASSORTMENT_PLAN_ID 
ORDER BY assortment.PRODUCT_ID;

-- ######################################################################################################################################################################################### --

-- ==============================
-- PT_BP_T2D_PLATFORM_DETAIL_TAB
-- ==============================

DROP TABLE IF EXISTS PT_BP_T2D_PLATFORM_DETAIL_TAB;

CREATE TABLE IF NOT EXISTS PT_BP_T2D_PLATFORM_DETAIL_TAB (
	BP_T2D_PLATFORM_ID INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	PLATFORM VARCHAR(20) DEFAULT '' NOT NULL, 
	DIVISION VARCHAR(20) DEFAULT '' NOT NULL, 
	REV_DOLAR DOUBLE DEFAULT 0.0 NOT NULL, 
	DELTA_PERCENT DOUBLE DEFAULT 0.0 NOT NULL, 
	SALE_UNIT INT UNSIGNED DEFAULT 0 NOT NULL, 
	AUR_DOLAR DOUBLE DEFAULT 0.0 NOT NULL, 
	MD_PERCENT DOUBLE DEFAULT 0.0 NOT NULL, 
	IN_SEA_PERCENT DOUBLE DEFAULT 0.0 NOT NULL, 
	ST_PERCENT DOUBLE DEFAULT 0.0 NOT NULL, 
	BUY_UNIT INT UNSIGNED DEFAULT 0 NOT NULL, 
	YEAR_NUM INT UNSIGNED DEFAULT 0 NOT NULL, 
	PRIMARY KEY (BP_T2D_PLATFORM_ID)
)
ENGINE = InnoDB
COMMENT = 'PT : BPT2DPD Master Entity';

CREATE INDEX IDX_1_PT_BP_T2D_PLATFORM_DETAIL_TAB ON PT_BP_T2D_PLATFORM_DETAIL_TAB (PLATFORM, DIVISION, YEAR_NUM);
CREATE INDEX IDX_2_PT_BP_T2D_PLATFORM_DETAIL_TAB ON PT_BP_T2D_PLATFORM_DETAIL_TAB (DIVISION);

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_TY_V AS 
select t2.BP_T2D_PLATFORM_ID, t2.REV_DOLAR, t2.DELTA_PERCENT, t2.SALE_UNIT, t2.AUR_DOLAR, t2.ST_PERCENT, t2.BUY_UNIT, t2.PLATFORM, t2.DIVISION from PT_BP_T2D_PLATFORM_DETAIL_TAB t2 where t2.YEAR_NUM = year(now()) and t2.PLATFORM in ('NIKE.COM', 'T-MALL', 'HK.COM') and t2.DIVISION <> 'TOTAL APP';

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_LY_V AS 
select t1.BP_T2D_PLATFORM_ID, t1.REV_DOLAR, t1.SALE_UNIT, t1.AUR_DOLAR, t1.MD_PERCENT, t1.IN_SEA_PERCENT, t1.BUY_UNIT, t1.ST_PERCENT, t1.PLATFORM, t1.DIVISION from PT_BP_T2D_PLATFORM_DETAIL_TAB t1 where t1.YEAR_NUM = year(now()) - 1 and t1.PLATFORM in ('NIKE.COM', 'T-MALL', 'HK.COM') and t1.DIVISION <> 'TOTAL APP';

-- FUNCTION : tysaleunit_default(lyrevdolar, tyaurdolar)
-- FUNCTION : tybuyunit_default(lyrevdolar, tyaurdolar)

DELIMITER $$
CREATE FUNCTION tysaleunit_default(lyrevdolar DOUBLE, tyaurdolar DOUBLE) RETURNS INT
	DETERMINISTIC
	READS SQL DATA
BEGIN
	RETURN convert(lyrevdolar*(1.0 + 0.6)/tyaurdolar, SIGNED);
END $$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION tybuyunit_default(lyrevdolar DOUBLE, tyaurdolar DOUBLE) RETURNS INT
	DETERMINISTIC
	READS SQL DATA
BEGIN
	RETURN convert(tysaleunit_default(lyrevdolar, tyaurdolar)/0.6, SIGNED);
END $$
DELIMITER ;

-- ################################################################################################### --

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_LY_TY_CMP_V AS 
select ly.BP_T2D_PLATFORM_ID, ly.PLATFORM, ly.DIVISION, 
ifnull(ty.REV_DOLAR, ly.REV_DOLAR*(1.0 + 0.6)) as TY_REV_DOLAR, 
ifnull(ty.DELTA_PERCENT, 60.0) as TY_DELTA_PERCENT, 
ifnull(ty.SALE_UNIT, tysaleunit_default(ly.REV_DOLAR, ly.AUR_DOLAR)) as TY_SALE_UNIT, 
ifnull(ty.AUR_DOLAR, ly.AUR_DOLAR) as TY_AUR_DOLAR, 
ifnull(ty.ST_PERCENT, 60.0) as TY_ST_PERCENT, 
ifnull(ty.BUY_UNIT, tybuyunit_default(ly.REV_DOLAR, ly.AUR_DOLAR)) as TY_BUY_UNIT, 
ly.REV_DOLAR as LY_REV_DOLAR, ly.SALE_UNIT as LY_SALE_UNIT, ly.AUR_DOLAR as LY_AUR_DOLAR, ly.MD_PERCENT as LY_MD_PERCENT, ly.IN_SEA_PERCENT as LY_IN_SEA_PERCENT, ly.BUY_UNIT as LY_BUY_UNIT, ly.ST_PERCENT as LY_ST_PERCENT 
from PT_BP_T2D_PLATFORM_TY_V ty right join PT_BP_T2D_PLATFORM_LY_V ly on ty.PLATFORM = ly.PLATFORM and ty.DIVISION = ly.DIVISION 
order by ly.BP_T2D_PLATFORM_ID;

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_TOTAL_APP_LY_V AS 
select t1.BP_T2D_PLATFORM_ID, t1.REV_DOLAR, t1.SALE_UNIT, t1.AUR_DOLAR, t1.MD_PERCENT, t1.IN_SEA_PERCENT, t1.BUY_UNIT, t1.ST_PERCENT, t1.PLATFORM, t1.DIVISION from PT_BP_T2D_PLATFORM_DETAIL_TAB t1 where t1.YEAR_NUM = year(now()) - 1 and t1.PLATFORM in ('NIKE.COM', 'T-MALL', 'HK.COM') and t1.DIVISION = 'TOTAL APP';

-- FUNCTION : tybuyunit1_default(lyrevdolar, tyaurdolar)

DELIMITER $$
CREATE FUNCTION tydeltapercent_default(tyrevdolar DOUBLE, lyrevdolar DOUBLE) RETURNS DOUBLE
	DETERMINISTIC
	READS SQL DATA
BEGIN
	RETURN (tyrevdolar/lyrevdolar - 1)*100.0;
END $$
DELIMITER ;

-- ################################################################################################### --

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_TOTAL_APP_LY_TY_CMP_V AS 
select ly.BP_T2D_PLATFORM_ID, ly.PLATFORM, ly.DIVISION, 
ty_total.TY_REV_DOLAR as TY_REV_DOLAR, 
tydeltapercent_default(ty_total.TY_REV_DOLAR, ly.REV_DOLAR) as TY_DELTA_PERCENT, 
ty_total.TY_SALE_UNIT as TY_SALE_UNIT, 
ty_total.TY_REV_DOLAR/ty_total.TY_SALE_UNIT as TY_AUR_DOLAR, 
ty_total.TY_SALE_UNIT/ty_total.TY_BUY_UNIT*100.0 as TY_ST_PERCENT, 
ty_total.TY_BUY_UNIT as TY_BUY_UNIT, 
ly.REV_DOLAR as LY_REV_DOLAR, ly.SALE_UNIT as LY_SALE_UNIT, ly.AUR_DOLAR as LY_AUR_DOLAR, ly.MD_PERCENT as LY_MD_PERCENT, ly.IN_SEA_PERCENT as LY_IN_SEA_PERCENT, ly.BUY_UNIT as LY_BUY_UNIT, ly.ST_PERCENT as LY_ST_PERCENT, 
100.0 as TY_REV_DOLAR_PERCENT, 100.0 as LY_REV_DOLAR_PERCENT, 0.0 as VAR_REV_DOLAR_PERCENT 
from PT_BP_T2D_PLATFORM_TOTAL_APP_LY_V ly 
inner join (select SUM(t1.TY_REV_DOLAR) as TY_REV_DOLAR, 
SUM(t1.TY_SALE_UNIT) as TY_SALE_UNIT, 
SUM(t1.TY_BUY_UNIT) as TY_BUY_UNIT, 
t1.PLATFORM from PT_BP_T2D_PLATFORM_LY_TY_CMP_V t1 group by t1.PLATFORM) ty_total on ty_total.PLATFORM = ly.PLATFORM 
order by ly.BP_T2D_PLATFORM_ID;

-- FUNCTION : varrevdolarpercent_default(tyrevdolar, tytotal, lyrevdolar, lytotal)

DELIMITER $$
CREATE FUNCTION varrevdolarpercent_default(tyrevdolar DOUBLE, tytotal DOUBLE, lyrevdolar DOUBLE, lytotal DOUBLE) RETURNS DOUBLE
	DETERMINISTIC
	READS SQL DATA
BEGIN
	RETURN (tyrevdolar/tytotal - lyrevdolar/lytotal)*10000.0;
END $$
DELIMITER ;

-- ################################################################################################### --

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_LY_TY_V AS 
select t1.*, 
t1.TY_REV_DOLAR/ty_total_rev.TY_REV_DOLAR*100.0 as TY_REV_DOLAR_PERCENT, 
t1.LY_REV_DOLAR/ly.REV_DOLAR*100.0 as LY_REV_DOLAR_PERCENT, 
varrevdolarpercent_default(t1.TY_REV_DOLAR, ty_total_rev.TY_REV_DOLAR, t1.LY_REV_DOLAR, ly.REV_DOLAR) as VAR_REV_DOLAR_PERCENT 
from PT_BP_T2D_PLATFORM_LY_TY_CMP_V t1 
inner join PT_BP_T2D_PLATFORM_TOTAL_APP_LY_V ly on t1.PLATFORM = ly.PLATFORM 
inner join (select SUM(t.TY_REV_DOLAR) as TY_REV_DOLAR, t.PLATFORM from PT_BP_T2D_PLATFORM_LY_TY_CMP_V t group by t.PLATFORM) ty_total_rev on ly.PLATFORM = ty_total_rev.PLATFORM 
order by t1.BP_T2D_PLATFORM_ID;

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_GC_TOTAL_LY_V AS 
select t1.BP_T2D_PLATFORM_ID, t1.REV_DOLAR, t1.SALE_UNIT, t1.AUR_DOLAR, t1.MD_PERCENT, t1.IN_SEA_PERCENT, t1.BUY_UNIT, t1.ST_PERCENT, t1.PLATFORM, t1.DIVISION from PT_BP_T2D_PLATFORM_DETAIL_TAB t1 where t1.YEAR_NUM = year(now()) - 1 and t1.PLATFORM = 'GC TOTAL' and t1.DIVISION <> 'TOTAL APP';

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_GC_TOTAL_LY_TY_CMP_V AS 
select ly.BP_T2D_PLATFORM_ID, ly.PLATFORM, ly.DIVISION, 
t1.TY_REV_DOLAR as TY_REV_DOLAR, 
tydeltapercent_default(t1.TY_REV_DOLAR, ly.REV_DOLAR) as TY_DELTA_PERCENT, 
t1.TY_REV_DOLAR/ly.AUR_DOLAR as TY_SALE_UNIT, 
ly.AUR_DOLAR as TY_AUR_DOLAR, 
60.0 as TY_ST_PERCENT, 
t1.TY_REV_DOLAR/ly.AUR_DOLAR/0.6 as TY_BUY_UNIT, 
ly.REV_DOLAR as LY_REV_DOLAR, ly.SALE_UNIT as LY_SALE_UNIT, ly.AUR_DOLAR as LY_AUR_DOLAR, ly.MD_PERCENT as LY_MD_PERCENT, ly.IN_SEA_PERCENT as LY_IN_SEA_PERCENT, ly.BUY_UNIT as LY_BUY_UNIT, ly.ST_PERCENT as LY_ST_PERCENT 
from PT_BP_T2D_PLATFORM_GC_TOTAL_LY_V ly 
right join (select sum(TY_REV_DOLAR) as TY_REV_DOLAR, DIVISION from PT_BP_T2D_PLATFORM_LY_TY_CMP_V group by DIVISION) t1 on t1.DIVISION = ly.DIVISION 
order by ly.BP_T2D_PLATFORM_ID;

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_GCT_TAPP_LY_V AS 
select t1.BP_T2D_PLATFORM_ID, t1.REV_DOLAR, t1.SALE_UNIT, t1.AUR_DOLAR, t1.MD_PERCENT, t1.IN_SEA_PERCENT, t1.BUY_UNIT, t1.ST_PERCENT, t1.PLATFORM, t1.DIVISION from PT_BP_T2D_PLATFORM_DETAIL_TAB t1 where t1.YEAR_NUM = year(now()) - 1 and t1.PLATFORM = 'GC TOTAL' and t1.DIVISION = 'TOTAL APP';

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_GCT_TAPP_LY_TY_CMP_V AS 
select ly.BP_T2D_PLATFORM_ID, ly.PLATFORM, ly.DIVISION, 
ty_total.TY_REV_DOLAR as TY_REV_DOLAR, 
tydeltapercent_default(ty_total.TY_REV_DOLAR, ly.REV_DOLAR) as TY_DELTA_PERCENT, 
ty_total.TY_SALE_UNIT as TY_SALE_UNIT, 
ty_total.TY_REV_DOLAR/ty_total.TY_SALE_UNIT as TY_AUR_DOLAR, 
ty_total.TY_SALE_UNIT/ty_total.TY_BUY_UNIT*100.0 as TY_ST_PERCENT, 
ty_total.TY_BUY_UNIT as TY_BUY_UNIT, 
ly.REV_DOLAR as LY_REV_DOLAR, ly.SALE_UNIT as LY_SALE_UNIT, ly.AUR_DOLAR as LY_AUR_DOLAR, ly.MD_PERCENT as LY_MD_PERCENT, ly.IN_SEA_PERCENT as LY_IN_SEA_PERCENT, ly.BUY_UNIT as LY_BUY_UNIT, ly.ST_PERCENT as LY_ST_PERCENT, 
100.0 as TY_REV_DOLAR_PERCENT, 100.0 as LY_REV_DOLAR_PERCENT, 0.0 as VAR_REV_DOLAR_PERCENT 
from PT_BP_T2D_PLATFORM_GCT_TAPP_LY_V ly 
inner join (select SUM(t1.TY_REV_DOLAR) as TY_REV_DOLAR, 
SUM(t1.TY_SALE_UNIT) as TY_SALE_UNIT, 
SUM(t1.TY_BUY_UNIT) as TY_BUY_UNIT, 
t1.PLATFORM from PT_BP_T2D_PLATFORM_GC_TOTAL_LY_TY_CMP_V t1 group by t1.PLATFORM) ty_total on ty_total.PLATFORM = ly.PLATFORM 
order by ly.BP_T2D_PLATFORM_ID;

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_GC_TOTAL_LY_TY_V AS 
select t1.*, 
(t1.TY_REV_DOLAR/ty_total_rev.TY_REV_DOLAR)*100.0 as TY_REV_DOLAR_PERCENT, 
(t1.LY_REV_DOLAR/ly.REV_DOLAR)*100.0 as LY_REV_DOLAR_PERCENT, 
varrevdolarpercent_default(t1.TY_REV_DOLAR, ty_total_rev.TY_REV_DOLAR, t1.LY_REV_DOLAR, ly.REV_DOLAR) as VAR_REV_DOLAR_PERCENT 
from PT_BP_T2D_PLATFORM_GC_TOTAL_LY_TY_CMP_V t1 
inner join PT_BP_T2D_PLATFORM_GCT_TAPP_LY_V ly on t1.PLATFORM = ly.PLATFORM 
inner join (select SUM(t1.TY_REV_DOLAR) as TY_REV_DOLAR, t1.PLATFORM from PT_BP_T2D_PLATFORM_GC_TOTAL_LY_TY_CMP_V t1 group by t1.PLATFORM) ty_total_rev on ly.PLATFORM = ty_total_rev.PLATFORM 
order by t1.BP_T2D_PLATFORM_ID;

CREATE OR REPLACE VIEW PT_BP_T2D_PLATFORM_LY_TY_CMP_ALL_V AS 
select * from PT_BP_T2D_PLATFORM_LY_TY_V where PLATFORM = 'NIKE.COM'
union all
select * from PT_BP_T2D_PLATFORM_TOTAL_APP_LY_TY_CMP_V where PLATFORM = 'NIKE.COM'
union all
select * from PT_BP_T2D_PLATFORM_LY_TY_V where PLATFORM = 'T-MALL'
union all
select * from PT_BP_T2D_PLATFORM_TOTAL_APP_LY_TY_CMP_V where PLATFORM = 'T-MALL'
union all
select * from PT_BP_T2D_PLATFORM_LY_TY_V where PLATFORM = 'HK.COM'
union all
select * from PT_BP_T2D_PLATFORM_TOTAL_APP_LY_TY_CMP_V where PLATFORM = 'HK.COM'
union all
select * from PT_BP_T2D_PLATFORM_GC_TOTAL_LY_TY_V where PLATFORM = 'GC TOTAL'
union all
select * from PT_BP_T2D_PLATFORM_GCT_TAPP_LY_TY_CMP_V where PLATFORM = 'GC TOTAL';

-- ========================
-- PT_ASSORTMENT_IMAGE_TAB
-- ========================

DROP TABLE IF EXISTS PT_ASSORTMENT_IMAGE_TAB;

CREATE TABLE IF NOT EXISTS PT_ASSORTMENT_IMAGE_TAB (
	ASSORTMENT_IMAGE_ID INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	DIVISION VARCHAR(30) DEFAULT '' NOT NULL, 
	ATTRIBUTE_1 VARCHAR(30) DEFAULT '' NOT NULL, 
	ATTRIBUTE_3 VARCHAR(30) DEFAULT '' NOT NULL, 
	STYLE_NAME VARCHAR(50) DEFAULT '' NOT NULL, 
	STYLE_RANK INT UNSIGNED DEFAULT 0 NOT NULL, 
	IMAGE_B64 TEXT, 
	PRIMARY KEY (ASSORTMENT_IMAGE_ID)
)
ENGINE = InnoDB
COMMENT = 'PT : Assortment Image Mapper';

CREATE INDEX IDX_1_PT_ASSORTMENT_IMAGE_TAB ON PT_ASSORTMENT_IMAGE_TAB (DIVISION, ATTRIBUTE_1, ATTRIBUTE_3, STYLE_NAME);

-- ==========================
-- PT_ASSORT_PLAN_DETAIL_TAB
-- ==========================

DROP TABLE IF EXISTS PT_ASSORT_PLAN_DETAIL_TAB;

CREATE TABLE IF NOT EXISTS PT_ASSORT_PLAN_DETAIL_TAB (
	ASSORT_PLAN_ID INT UNSIGNED NOT NULL AUTO_INCREMENT, 
	ASSORTMENT_IMAGE_ID INT UNSIGNED NOT NULL, 
	CATEGORY VARCHAR(70) DEFAULT '' NOT NULL, 
	DIVISION VARCHAR(30) DEFAULT '' NOT NULL, 
	SEASON VARCHAR(5) DEFAULT '' NOT NULL, 
	PRODUCT_ID INT UNSIGNED DEFAULT 0 NOT NULL, 
	STYLE VARCHAR(30) DEFAULT '' NOT NULL, 
	PRODUCT_CODE VARCHAR(40) DEFAULT '' NOT NULL, 
	GENDER VARCHAR(10) DEFAULT '' NOT NULL, 
	AGE VARCHAR(20) DEFAULT '' NOT NULL, 
	STYLE_NAME VARCHAR(50) DEFAULT '' NOT NULL, 
	SILHOUETTE VARCHAR(50) DEFAULT '' NOT NULL, 
	-- Fixed Bug for MySql-5.7.20
	DTC_OMD TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
	MMX_OMD TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, 
	-- DTC_OMD TIMESTAMP NOT NULL, 
	-- MMX_OMD TIMESTAMP NOT NULL, 
	MONTH VARCHAR(20) DEFAULT '' NOT NULL, 
	SELLING_WEEKS INT UNSIGNED DEFAULT 0 NOT NULL, 
	FLOW VARCHAR(20) DEFAULT '' NOT NULL, 
	FULL_COLOR_DESCRIPTION VARCHAR(100) DEFAULT '' NOT NULL, 
	CN_MSRP DOUBLE DEFAULT 0.0 NOT NULL, 
	HK_MSRP DOUBLE DEFAULT 0.0 NOT NULL, 
	TW_MSRP DOUBLE DEFAULT 0.0 NOT NULL, 
	ATTRIBUTE_1 VARCHAR(30) DEFAULT '' NOT NULL, 
	ATTRIBUTE_2 VARCHAR(30) DEFAULT '' NOT NULL, 
	ATTRIBUTE_3 VARCHAR(30) DEFAULT '' NOT NULL, 
	BLIND_BUY VARCHAR(4) DEFAULT '' NOT NULL, 
	DMCA VARCHAR(4) DEFAULT '' NOT NULL, 
	STYLE_RANK INT UNSIGNED DEFAULT 0 NOT NULL, 
	COLOR_RANK INT UNSIGNED DEFAULT 0 NOT NULL, 
	REFERENCE_STYLE_NAME VARCHAR(30) DEFAULT '' NOT NULL, 
	STORE_COUNT INT UNSIGNED DEFAULT 0 NOT NULL, 
	NIKECOM_FLAG INT UNSIGNED DEFAULT 0 NOT NULL, 
	TMALL_FLAG INT UNSIGNED DEFAULT 0 NOT NULL, 
	HKCOM_FLAG INT UNSIGNED DEFAULT 0 NOT NULL, 
	PRIMARY KEY (ASSORT_PLAN_ID), 
	FOREIGN KEY (ASSORTMENT_IMAGE_ID) REFERENCES PT_ASSORTMENT_IMAGE_TAB (ASSORTMENT_IMAGE_ID) ON DELETE RESTRICT ON UPDATE CASCADE 
)
ENGINE = InnoDB
COMMENT = 'PT : Assortment Master Entity';

CREATE INDEX IDX_1_PT_ASSORT_PLAN_DETAIL_TAB ON PT_ASSORT_PLAN_DETAIL_TAB (REFERENCE_STYLE_NAME);
CREATE INDEX IDX_2_PT_ASSORT_PLAN_DETAIL_TAB ON PT_ASSORT_PLAN_DETAIL_TAB (DIVISION, ATTRIBUTE_1, ATTRIBUTE_3, STYLE_RANK, REFERENCE_STYLE_NAME, STYLE_NAME, CN_MSRP);
CREATE INDEX IDX_3_PT_ASSORT_PLAN_DETAIL_TAB ON PT_ASSORT_PLAN_DETAIL_TAB (DIVISION, ATTRIBUTE_1, ATTRIBUTE_3, STYLE_NAME);
