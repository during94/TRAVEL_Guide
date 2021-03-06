CREATE TABLE member(
    id          varchar2(20) PRIMARY KEY NOT NULL,
    pwd         varchar2(20) NOT NULL,
    name        varchar2(20),
    phone       varchar2(50),
    email       varchar2(20),
    regdate     date DEFAULT SYSDATE,
    email_check VARCHAR(20)

);

CREATE TABLE content(
    num         number(20)  PRIMARY KEY NOT NULL,
    c_kind      varchar2(20) DEFAULT null,
    c_up        number(20) DEFAULT 0,
    c_title     varchar2(20) NOT NULL,
    c_file      varchar2(40) DEFAULT 'noimage.jpg',
    name        varchar2(20),
    id          varchar2(20) REFERENCES member(id),
    c_content   varchar2(100),
    c_count     number(20) DEFAULT 0,
    c_regdate     date DEFAULT SYSDATE
);

CREATE TABLE Operator(
    o_id        varchar2(20) PRIMARY KEY NOT NULL,
    o_pwd       varchar2(20) NOT NULL,
    o_name      varchar2(20),
    o_phone     varchar2(20)
);
CREATE TABLE event(
    e_num           number(20) PRIMARY KEY NOT NULL,
    e_link          varchar2(300) NOT NULL,
    e_sub_title     varchar2(100),
    e_main_title    varchar2(100),
    e_kind          number(2) DEFAULT 0,
    e_regdate       date DEFAULT SYSDATE,
    e_image         varchar2(50)   DEFAULT 'noimage.jpg'
);

CREATE TABLE festival(
    f_num           number(20) PRIMARY KEY NOT NULL,
    f_link          varchar2(300) NOT NULL,
    f_sub_title     varchar2(100),
    f_main_title    varchar2(100),
    f_kind          number(2) DEFAULT 0,
    f_regdate       date DEFAULT SYSDATE,
    f_image         varchar2(50)   DEFAULT 'noimage.jpg'
);

CREATE TABLE banner(
    b_num           number(20) PRIMARY KEY NOT NULL,
    b_link          varchar2(300) NOT NULL,
    b_sub_title     varchar2(100),
    b_main_title    varchar2(100),
    b_image         varchar2(50)   DEFAULT 'noimage.jpg'
);

CREATE TABLE like_up(
    id              varchar2(20) REFERENCES member(id),
    num             number(20) REFERENCES content(num),
    like_check      number(1) DEFAULT 0,
    like_up         number(30) DEFAULT 0
);

CREATE TABLE recontent(
    re_number   number(30) PRIMARY KEY NOT NULL,
    re_num      number(20) REFERENCES content(num),
    re_id       varchar2(20) REFERENCES member(id),
    re_regdate  date DEFAULT SYSDATE,
    re_content  varchar2(400) NOT NULL
);
select * from recontent;
insert into operator(o_id, o_pwd, o_name, o_phone) values('123','123','123','123');
COMMIT;

CREATE SEQUENCE SEQ_MP_FILE_NO
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

CREATE SEQUENCE SEQ_EVENT_NUM
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

CREATE SEQUENCE SEQ_FESTIVAL_NUM
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

CREATE SEQUENCE SEQ_BANNER_NUM
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

CREATE SEQUENCE SEQ_re_number
START WITH 1 
INCREMENT BY 1 
NOMAXVALUE NOCACHE;

COMMIT;

CREATE TABLE criteria(
    page number(20),
    perpagenum number(20),
    rowStart number(20),
    rowend number(20)
);

CREATE SEQUENCE content_seq START WITH 1 INCREMENT BY 1;

SELECT * FROM content;

insert into operator(o_id,o_pwd,o_name,o_phone) values('123','123','123','123');

commit;

select * from recontent ORDER BY re_number desc;
select * from content;

/*여기부터는 실험용*/
INSERT INTO content(num,c_title,name,id,c_content) VALUES (content_seq.nextval,'꿀잼','123','123','123');
INSERT INTO content(num,c_title,name,id,c_content) VALUES (content_seq.nextval,'꿀잼','123','123','123');
INSERT INTO content(num,c_title,name,id,c_content) VALUES (content_seq.nextval,'꿀잼','123','123','123');

commit;

CREATE TABLE re_criteria(
    re_page number(20),
    re_perpagenum number(20)
);

SELECT rnum, re.* 
    FROM (select a.*, ROW_NUMBER() OVER(ORDER BY re_number)as rnum
            from recontent a WHERE RE_NUM = 280)re 
    WHERE rnum BETWEEN 2 AND 6;


SELECT ROWNUM,
				num.*
			FROM(
				SELECT c.* FROM content c
			ORDER BY c.c_count DESC) num
			WHERE ROWNUM <= 5            

SELECT rnum, re_number, re_num,re_id,re_regdate,re_content
    		FROM (select re_number, re_num,re_id,re_regdate,re_content,
                    ROW_NUMBER() OVER(ORDER BY re_number)as rnum
            		FROM recontent WHERE re_num = 280)re 
    			WHERE rnum BETWEEN 11 AND 20;
            
            
select
			num,c_title, name, id, c_content, c_count, c_regdate, c_kind
		FROM(
	    		select num,c_title, name, id, c_content, c_count, c_regdate, c_kind,
	    		row_number() OVER(ORDER BY num DESC)
	    	AS RNUM
		    	FROM 
		    		content
		    	WHERE 1=1 
			) MP
		WHERE RNUM BETWEEN 1 AND 10
			ORDER BY num DESC     
            
            
            
            
            
            