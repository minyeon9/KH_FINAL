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

-- 상품 상태 데이터
INSERT INTO PRODUCT_STATUS VALUES (1, '모집중');
INSERT INTO PRODUCT_STATUS VALUES (2, '모집성공');
INSERT INTO PRODUCT_STATUS VALUES (3, '판매중');
INSERT INTO PRODUCT_STATUS VALUES (4, '일시품절');
INSERT INTO PRODUCT_STATUS VALUES (5, '판매중지');

-- 카테고리 테이블
CREATE TABLE PRODUCT_CATEGORY (
    C_NO NUMBER(5) CONSTRAINT C_NO_PK PRIMARY KEY,
    C_NAME VARCHAR2(20) CONSTRAINT C_NAME_NN NOT NULL
);

COMMENT ON COLUMN PRODUCT_CATEGORY.C_NO IS '카테고리번호';
COMMENT ON COLUMN PRODUCT_CATEGORY.C_NAME IS '카테고리명';

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
    PRO_STOCK NUMBER(20),
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
COMMENT ON COLUMN PRODUCT.PRO_STOCK IS '재고';
COMMENT ON COLUMN PRODUCT.PRO_SOLD IS '판매량';
COMMENT ON COLUMN PRODUCT.PRO_DATE IS '등록일';
COMMENT ON COLUMN PRODUCT.PRO_MFG IS '제조사';
COMMENT ON COLUMN PRODUCT.PRO_RATING IS '별점';

-- 상품번호 시퀀스 생성
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
   INQ_SECRET VARCHAR2(2) CHECK(INQ_SECRET IN('Y', 'N')),
   
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
COMMENT ON COLUMN PRODUCT_INQUIRY.INQ_STAT IS '비밀글 여부';

-- 문의번호 시퀀스 생성
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

