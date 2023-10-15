drop table tbl_jumin_202108;
CREATE TABLE TBL_JUMIN_202108(
	jumin varchar2(20) primary key,
	name varchar2(15),
	phone varchar2(15),
	address varchar2(50)
);

insert into TBL_JUMIN_202108 values('710101-1000001', '김주민', '010-1111-1111', '경기도 성남시 수정구 태평1동');
insert into TBL_JUMIN_202108 values('720101-2000001', '이주민', '010-1111-2222', '경기도 성남시 수정구 태평2동');
insert into TBL_JUMIN_202108 values('730101-1000001', '박주민', '010-1111-3333', '경기도 성남시 수정구 복정동');
insert into TBL_JUMIN_202108 values('740101-2000001', '홍주민', '010-1111-4444', '경기도 성남시 수정구 산성동');
insert into TBL_JUMIN_202108 values('750101-1000001', '조주민', '010-1111-5555', '경기도 성남시 중원구 성남동');
insert into TBL_JUMIN_202108 values('760101-2000001', '최주민', '010-1111-6666', '경기도 성남시 중원구 중앙동');
insert into TBL_JUMIN_202108 values('770101-1000001', '장주민', '010-1111-7777', '경기도 성남시 중원구 상대원동');
insert into TBL_JUMIN_202108 values('780101-2000001', '정주민', '010-1111-8888', '경기도 성남시 중원구 하대원동');
insert into TBL_JUMIN_202108 values('790101-1000001', '강주민', '010-1111-9999', '경기도 성남시 분당구 야탑1동');
insert into TBL_JUMIN_202108 values('800101-2000001', '신주민', '010-2222-1111', '경기도 성남시 분당구 야탑2동');

drop table tbl_hosp_202108;
create table tbl_hosp_202108(
	hospcode char(4) primary key,
	hospname varchar2(40),
	hosptel varchar2(15),
	hospaddr varchar2(50)
);

insert into tbl_hosp_202108 values('H001', '가_병원', '031-1111-2222', '10');
insert into tbl_hosp_202108 values('H002', '나_병원', '031-1111-3333', '20');
insert into tbl_hosp_202108 values('H003', '다_병원', '031-1111-4444', '30');
insert into tbl_hosp_202108 values('H004', '라_병원', '031-1111-5555', '40');

drop table tbl_vaccresv_202108;
create table tbl_vaccresv_202108(
	resvno number(8) primary key,
	jumin varchar2(20),
	hospcode char(4),
	resvdate date,
	resvtime number(4),
	vcode char(4)
);

insert into tbl_vaccresv_202108 values(20210001, '710101-1000001', 'H001', '20210801', 0930, 'V001');
insert into tbl_vaccresv_202108 values(20210002, '720101-2000001', 'H002', '20210801', 1030, 'V002');
insert into tbl_vaccresv_202108 values(20210003, '730101-1000001', 'H003', '20210801', 1130, 'V003');
insert into tbl_vaccresv_202108 values(20210004, '740101-2000001', 'H001', '20210801', 1230, 'V001');
insert into tbl_vaccresv_202108 values(20210005, '750101-1000001', 'H001', '20210801', 1330, 'V002');
insert into tbl_vaccresv_202108 values(20210006, '760101-2000001', 'H002', '20210801', 1430, 'V003');
insert into tbl_vaccresv_202108 values(20210007, '770101-1000001', 'H003', '20210801', 1530, 'V001');
insert into tbl_vaccresv_202108 values(20210008, '780101-2000001', 'H001', '20210801', 1630, 'V002');
insert into tbl_vaccresv_202108 values(20210009, '790101-1000001', 'H001', '20210801', 1730, 'V003');
insert into tbl_vaccresv_202108 values(20210010, '800101-2000001', 'H002', '20210801', 1830, 'V001');

select resvno as 예약번호, name as 성명, 
case when substr(ju.jumin, 8, 1)='1' then '남' else '여' end as 성별, hospname as 성별, hospname as 병원이름,
substr(resvdate, 1, 4) || '년' || substr(resvdate, 5, 2) || '월' || substr(resvdate, 7, 2) || '일' as 예약날짜, 
substr(resvtime, 1, 2) || ':' || substr(resvtime, 3, 2) as 예약시간, 
case when vcode='V001' then 'A백신' when vcode='V002' then 'B백신' else 'C백신' end as 백신코드, 
case when hospaddr='10' then '서울' when hospaddr='20' then '대전' when hospaddr='30' then '대구' else '광주' end as 병원지역 
from tbl_jumin_202108 ju, tbl_hosp_202108 ho, tbl_vaccresv_202108 va 
where ju.jumin = va.jumin and ho.hospcode = va.hospcode;