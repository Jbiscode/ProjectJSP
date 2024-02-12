# 오라클
# create table guestbook(
#                           seq   number primary key, -- 시퀀스 객체로부터 값을 얻어온다
#                           name  varchar2(30),
#                           email  varchar2(30),
#                           homepage  varchar2(35),
#                           subject  varchar2(500) not null,
#                           content  varchar2(4000) not null,
#                           logtime  date);
#
# [시퀀스]
# create sequence seq_guestbook nocycle nocache;


# mysql
CREATE TABLE guestbook(
    seq INT AUTO_INCREMENT PRIMARY KEY, -- 시퀀스 객체로부터 값을 얻어온다
    name VARCHAR(30),
    email VARCHAR(30),
    homepage VARCHAR(35),
    subject VARCHAR(500) NOT NULL,
    content VARCHAR(4000) NOT NULL,
    logtime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
