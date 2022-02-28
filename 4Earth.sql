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
    PRO_RATING NUMBER(3, 1)
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

ALTER TABLE PRODUCT MODIFY PRO_RATING NUMBER(3,1);

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

-- 상품 상태 데이터
INSERT INTO PRODUCT_STATUS VALUES (1, '모집중');
INSERT INTO PRODUCT_STATUS VALUES (2, '모집성공');
INSERT INTO PRODUCT_STATUS VALUES (3, '판매중');
INSERT INTO PRODUCT_STATUS VALUES (4, '일시품절');

-- 상품 카테고리 데이터
INSERT INTO PRODUCT_CATEGORY VALUES (0101, '간편식');
INSERT INTO PRODUCT_CATEGORY VALUES (0102, '디저트/간식');
INSERT INTO PRODUCT_CATEGORY VALUES (0103, '건조식품');
INSERT INTO PRODUCT_CATEGORY VALUES (0201, '세탁');
INSERT INTO PRODUCT_CATEGORY VALUES (0202, '주방');
INSERT INTO PRODUCT_CATEGORY VALUES (0203, '욕실');
INSERT INTO PRODUCT_CATEGORY VALUES (0301, '바디케어');
INSERT INTO PRODUCT_CATEGORY VALUES (0302, '기초화장품');
INSERT INTO PRODUCT_CATEGORY VALUES (0303, '메이크업');
INSERT INTO PRODUCT_CATEGORY VALUES (0304, '헤어케어');
INSERT INTO PRODUCT_CATEGORY VALUES (0401, '강아지');
INSERT INTO PRODUCT_CATEGORY VALUES (0402, '고양이');

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

------------------------
---- 주문 관련 테이블 ----
------------------------
-- 결제수단 테이블
CREATE TABLE PAYMENT_METHOD (
    PM_NO NUMBER CONSTRAINT PM_NO_PK PRIMARY KEY,
    PM_NAME VARCHAR2(30)
);

COMMENT ON COLUMN PAYMENT_METHOD.PM_NO IS '결제수단번호';
COMMENT ON COLUMN PAYMENT_METHOD.PM_NAME IS '결제수단명';

-- 주문 테이블
CREATE TABLE ORDER_SUM (
    ORDER_NO NUMBER CONSTRAINT O_NO_PK PRIMARY KEY,
    MEMBER_NO NUMBER CONSTRAINT O_MEMBER_NO_FK REFERENCES MEMBER(NO),
    ORDER_PRICE NUMBER CONSTRAINT O_PRICE_NN NOT NULL,
    ORDER_STAT VARCHAR2(20) DEFAULT '결제완료',
    ORDER_DATE DATE DEFAULT SYSDATE,
    ORDER_METHOD NUMBER CONSTRAINT O_MTD_NN NOT NULL,
    ORDER_PM VARCHAR2(20),
    ORDER_POINT NUMBER DEFAULT 0,
    
    CONSTRAINT O_MTD_FK FOREIGN KEY(ORDER_METHOD) REFERENCES PAYMENT_METHOD(PM_NO)
);

COMMENT ON COLUMN ORDER_SUM.ORDER_NO IS '주문번호';
COMMENT ON COLUMN ORDER_SUM.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN ORDER_SUM.ORDER_PRICE IS '총 주문금액';
COMMENT ON COLUMN ORDER_SUM.ORDER_STAT IS '주문상태';
COMMENT ON COLUMN ORDER_SUM.ORDER_DATE IS '주문일';
COMMENT ON COLUMN ORDER_SUM.ORDER_METHOD IS '결제수단';
COMMENT ON COLUMN ORDER_SUM.ORDER_PM IS '결제상태';
COMMENT ON COLUMN ORDER_SUM.ORDER_POINT IS '포인트사용';

CREATE SEQUENCE SEQ_ORDERNO;

