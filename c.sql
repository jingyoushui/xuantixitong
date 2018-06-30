create table college_info(
college_id char(20) not null primary key,/*学院号*/
college_name char(30)/*学院名*/
);


create table major_info(
major_id char(20) not null primary key,/*专业号*/
major_name char(30),/*专业名*/
college_id char(20) not null,/*学院号*/
CONSTRAINT fk_major_college foreign key(college_id)  REFERENCES college_info(college_id)
);



create table class_info(
class_id char(20) not null primary key,/*班级号*/
major_id char(20) not null,/*专业号*/
CONSTRAINT fk_class_major foreign key(major_id)  REFERENCES major_info(major_id),
class_count number(3,0)  default 0/*人数*/
);

create table stu_info(
stu_id char(20) not null primary key,/*学号号*/
stu_name char(30),/*学生姓名*/
stu_phone char(20),/*学生电话*/
stu_sex char(20),/*学生性别*/
stu_pwd char(15) not null,/*密码*/
stu_address char(50),/*学生地址*/
class_id char(20) not null,/*班级号*/
major_id char(20) not null,/*专业号*/
CONSTRAINT fk_stu_class foreign key(class_id)  REFERENCES class_info(class_id),
CONSTRAINT fk_stu_major foreign key(major_id)  REFERENCES major_info(major_id)
);

create table tea_info(
tea_id char(20) not null primary key,/*工号*/
tea_name char(30),/*老师名*/
tea_sex char(20),/*老师性别*/
tea_phone char(20),/*老师电话*/
tea_pwd char(15) not null,/*密码*/
tea_lesson char(30),/*主教课程*/
major_id char(20) not null,/*专业号*/
CONSTRAINT fk_tea_major foreign key(major_id) REFERENCES major_info(major_id),
tea_birth date
);

create table proj_info(
proj_id char(20) not null primary key,/*课题号*/
proj_name varchar(300),/*课题名*/
proj_type char(30),/*类型*/
proj_grade char(20),/*难度*/
PROJ_ACCESSORY varchar(300),/*附件*/
tea_id char(20) not null,/*工号*/
proj_zhuang number(1) not null,/*审核状态*/
CONSTRAINT fk_proj_tea foreign key(tea_id)  REFERENCES tea_info(tea_id)
);


create table office_info(
office_id char(20) not null primary key,/*教务号*/
office_pwd char(15) not null,/*密码*/
college_id char(20) not null,/*学院号*/
CONSTRAINT fk_office_college foreign key(college_id)  REFERENCES college_info(college_id)
);



create table sel_topic_info(
proj_id char(20) not null,/*课题号*/
stu_id char(20) not null ,/*学号*/
CONSTRAINT fk_sel_stu foreign key(stu_id)  REFERENCES stu_info(stu_id),
CONSTRAINT fk_sel_proj foreign key(proj_id)  REFERENCES proj_info(proj_id)
);





