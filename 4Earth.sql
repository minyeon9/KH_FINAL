---------------- FINAL 계정 생성 ----------------
--CREATE USER FINAL IDENTIFIED BY FINAL;
--GRANT RESOURCE, CONNECT TO FINAL;

---------------- MEMBER 테이블 생성 ----------------
CREATE TABLE MEMBER (
    NO NUMBER CONSTRAINT MEMBER_NO_PK PRIMARY KEY,
    ID VARCHAR2(30) CONSTRAINT MEMBER_ID_UQ UNIQUE,
    PASSWORD VARCHAR2(100),
    NAME VARCHAR2(100),
    EMAIL VARCHAR2(300),
    PHONE VARCHAR2(20),
    ADDRESS VARCHAR2(300),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
    MEMBER_TYPE VARCHAR2(50) DEFAULT 'USER',
    PLATFORM_TYPE VARCHAR2(100) DEFAULT 'HOMEPAGE' CONSTRAINT MEMBER_PLATFORM_TYPE_NN NOT NULL,
    IMG_NAME VARCHAR2(300),
    MODIFY_IMG_NAME VARCHAR2(300),
    ENROLL_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE
);

-- MEMBER 테이블 코멘트 입력
COMMENT ON COLUMN MEMBER.NO IS '회원번호';
COMMENT ON COLUMN MEMBER.ID IS '회원ID';
COMMENT ON COLUMN MEMBER.PASSWORD IS '회원PW';
COMMENT ON COLUMN MEMBER.MEMBER_TYPE IS '회원타입';
COMMENT ON COLUMN MEMBER.NAME IS '회원명';
COMMENT ON COLUMN MEMBER.PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.ADDRESS IS '주소';
COMMENT ON COLUMN MEMBER.PLATFORM_TYPE IS '플랫폼';
COMMENT ON COLUMN MEMBER.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN MEMBER.IMG_NAME IS '프로필사진';   
COMMENT ON COLUMN MEMBER.MODIFY_IMG_NAME IS '프로필사진(수정)';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '회원가입일';   
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS '정보수정일';

-- MEMBER 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_UNO;

-- MEMBER 테이블 데이터 입력
INSERT INTO MEMBER (
    NO, 
    ID, 
    PASSWORD, 
    MEMBER_TYPE,
    NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    PLATFORM_TYPE, 
    STATUS, 
    IMG_NAME, 
    MODIFY_IMG_NAME, 
    ENROLL_DATE, 
    MODIFY_DATE
) VALUES(
    SEQ_UNO.NEXTVAL, 
    'admin1', 
    '1234', 
    'ADMIN', 
    '관리자1', 
    '01011111111', 
    'admin1@4earth.co.kr', 
    '서울시 강남구 역삼동',
    DEFAULT,
    DEFAULT,
    NULL,
    NULL,
    DEFAULT,
    DEFAULT
);

INSERT INTO MEMBER (
    NO, 
    ID, 
    PASSWORD, 
    MEMBER_TYPE,
    NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    PLATFORM_TYPE, 
    STATUS, 
    IMG_NAME, 
    MODIFY_IMG_NAME, 
    ENROLL_DATE, 
    MODIFY_DATE
) VALUES(
    SEQ_UNO.NEXTVAL, 
    'potatoking', 
    '1234', 
    DEFAULT, 
    '감자킹', 
    '01000000000', 
    'potatoking@naver.com', 
    '경기도 용인시 기흥구',
    DEFAULT,
    DEFAULT,
    NULL,
    NULL,
    DEFAULT,
    DEFAULT
);

COMMIT;  

-- MEMBER 테이블 삭제문
--DROP TABLE MEMBER;
--DROP SEQUENCE SEQ_UNO;

-- MEMBER 테이블 select문
SELECT NO, 
    ID, 
    PASSWORD, 
    MEMBER_TYPE,
    NAME, 
    PHONE, 
    EMAIL, 
    ADDRESS, 
    PLATFORM_TYPE, 
    STATUS, 
    IMG_NAME, 
    MODIFY_IMG_NAME, 
    ENROLL_DATE, 
    MODIFY_DATE
FROM MEMBER;
--WHERE ID='admin1' AND STATUS = 'Y';
--WHERE STATUS = 'Y';

SELECT COUNT(*) FROM MEMBER;
--------------------------------------------------------