-- 주문상세 테이블
CREATE TABLE ORDER_DETAIL (
    ORDER_NO NUMBER CONSTRAINT OD_NO_FK REFERENCES ORDER_SUM(ORDER_NO),
    MEMBER_NO NUMBER CONSTRAINT OD_MEMBER_NO_FK REFERENCES MEMBER(NO),
    DETAIL_PRO_NO NUMBER,
    DETAIL_OPT NUMBER,
    DETAIL_QTY NUMBER,
    DETAIL_PRICE NUMBER CONSTRAINT OD_PRICE_NN NOT NULL,
    
    FOREIGN KEY(DETAIL_PRO_NO, DETAIL_OPT) REFERENCES PRODUCT_OPT,
    CONSTRAINT OD_PK PRIMARY KEY(ORDER_NO, DETAIL_PRO_NO, DETAIL_OPT)
);

COMMENT ON COLUMN ORDER_DETAIL.ORDER_NO IS '주문번호';
COMMENT ON COLUMN ORDER_DETAIL.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_PRO_NO IS '상품번호';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_OPT IS '상품옵션';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_QTY IS '주문수량';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_PRICE IS '가격';

-- 배송 테이블
CREATE TABLE DELIVERY (
    ORDER_NO NUMBER CONSTRAINT DEL_O_NO_FK REFERENCES ORDER_SUM(ORDER_NO),
    MEMBER_NO NUMBER CONSTRAINT DEL_MEMBER_NO_FK REFERENCES MEMBER(NO),
    DEL_STAT VARCHAR2(30) DEFAULT '상품준비중',
    DEL_NAME VARCHAR2(20) CONSTRAINT DEL_NAME_NN NOT NULL,
    DEL_ADD VARCHAR2(200) CONSTRAINT DEL_ADD_NN NOT NULL,
    DEL_PHONE VARCHAR2(100) CONSTRAINT DEL_PHONE_NN NOT NULL,
    DEL_MSG VARCHAR2(200),
    DEL_CO VARCHAR2(50),
    DEL_IV NUMBER,
    
    CONSTRAINT DEL_PK PRIMARY KEY(ORDER_NO, MEMBER_NO)
);

COMMENT ON COLUMN DELIVERY.ORDER_NO IS '주문번호';
COMMENT ON COLUMN DELIVERY.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN DELIVERY.DEL_STAT IS '배송상태';
COMMENT ON COLUMN DELIVERY.DEL_NAME IS '수령인';
COMMENT ON COLUMN DELIVERY.DEL_ADD IS '배송주소';
COMMENT ON COLUMN DELIVERY.DEL_PHONE IS '수령인 전화번호';
COMMENT ON COLUMN DELIVERY.DEL_MSG IS '배송 요청사항';
COMMENT ON COLUMN DELIVERY.DEL_CO IS '택배사';
COMMENT ON COLUMN DELIVERY.DEL_IV IS '송장번호';

-- 구매후기 테이블
CREATE TABLE REVIEW (
    ORDER_NO NUMBER CONSTRAINT REV_O_NO_FK REFERENCES ORDER_SUM(ORDER_NO),
    MEMBER_NO NUMBER CONSTRAINT REV_MEMBER_NO_FK REFERENCES MEMBER(NO),
    PRO_NO NUMBER,
    PRO_OPT NUMBER,
    REV_DATE DATE DEFAULT SYSDATE,
    REV_CONTENT VARCHAR2(4000) CONSTRAINT REV_CT_NN NOT NULL,
    REV_RATING NUMBER(3,1),
    
    FOREIGN KEY(PRO_NO, PRO_OPT) REFERENCES PRODUCT_OPT,
    CONSTRAINT REV_PK PRIMARY KEY(ORDER_NO, PRO_NO, PRO_OPT)
);

COMMENT ON COLUMN REVIEW.ORDER_NO IS '주문번호';
COMMENT ON COLUMN REVIEW.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN REVIEW.PRO_NO IS '상품번호';
COMMENT ON COLUMN REVIEW.PRO_OPT IS '구매옵션';
COMMENT ON COLUMN REVIEW.REV_DATE IS '작성일';
COMMENT ON COLUMN REVIEW.REV_CONTENT IS '내용';
COMMENT ON COLUMN REVIEW.REV_RATING IS '별점';

