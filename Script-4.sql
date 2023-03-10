

-- 회원가입
-- 이름, ID, PASSWORD, 전화 번호, 이메일, 나이

-- 1. Column 레벨 방식
CREATE TABLE MEMBER (
	ID VARCHAR2(50) CONSTRAINT MEMBER_ID_PK PRIMARY KEY,
	PW VARCHAR2(50) CONSTRAINT MEMBER_PW_NN NOT NULL,
	NAME VARCHAR2(50),
	PHONE VARCHAR2(50) CONSTRAINT MEMBER_PHONE_U UNIQUE,
	EMAIL VARCHAR2(100) CONSTRAINT MEMBER_EMAIL_U UNIQUE,
	AGE NUMBER(3) CHECK (AGE BETWEEN 0 AND 150)
);

-- 2. TABLE 레벨 방식
CREATE TABLE MEMBER (
	ID VARCHAR2(50),
	PW VARCHAR2(50),
	NAME VARCHAR2(50),
	PHONE VARCHAR2(50),
	EMAIL VARCHAR2(100),
	AGE NUMBER(3),
	CONSTRAINT MEMBER_ID_PK PRIMARY KEY (ID), 
	CONSTRAINT MEMBER_PHONE_U UNIQUE (PHONE)
);

SELECT * FROM MEMBER;
SELECT * FROM USERS;

INSERT INTO MEMBER (ID, PW, NAME, PHONE, EMAIL)
VALUES ('w1', 'test1', 'test', '010-1234-5678', 'test@gmail.com');

INSERT INTO MEMBER (ID, PW, NAME, PHONE, EMAIL, AGE)
VALUES ('test2', 'test', 'test', '010-1234-5679', NULL, 20);

INSERT INTO MEMBER (ID, PW, NAME, PHONE, EMAIL, AGE)
VALUES ('test3', 'test', 'test', '010-1111-1111', NULL, 20);



-- 3. 

CREATE TABLE BOARD (
	NUM NUMBER CONSTRAINT BOARD_NUM_PK PRIMARY KEY,
	TITLE VARCHAR2(200),
	CONTENTS CLOB,
	WRITER VARCHAR2(50), --CONSTRAINT BOARD_W_FK REFERENCES MEMBER (ID),
	REGDATE DATE,
	HIT NUMBER
	-- CONSTRAINT BOARD_W_FK FOREIGN KEY (WRITER) REFERENCES MEMBER (ID) ON DELETE SET NULL -- ON DELETE CASCADE
);

ALTER TABLE "BOARD" ADD CONSTRAINT BOARD_W_FK FOREIGN KEY (WRITER) REFERENCES MEMBER (ID) ON DELETE SET NULL;

SELECT * FROM BOARD;

INSERT INTO BOARD
VALUES(1, 't1', 'c1', 'w1', SYSDATE, 0);

DELETE MEMBER WHERE ID = 'w1';
DELETE BOARD WHERE NUM = 1;



INSERT INTO ADDRESS
VALUES  (1, 'a', '010-1234-5678', 'a@gmail.com');

SELECT * FROM ADDRESS;


DROP TABLE USERS;
DROP TABLE MEMBER;
DROP TABLE BOARD;
DROP TABLE ADDRESS;

TRUNCATE TABLE MEMBER;
DELETE MEMBER;

SELECT * FROM RECYCLEBIN;

PURGE RECYCLEBIN;

FLASHBACK TABLE MEMBER TO BEFORE DROP;

SELECT * FROM USER_CONSTRAINTS;

----------------------------

ALTER TABLE "MEMBER" ADD (BIRTH DATE);
ALTER TABLE "MEMBER" DROP COLUMN BIRTH;
ALTER TABLE "MEMBER" RENAME COLUMN ID TO USERNAME;

UPDATE "MEMBER" SET PHONE = NULL;
ALTER TABLE "MEMBER" MODIFY (PHONE NUMBER);

ALTER TABLE "MEMBER" DROP CONSTRAINT MEMBER_PHONE_U;
ALTER TABLE "MEMBER" ADD CONSTRAINT MEMBER_PHONE_U UNIQUE (PHONE);

RENAME MEMBER TO USERS;


CREATE SEQUENCE BOARD_SEQ
START WITH 1
INCREMENT BH 1
NOMAXVALUE
NOMAXVALUE
NOCYCLE
NOCACHE

SELECT BOARD_SEQ.CURRVALF FORM DUAL;
