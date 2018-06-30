create table college_info(
college_id char(20) not null primary key,/*ѧԺ��*/
college_name char(30)/*ѧԺ��*/
);


create table major_info(
major_id char(20) not null primary key,/*רҵ��*/
major_name char(30),/*רҵ��*/
college_id char(20) not null,/*ѧԺ��*/
CONSTRAINT fk_major_college foreign key(college_id)  REFERENCES college_info(college_id)
);



create table class_info(
class_id char(20) not null primary key,/*�༶��*/
major_id char(20) not null,/*רҵ��*/
CONSTRAINT fk_class_major foreign key(major_id)  REFERENCES major_info(major_id),
class_count number(3,0)  default 0/*����*/
);

create table stu_info(
stu_id char(20) not null primary key,/*ѧ�ź�*/
stu_name char(30),/*ѧ������*/
stu_phone char(20),/*ѧ���绰*/
stu_sex char(20),/*ѧ���Ա�*/
stu_pwd char(15) not null,/*����*/
stu_address char(50),/*ѧ����ַ*/
class_id char(20) not null,/*�༶��*/
major_id char(20) not null,/*רҵ��*/
CONSTRAINT fk_stu_class foreign key(class_id)  REFERENCES class_info(class_id),
CONSTRAINT fk_stu_major foreign key(major_id)  REFERENCES major_info(major_id)
);

create table tea_info(
tea_id char(20) not null primary key,/*����*/
tea_name char(30),/*��ʦ��*/
tea_sex char(20),/*��ʦ�Ա�*/
tea_phone char(20),/*��ʦ�绰*/
tea_pwd char(15) not null,/*����*/
tea_lesson char(30),/*���̿γ�*/
major_id char(20) not null,/*רҵ��*/
CONSTRAINT fk_tea_major foreign key(major_id) REFERENCES major_info(major_id),
tea_birth date
);

create table proj_info(
proj_id char(20) not null primary key,/*�����*/
proj_name varchar(300),/*������*/
proj_type char(30),/*����*/
proj_grade char(20),/*�Ѷ�*/
PROJ_ACCESSORY varchar(300),/*����*/
tea_id char(20) not null,/*����*/
proj_zhuang number(1) not null,/*���״̬*/
CONSTRAINT fk_proj_tea foreign key(tea_id)  REFERENCES tea_info(tea_id)
);


create table office_info(
office_id char(20) not null primary key,/*�����*/
office_pwd char(15) not null,/*����*/
college_id char(20) not null,/*ѧԺ��*/
CONSTRAINT fk_office_college foreign key(college_id)  REFERENCES college_info(college_id)
);



create table sel_topic_info(
proj_id char(20) not null,/*�����*/
stu_id char(20) not null ,/*ѧ��*/
CONSTRAINT fk_sel_stu foreign key(stu_id)  REFERENCES stu_info(stu_id),
CONSTRAINT fk_sel_proj foreign key(proj_id)  REFERENCES proj_info(proj_id)
);