ALTER TABLE REVIEW MODIFY REV_RATING NUMBER(3,1);

COMMIT;


-- 스토어 테스트용 더미 데이터
BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO PRODUCT VALUES(SEQ_PRONO.NEXTVAL, '상품명' || SEQ_PRONO.CURRVAL, 3000, DEFAULT, '500g', '썸네일사진', '상품설명', 3, 0101, 20, DEFAULT, '4Earth 식품', 4.5);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO PRODUCT VALUES(SEQ_PRONO.NEXTVAL, '상품명' || SEQ_PRONO.CURRVAL, 10000, DEFAULT, '500g', '썸네일사진', '상품설명', 3, 0101, 20, DEFAULT, '4Earth 식품', 3);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

BEGIN
    FOR N IN 1..5
    LOOP
        INSERT INTO PRODUCT VALUES(SEQ_PRONO.NEXTVAL, '상품명' || SEQ_PRONO.CURRVAL, 3000, DEFAULT, '500g', '썸네일사진', '상품설명', 3, 0101, 20, '22/01/25', '4Earth 식품', 4.5);
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/











-- 챌린지 더미 데이터
---------------------------------------------------------------------------------------------------------------
-- 챌린지 테이블 생성
CREATE TABLE CHALLENGE (
    CHAL_NO NUMBER PRIMARY KEY,
    CHAL_CATEGORY VARCHAR2(50)
);

-- 챌린지 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_CHLG;

-- 챌린지 테이블 INSERT
INSERT INTO CHALLENGE (CHAL_NO, CHAL_CATEGORY) VALUES (SEQ_CHLG.NEXTVAL, '오늘의 챌린지');
INSERT INTO CHALLENGE (CHAL_NO, CHAL_CATEGORY) VALUES (SEQ_CHLG.NEXTVAL, '이달의 챌린지');

-- 챌린지 테이블 삭제
DROP SEQUENCE SEQ_CHLG;
DROP TABLE CHALLENGE;

---------------------------------------------------------------------------------------------------------------

-- 오늘의 챌린지 테이블 생성
CREATE TABLE CHAL_TODAY (
    CATEGORY NUMBER,
    CHAL_NO NUMBER,
    CHAL_TITLE VARCHAR2(1000),
    CHAL_CONTENT VARCHAR2(4000),
    CHAL_IMG_PATH VARCHAR2(4000),
    CHAL_POINT NUMBER,
    CHAL_DATE DATE
);

-- 오늘의 챌린지 테이블 컬럼 설명
COMMENT ON COLUMN CHAL_TODAY.CATEGORY IS '분류(오늘/이달)';
COMMENT ON COLUMN CHAL_TODAY.CHAL_NO IS '챌린지 번호';
COMMENT ON COLUMN CHAL_TODAY.CHAL_TITLE IS '제목';
COMMENT ON COLUMN CHAL_TODAY.CHAL_CONTENT IS '내용';
COMMENT ON COLUMN CHAL_TODAY.CHAL_IMG_PATH IS '썸네일 이미지 경로';
COMMENT ON COLUMN CHAL_TODAY.CHAL_POINT IS '달성 시 지급 포인트';
COMMENT ON COLUMN CHAL_TODAY.CHAL_DATE IS '게시일';

-- 오늘의 챌린지 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_CHLG_TODAY;

-- 오늘의 챌린지 테이블 INSERT
INSERT INTO CHAL_TODAY (CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, CHAL_IMG_PATH, CHAL_POINT, CHAL_DATE)
    VALUES (1, SEQ_CHLG_TODAY.NEXTVAL, '걸어서 or 자전거로 출퇴근 하기', '대기오염물질을 발생시키는 차량 운행을 줄이고 걸어서 출퇴근 하거나 자전거로 출퇴근하여 하루를 시작해보세요. 출퇴근이 아니더라도 가까운 거리는 두 발로 이동하는 습관을 가져보는 건 어떨까요?', '/resources/images/challenge', 5000, SYSDATE);