--------------------------------------------------------
------------------------ 에코샵 ------------------------
--------------------------------------------------------

------------------------
---- 상품 관련 테이블 ----
------------------------
-- 상품 상태 테이블
CREATE TABLE PRODUCT_STATUS (
    S_NO NUMBER(3) CONSTRAINT S_NO_PK PRIMARY KEY,
    S_NAME VARCHAR2(20) CONSTRAINT S_NAME_NN NOT NULL
);

COMMENT ON COLUMN PRODUCT_STATUS.S_NO IS '상태번호';
COMMENT ON COLUMN PRODUCT_STATUS.S_NAME IS '상태명';

-- 카테고리 테이블
CREATE TABLE PRODUCT_CATEGORY (
    C_NO NUMBER(5) CONSTRAINT C_NO_PK PRIMARY KEY,
    C_NAME VARCHAR2(20) CONSTRAINT C_NAME_NN NOT NULL
);

COMMENT ON COLUMN PRODUCT_CATEGORY.C_NO IS '카테고리번호';
COMMENT ON COLUMN PRODUCT_CATEGORY.C_NAME IS '카테고리명';

-- 상품 테이블
CREATE TABLE PRODUCT (
    PRO_NO NUMBER CONSTRAINT PRO_NO_PK PRIMARY KEY,
    PRO_NAME VARCHAR2(40) CONSTRAINT PRO_NAME_NN NOT NULL,
    PRO_PRICE NUMBER CONSTRAINT PRO_PRICE_NN NOT NULL,
    PRO_MODIFY_DATE DATE DEFAULT SYSDATE,
    PRO_VOL VARCHAR2(20),
    PRO_IMG VARCHAR2(400),
    PRO_INFO VARCHAR2(4000),
    PRO_STAT NUMBER CONSTRAINT PRO_STAT_FK REFERENCES PRODUCT_STATUS,
    PRO_CAT NUMBER CONSTRAINT PRO_CAT_FK REFERENCES PRODUCT_CATEGORY,
    PRO_SOLD NUMBER(20),
    PRO_DATE DATE DEFAULT SYSDATE,
    PRO_MFG VARCHAR2(40) CONSTRAINT PRO_MFG_NN NOT NULL,
    PRO_RATING NUMBER(3)
);

COMMENT ON COLUMN PRODUCT.PRO_NO IS '상품번호';
COMMENT ON COLUMN PRODUCT.PRO_NAME IS '상품명';
COMMENT ON COLUMN PRODUCT.PRO_PRICE IS '가격';
COMMENT ON COLUMN PRODUCT.PRO_MODIFY_DATE IS '상태수정일';
COMMENT ON COLUMN PRODUCT.PRO_VOL IS '용량';
COMMENT ON COLUMN PRODUCT.PRO_IMG IS '상품사진';
COMMENT ON COLUMN PRODUCT.PRO_INFO IS '상품정보';
COMMENT ON COLUMN PRODUCT.PRO_STAT IS '상품상태번호';
COMMENT ON COLUMN PRODUCT.PRO_CAT IS '상품카테고리번호';
COMMENT ON COLUMN PRODUCT.PRO_SOLD IS '판매량';
COMMENT ON COLUMN PRODUCT.PRO_DATE IS '등록일';
COMMENT ON COLUMN PRODUCT.PRO_MFG IS '제조사';
COMMENT ON COLUMN PRODUCT.PRO_RATING IS '별점';

CREATE SEQUENCE SEQ_PRONO;

-- 상품 옵션 테이블
CREATE TABLE PRODUCT_OPT (
    PRO_NO NUMBER CONSTRAINT PRODUCT_OPT_PRO_NO_FK REFERENCES PRODUCT(PRO_NO),
    O_NO NUMBER(3),
    O_NAME VARCHAR2(40),
    
    CONSTRAINT PRODUCT_OPT_PK PRIMARY KEY(PRO_NO, O_NO)
);

COMMENT ON COLUMN PRODUCT_OPT.PRO_NO IS '상품번호';
COMMENT ON COLUMN PRODUCT_OPT.O_NO IS '옵션번호';
COMMENT ON COLUMN PRODUCT_OPT.O_NAME IS '옵션명';