-- 신청번호 시퀀스 생성
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
-- 주문 테이블
CREATE TABLE ORDER_SUM (
    ORDER_NO NUMBER CONSTRAINT O_NO_PK PRIMARY KEY,
    MEMBER_NO NUMBER CONSTRAINT O_MEMBER_NO_FK REFERENCES MEMBER(NO),
    ORDER_PRICE NUMBER,
    ORDER_STAT VARCHAR2(20) DEFAULT '주문생성',
    ORDER_DATE DATE DEFAULT SYSDATE,
    ORDER_METHOD NUMBER,
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

-- 주문번호 시퀀스 생성
CREATE SEQUENCE SEQ_ORDERNO;

-- 주문상세 테이블
CREATE TABLE ORDER_DETAIL (
    ORDER_NO NUMBER CONSTRAINT OD_NO_FK REFERENCES ORDER_SUM(ORDER_NO) ON DELETE CASCADE,
    MEMBER_NO NUMBER CONSTRAINT OD_MEMBER_NO_FK REFERENCES MEMBER(NO),
    DETAIL_PRO_NO NUMBER,
    DETAIL_PRO_NAME VARCHAR2(100),
    DETAIL_OPT NUMBER,
    DETAIL_OPT_NAME VARCHAR2(40),
    DETAIL_QTY NUMBER,
    DETAIL_PRICE NUMBER CONSTRAINT OD_PRICE_NN NOT NULL,
    
    FOREIGN KEY(DETAIL_PRO_NO, DETAIL_OPT) REFERENCES PRODUCT_OPT,
    CONSTRAINT OD_PK PRIMARY KEY(ORDER_NO, DETAIL_PRO_NO, DETAIL_OPT)
);

COMMENT ON COLUMN ORDER_DETAIL.ORDER_NO IS '주문번호';
COMMENT ON COLUMN ORDER_DETAIL.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_PRO_NO IS '상품번호';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_PRO_NAME IS '상품이름';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_OPT IS '옵션번호';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_OPT_NAME IS '옵션이름';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_QTY IS '주문수량';
COMMENT ON COLUMN ORDER_DETAIL.DETAIL_PRICE IS '가격';

-- 배송 테이블
CREATE TABLE DELIVERY (
    ORDER_NO NUMBER CONSTRAINT DEL_O_NO_FK REFERENCES ORDER_SUM(ORDER_NO),
    MEMBER_NO NUMBER CONSTRAINT DEL_MEMBER_NO_FK REFERENCES MEMBER(NO),
    DEL_STAT VARCHAR2(30) DEFAULT '상품준비중',
    DEL_NAME VARCHAR2(20) CONSTRAINT DEL_NAME_NN NOT NULL,
    DEL_POSTCODE VARCHAR2(20),
    DEL_ADD VARCHAR2(200) CONSTRAINT DEL_ADD_NN NOT NULL,
    DEL_EXTRA_ADD VARCHAR2(100),
    DEL_DETAIL_ADD VARCHAR2(100),
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
COMMENT ON COLUMN DELIVERY.DEL_POSTCODE IS '우편번호';
COMMENT ON COLUMN DELIVERY.DEL_ADD IS '배송주소';
COMMENT ON COLUMN DELIVERY.DEL_EXTRA_ADD IS '배송주소-추가정보';
COMMENT ON COLUMN DELIVERY.DEL_DETAIL_ADD IS '배송주소-동호수';
COMMENT ON COLUMN DELIVERY.DEL_PHONE IS '수령인 전화번호';
COMMENT ON COLUMN DELIVERY.DEL_MSG IS '배송 요청사항';
COMMENT ON COLUMN DELIVERY.DEL_CO IS '택배사';
COMMENT ON COLUMN DELIVERY.DEL_IV IS '송장번호';

-- 구매후기 테이블
CREATE TABLE REVIEW (
    ORDER_NO NUMBER CONSTRAINT REV_O_NO_FK REFERENCES ORDER_SUM(ORDER_NO),
    MEMBER_NO NUMBER CONSTRAINT REV_MEMBER_NO_FK REFERENCES MEMBER(NO),
    PRO_NO NUMBER CONSTRAINT REV_PRO_NO_FK REFERENCES PRODUCT(PRO_NO),
    PRO_OPT NUMBER,
    PRO_OPT_NAME VARCHAR2(40),
    REV_DATE DATE DEFAULT SYSDATE,
    REV_TITLE VARCHAR2(100) CONSTRAINT REV_TIT_NN NOT NULL,
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

COMMIT;

--------------------------------------------------------------------------------------------------------
-- 수정 사항 (3/14)
ALTER TABLE REVIEW ADD PRO_OPT_NAME VARCHAR2(40);
ALTER TABLE REVIEW ADD REV_TITLE VARCHAR2(100) CONSTRAINT REV_TIT_NN NOT NULL;
ALTER TABLE REVIEW ADD ORIGINAL_FILENAME VARCHAR2(1000);
ALTER TABLE REVIEW ADD RENAMED_FILENAME VARCHAR2(1000);

COMMENT ON COLUMN REVIEW.PRO_OPT_NAME IS '구매옵션이름';
COMMENT ON COLUMN REVIEW.REV_TITLE IS '리뷰제목';
COMMENT ON COLUMN REVIEW.ORIGINAL_FILENAME IS '리뷰사진원본이름';
COMMENT ON COLUMN REVIEW.RENAMED_FILENAME IS '리뷰사진수정이름';

ALTER TABLE REVIEW ADD CONSTRAINT REV_PRO_NO_FK FOREIGN KEY(PRO_NO) REFERENCES PRODUCT(PRO_NO);

ALTER TABLE PRODUCT ADD PRO_MODIFY_IMG VARCHAR2(300);
COMMENT ON COLUMN PRODUCT.PRO_MODIFY_IMG IS '상품사진';

CREATE TABLE PRODUCT_IMGS (
    PRO_NO NUMBER CONSTRAINT PRO_IMGS_PRO_NO_FK REFERENCES PRODUCT(PRO_NO),
    ORIGINAL_FILENAME VARCHAR2(100), 
    RENAMED_FILENAME VARCHAR2(100)
);

COMMENT ON COLUMN PRODUCT_IMGS.PRO_NO IS '상품번호';
COMMENT ON COLUMN PRODUCT_IMGS.ORIGINAL_FILENAME IS '상세사진원본이름';
COMMENT ON COLUMN PRODUCT_IMGS.RENAMED_FILENAME IS '상세사진수정이름';
--------------------------------------------------------------------------------------------------------
-- 수정 사항 (3/15)
ALTER TABLE PRODUCT MODIFY PRO_RATING DEFAULT 0;
ALTER TABLE PRODUCT_BIDDING ADD BID_URL VARCHAR2(200);
ALTER TABLE PRODUCT_BIDDING ADD ORIGINAL_FILENAME VARCHAR2(2000);
ALTER TABLE PRODUCT_BIDDING ADD RENAMED_FILENAME VARCHAR2(2000);
--------------------------------------------------------------------------------------------------------
-- 수정 사항 (3/19)
COMMENT ON COLUMN PRODUCT_BIDDING.BID_URL IS '상품링크';
COMMENT ON COLUMN PRODUCT_BIDDING.ORIGINAL_FILENAME IS '상세사진원본이름';
COMMENT ON COLUMN PRODUCT_BIDDING.RENAMED_FILENAME IS '상세사진수정이름';

-- 모집 참여자 한마디 게시판
CREATE TABLE BIDDING_BOARD (
    BOARD_NO NUMBER CONSTRAINT BID_BOARD_NO_PK PRIMARY KEY,
    MEMBER_NO NUMBER CONSTRAINT BID_BOARD_MEM_NO_FK REFERENCES MEMBER(NO),
    BID_NO NUMBER CONSTRAINT BID_BOARD_BID_NO_FK REFERENCES PRODUCT_BIDDING(BID_NO),
    BOARD_CONTENT VARCHAR2(1000),
    BOARD_DATE DATE DEFAULT SYSDATE,
    BOARD_STAT VARCHAR2(2) CHECK(BOARD_STAT IN('Y', 'N'))
);

CREATE SEQUENCE SEQ_BID_BOARDNO;
--------------------------------------------------------------------------------------------------------

SELECT DETAIL_PRO_NO, 
       SUM(DETAIL_QTY) AS DETAIL_QTY
FROM ORDER_DETAIL
WHERE ORDER_NO = 212
GROUP BY DETAIL_PRO_NO;

SELECT BID_STAT
FROM BIDDING
WHERE BID_MEMBER_NO = 3 AND BID_NO = 3;

SELECT COUNT(*)
FROM BIDDING
WHERE BID_MEMBER_NO = 3 AND BID_NO = 3;

UPDATE BIDDING
		SET BID_STAT = 'N'
		WHERE BID_MEMBER_NO = 3
			  AND BID_NO = 3;

INSERT INTO BIDDING_BOARD (
BOARD_NO,
MEMBER_NO,
BID_NO,
BOARD_CONTENT,
BOARD_DATE,
BOARD_STAT
) VALUES (
BOARD_NO,
MEMBER_NO,
BID_NO,
BOARD_CONTENT,
BOARD_DATE,
BOARD_STAT
);

SELECT B.BOARD_NO, B.MEMBER_NO, B.BID_NO AS B_BID_NO, B.BOARD_CONTENT, B.BOARD_DATE, B.BOARD_STAT, M.ID
FROM BIDDING_BOARD B
JOIN MEMBER M ON(B.MEMBER_NO = M.NO)
WHERE BID_NO = 3;

UPDATE BIDDING_BOARD
		SET BOARD_STAT = 'N'
		WHERE BOARD_NO = 1;
        
ROLLBACK;