INSERT INTO CHAL_TODAY (CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, CHAL_IMG_PATH, CHAL_POINT, CHAL_DATE)
    VALUES (1, SEQ_CHLG_TODAY.NEXTVAL, '하루 한 끼 채식하기', '한 사람당 1주일에 하루만 채식을 해도 1년에 나무 15그루를 심는 효과가 있다고 합니다. 채식으로 몸을 가볍게 하고  육류를 생산하는 과정에서 배출되는 탄소를 조금이라도 줄일 수 있는 효과가 있습니다.', '/resources/images/challenge', 5000, SYSDATE);
INSERT INTO CHAL_TODAY (CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, CHAL_IMG_PATH, CHAL_POINT, CHAL_DATE)
    VALUES (1, SEQ_CHLG_TODAY.NEXTVAL, '텀블러 사용하기', '일회용 플라스틱 사용을 자제하고 다회 사용 가능한 텀블러를 사용해보세요. 플라스틱은 바다에서 분해되어 미세 플라스틱이 되면 해양생물의 생명을 위협하게 됩니다.', '/resources/images/challenge', 5000, SYSDATE);
INSERT INTO CHAL_TODAY (CATEGORY, CHAL_NO, CHAL_TITLE, CHAL_CONTENT, CHAL_IMG_PATH, CHAL_POINT, CHAL_DATE)
    VALUES (1, SEQ_CHLG_TODAY.NEXTVAL, '메일함 비우기', '메일을 보관하는 데이터 센터는 24시간 가동되어야 하기 때문에 엄청난 전기가 필요합니다. 메일 한 통은 4g의 이산화탄소를 배출한다고 합니다. 메일함 1GB를 비우면 14.9kg의 이산화탄소 배출을 감축할 수 있습니다.', '/resources/images/challenge', 5000, SYSDATE);

-- 오늘의 챌린지 테이블 삭제
DROP SEQUENCE SEQ_CHLG_TODAY;
DROP TABLE CHAL_TODAY;

-- 오늘의 챌린지 목록 조회
SELECT * FROM CHAL_TODAY;

SELECT
    CATEGORY,
    CHAL_NO,
    CHAL_TITLE,
    CHAL_CONTENT,
    CHAL_IMG_PATH,
    TO_CHAR(CHAL_POINT, 'FM999,999'),
    CHAL_DATE
FROM CHAL_TODAY;

---------------------------------------------------------------------------------------------------------------

-- 오늘의 챌린지 참여 회원 테이블 생성
CREATE TABLE CHAL_TODAY_MEM (
    MEM_NO NUMBER,
    CHAL_NO NUMBER,
    CHAL_DATE DATE,
    CHAL_STATUS CHAR,
    ORIGINAL_FILENAME VARCHAR2(1000),
    RENAMED_FILENAME VARCHAR2(4000),
    CHAL_POINT NUMBER,
    CHAL_POINT_STATUS CHAR
);

-- 오늘의 챌린지 참여 회원 테이블 컬럼 설명
COMMENT ON COLUMN CHAL_TODAY_MEM.MEM_NO IS '회원 번호';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_NO IS '챌린지 번호';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_DATE IS '달성일';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_STATUS IS '달성 상태';
COMMENT ON COLUMN CHAL_TODAY_MEM.ORIGINAL_FILENAME IS '원본 파일명';
COMMENT ON COLUMN CHAL_TODAY_MEM.RENAMED_FILENAME IS '수정 파일명';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_POINT IS '지급 포인트';
COMMENT ON COLUMN CHAL_TODAY_MEM.CHAL_POINT_STATUS IS '포인트 지급 상태';

-- 오늘의 챌린지 참여 회원 테이블 INSERT
INSERT INTO CHAL_TODAY_MEM (MEM_NO, CHAL_NO, CHAL_DATE, CHAL_STATUS, ORIGINAL_FILENAME, RENAMED_FILENAME, CHAL_POINT, CHAL_POINT_STATUS)
    VALUES (1, 1, SYSDATE, 'Y', '', '', '5000', 'N');