-- 상품 문의 테이블
CREATE TABLE PRODUCT_INQUIRY (
   PRO_NO NUMBER CONSTRAINT PRO_INQ_PRO_NO_FK REFERENCES PRODUCT(PRO_NO),
   MEMBER_NO NUMBER CONSTRAINT PRO_INQ_MEMBER_NO_FK REFERENCES MEMBER(NO),
   INQ_NO NUMBER,
   INQ_DATE DATE DEFAULT SYSDATE,
   INQ_MOD_DATE DATE DEFAULT SYSDATE,
   INQ_TITLE VARCHAR2(100) CONSTRAINT PRO_INQ_TIT_NN NOT NULL,
   INQ_CONTENT VARCHAR2(4000) CONSTRAINT PRO_INQ_CTT_NN NOT NULL,
   INQ_STAT VARCHAR2(2) CHECK(INQ_STAT IN('Y', 'N')),
   
   CONSTRAINT PRO_INQ_PK PRIMARY KEY(PRO_NO, MEMBER_NO, INQ_NO)
);

COMMENT ON COLUMN PRODUCT_INQUIRY.PRO_NO IS '상품번호';
COMMENT ON COLUMN PRODUCT_INQUIRY.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN PRODUCT_INQUIRY.INQ_NO IS '문의번호';
COMMENT ON COLUMN PRODUCT_INQUIRY.INQ_DATE IS '작성일';
COMMENT ON COLUMN PRODUCT_INQUIRY.INQ_MOD_DATE IS '수정일';
COMMENT ON COLUMN PRODUCT_INQUIRY.INQ_TITLE IS '문의제목';
COMMENT ON COLUMN PRODUCT_INQUIRY.INQ_CONTENT IS '문의내용';
COMMENT ON COLUMN PRODUCT_INQUIRY.INQ_STAT IS '답변상태';

CREATE SEQUENCE SEQ_INQNO;

-- 상품 문의 답변 테이블
CREATE TABLE PRO_INQ_ANSWER (
    PRO_NO NUMBER,
    MEMBER_NO NUMBER,
    INQ_NO NUMBER,
    INQ_ANS VARCHAR2(4000) CONSTRAINT PRO_INQ_ANS_NN NOT NULL,
    INQ_ANS_DATE DATE DEFAULT SYSDATE,
    
    FOREIGN KEY(PRO_NO, MEMBER_NO, INQ_NO) REFERENCES PRODUCT_INQUIRY,
    CONSTRAINT PRO_INQ_ANS_PK PRIMARY KEY(PRO_NO, MEMBER_NO, INQ_NO)
);

COMMENT ON COLUMN PRO_INQ_ANSWER.PRO_NO IS '상품번호';
COMMENT ON COLUMN PRO_INQ_ANSWER.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN PRO_INQ_ANSWER.INQ_NO IS '문의번호';
COMMENT ON COLUMN PRO_INQ_ANSWER.INQ_ANS IS '답변내용';
COMMENT ON COLUMN PRO_INQ_ANSWER.INQ_ANS_DATE IS '답변작성일';

COMMIT;

------------------------
--- 찜 & 장바구니 테이블 ---
------------------------
-- 찜 테이블
CREATE TABLE WISH (
    PRO_NO NUMBER CONSTRAINT WISH_PRO_NO_FK REFERENCES PRODUCT(PRO_NO),
    WISH_STAT VARCHAR2(2) CHECK(WISH_STAT IN('Y', 'N')),
    MEMBER_NO NUMBER CONSTRAINT WISH_MEMBER_NO_FK REFERENCES MEMBER(NO),
    WISH_DATE DATE DEFAULT SYSDATE,    
    
    CONSTRAINT WISH_PK PRIMARY KEY(MEMBER_NO, PRO_NO)
);

COMMENT ON COLUMN WISH.PRO_NO IS '상품번호';
COMMENT ON COLUMN WISH.WISH_STAT IS '찜 상태';
COMMENT ON COLUMN WISH.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN WISH.WISH_DATE IS '찜 수정일';

-- 장바구니 테이블
CREATE TABLE CART (
    MEMBER_NO NUMBER CONSTRAINT CART_MEMBER_NO_FK REFERENCES MEMBER(NO),
    PRO_NO NUMBER,
    PRO_OPT NUMBER,
    CART_QTY NUMBER(4),
    CART_STAT VARCHAR2(2) CHECK(CART_STAT IN('Y', 'N')),
    CART_DATE DATE DEFAULT SYSDATE,
    
    FOREIGN KEY(PRO_NO, PRO_OPT) REFERENCES PRODUCT_OPT,
    CONSTRAINT CART_PK PRIMARY KEY(MEMBER_NO, PRO_NO, PRO_OPT)
);

