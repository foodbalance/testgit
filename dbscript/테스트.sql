insert into BOARD values (SEQ_BOARD_NO.NEXTVAL, 'dongju', '�ȳ�', '����', SYSDATE, SEQ_BOARD_READCOUNT.NEXTVAL, NULL, NULL);
insert into NOTICE values (SEQ_NOTICE_NO.NEXTVAL, 'dongju', '�ȳ�', '��sdafsadfsadkfjbsakdlfbsajdkfbsajdlbdsajfklbsadkfbdsajkfdsafdsafdsadfsadfsadfsadfdsafsadfsadfsdafdsadfsadfdsafsadfsadfsdafdsafsadgsafdhbfdabdafndnfdndsgnfgsndfsadfdsafsadfsadfsdafdsafsadgsafdhbfdabdafndnfdndsgnfgsndfsadfdsafsadfsadfsdafdsafsadgsafdhbfdabdafndnfdndsgnfgsndfsadfdsafsadfsadfsdafdsafsadgsafdhbfdabdafndnfdndsgnfgsnfsadgsafdhbfdabdafndnfdndsgnfgsnfgsn��', SYSDATE, SEQ_NOTICE_NO.NEXTVAL);


insert into CATPROFILE values ('dongju', '������', '���þȺ��', 1, '���Ʊ�', 3.4, 'Y', 'ASDFDA.JPG', 'CAT1.JPG', SEQ_CATPROFILE.NEXTVAL, 9.123125123);

SELECT * FROM NOTICE;
SELECT * FROM BOARD;

SELECT * FROM MEMBER;

SELECT * FROM CATPROFILE;

select count(user_id) from catprofile 
		where user_id = 'ehdwn' and cat_name = '����';
        
select distinct cat_name
from catprofile where user_id = 'ehdwn';

update member 
		set admin_ok = 'N'
		where user_id = 'ehdwn';
        
update member 
		set login_ok = 'Y'
		where user_id = 'ehdwn';
        
COMMIT;

SELECT *
		FROM (SELECT ROWNUM RNUM, notice_no, notice_title, notice_date
		          FROM (SELECT * FROM NOTICE
		                     ORDER BY notice_date desc, notice_no DESC))
		WHERE RNUM >= 1 AND RNUM <= 3;