-- 오늘의 챌린지 참여 회원 테이블 삭제
DROP TABLE CHAL_TODAY_MEM;

-- 오늘의 챌린지 참여 회원 목록 조회
SELECT * FROM CHAL_TODAY_MEM;


COMMIT;













--------------------------------------------------------


--------------------------------------------------------
------------------------ 신고 테이블------------------------
--------------------------------------------------------


CREATE TABLE REPORT (
    REPORT_NO NUMBER CONSTRAINT REPORT_NO_PK PRIMARY KEY,
    REPORT_M_NO NUMBER CONSTRAINT REPORT_M_NO_FK REFERENCES MEMBER(NO),
    REPORTED_M_NO NUMBER CONSTRAINT REPORTED_M_NO_FK REFERENCES MEMBER(NO),
    REPORT_DATE DATE DEFAULT SYSDATE,
    REPORT_TITLE VARCHAR2(100),
    REPORT_CONTENT VARCHAR2(500),
    REPORT_CATEGORY VARCHAR2(10) DEFAULT '0' CHECK(REPORT_CATEGORY IN('0', '1', '2', '3', '4', '5', '6', '7', '8', '9')),
    REPORT_STATUS VARCHAR2(10) DEFAULT 'Y' CHECK(REPORT_STATUS IN('Y', 'N'))
);

-- MEMBER 테이블 코멘트 입력
COMMENT ON COLUMN REPORT.REPORT_NO IS '신고번호';
COMMENT ON COLUMN REPORT.REPORT_M_NO IS '신고한 회원 번호';
COMMENT ON COLUMN REPORT.REPORTED_M_NO IS '신고받은 회원 번호';
COMMENT ON COLUMN REPORT.REPORT_DATE IS '신고일';
COMMENT ON COLUMN REPORT.REPORT_TITLE IS '신고제목';
COMMENT ON COLUMN REPORT.REPORT_CONTENT IS '신고내용';
COMMENT ON COLUMN REPORT.REPORT_CATEGORY IS '신고분류';
COMMENT ON COLUMN REPORT.REPORT_STATUS IS '신고조치';

-- MEMBER 테이블 시퀀스 생성
CREATE SEQUENCE SEQ_RNO;

INSERT INTO REPORT (
    REPORT_NO, 
    REPORT_M_NO, 
    REPORTED_M_NO, 
    REPORT_DATE,
    REPORT_TITLE, 
    REPORT_CONTENT, 
    REPORT_STATUS, 
    REPORT_CATEGORY
) VALUES(
    SEQ_RNO.NEXTVAL, 
    1, 
    2, 
    DEFAULT, 
    '신고합니다!!!', 
    '신고내용~~~~~~~~~~', 
    DEFAULT, 
    DEFAULT
);

INSERT INTO REPORT (
    REPORT_NO, 
    REPORT_M_NO, 
    REPORTED_M_NO, 
    REPORT_DATE,
    REPORT_TITLE, 
    REPORT_CONTENT, 
    REPORT_STATUS, 
    REPORT_CATEGORY
) VALUES(
    SEQ_RNO.NEXTVAL, 
    1, 
    2, 
    DEFAULT, 
    '신고합니다!!!', 
    '신고내용~~~~~~~~~~',
    DEFAULT,
    '5'
);

INSERT INTO REPORT (
    REPORT_NO, 
    REPORT_M_NO, 
    REPORTED_M_NO, 
    REPORT_DATE,
    REPORT_TITLE, 
    REPORT_CONTENT, 
    REPORT_STATUS, 
    REPORT_CATEGORY
) VALUES(
    SEQ_RNO.NEXTVAL, 
    2, 
    1, 
    DEFAULT, 
    '신고합니다!!!'33, 
    '신고내용~~~~~~~~~~33',
    DEFAULT,
    '5'
);

COMMIT;  