COMMENT ON COLUMN CART.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN CART.PRO_NO IS '상품 번호';
COMMENT ON COLUMN CART.PRO_OPT IS '상품 옵션 번호';
COMMENT ON COLUMN CART.CART_QTY IS '상품수량';
COMMENT ON COLUMN CART.CART_STAT IS '장바구니 상태';
COMMENT ON COLUMN CART.CART_DATE IS '장바구니 수정일';

COMMIT;

------------------------
---- 모집 관련 테이블 ----
------------------------
-- 상품 등록 신청 테이블
CREATE TABLE APPLICATION (
    APP_NO NUMBER CONSTRAINT APPLICATION_NO_PK PRIMARY KEY,
    MEMBER_NO NUMBER CONSTRAINT APP_MEMBER_NO_FK REFERENCES MEMBER(NO),    
    APP_NAME VARCHAR2(100),
    APP_URL VARCHAR2(200),
    APP_TITLE VARCHAR2(100) CONSTRAINT APP_TITLE_NN NOT NULL,
    APP_CONTENT VARCHAR2(4000),
    APP_S_NO NUMBER CONSTRAINT APP_S_NO_FK REFERENCES PRODUCT_STATUS(S_NO),
    APP_C_NO NUMBER CONSTRAINT APP_C_NO_FK REFERENCES PRODUCT_CATEGORY(C_NO),
    APP_DATE DATE DEFAULT SYSDATE    
);

COMMENT ON COLUMN APPLICATION.APP_NO IS '신청번호';
COMMENT ON COLUMN APPLICATION.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN APPLICATION.APP_NAME IS '상품이름';
COMMENT ON COLUMN APPLICATION.APP_URL IS '상품링크';
COMMENT ON COLUMN APPLICATION.APP_TITLE IS '제목';
COMMENT ON COLUMN APPLICATION.APP_CONTENT IS '내용';
COMMENT ON COLUMN APPLICATION.APP_S_NO IS '상품상태번호';
COMMENT ON COLUMN APPLICATION.APP_C_NO IS '상품카테고리번호';
COMMENT ON COLUMN APPLICATION.APP_DATE IS '작성일';

CREATE SEQUENCE SEQ_APPNO;

-- 모집중인 상품 테이블
CREATE TABLE PRODUCT_BIDDING (
    BID_NO NUMBER CONSTRAINT PRO_BID_NO_PK PRIMARY KEY,
    BID_NAME VARCHAR2(50) CONSTRAINT PRO_BID_NAME_NN NOT NULL,
    BID_COND NUMBER CONSTRAINT PRO_BID_CONT_NN NOT NULL,
    BID_CURR NUMBER,
    BID_S_NO NUMBER CONSTRAINT PRO_BID_S_NO_FK REFERENCES PRODUCT_STATUS(S_NO)
);

COMMENT ON COLUMN PRODUCT_BIDDING.BID_NO IS '모집번호';
COMMENT ON COLUMN PRODUCT_BIDDING.BID_NAME IS '상품이름';
COMMENT ON COLUMN PRODUCT_BIDDING.BID_COND IS '필요인원';
COMMENT ON COLUMN PRODUCT_BIDDING.BID_CURR IS '현재인원';
COMMENT ON COLUMN PRODUCT_BIDDING.BID_S_NO IS '상품상태번호';

CREATE SEQUENCE SEQ_BIDNO;

-- 모집 참여 테이블
CREATE TABLE BIDDING (
    BID_NO NUMBER CONSTRAINT BID_NO_FK REFERENCES PRODUCT_BIDDING(BID_NO),
    BID_MEMBER_NO NUMBER CONSTRAINT BID_MEM_NO_FK REFERENCES MEMBER(NO),
    BID_STAT VARCHAR2(2) CHECK(BID_STAT IN('Y', 'N')),
    
    CONSTRAINT BID_PK PRIMARY KEY(BID_NO, BID_MEMBER_NO)
);

COMMENT ON COLUMN BIDDING.BID_NO IS '모집번호';
COMMENT ON COLUMN BIDDING.BID_MEMBER_NO IS '회원번호';
COMMENT ON COLUMN BIDDING.BID_STAT IS '참여상태';

COMMIT;






