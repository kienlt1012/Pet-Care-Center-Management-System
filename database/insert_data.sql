use pet_care_center;

insert into user(id,name,role,username,password)
values(1,'Ly Trung Kien,''Admin','ltk1012','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG');
insert into user(id,name,role,username,password)
values(2,'Nguyen Thuy Duong,''Customer','ntd712','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG');
insert into user(id,name,role,username,password)
values(2,'Nguyen Hai,''Customer','nh1234','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG');
insert into user(id,name,role,username,password)
values(2,'Le Thi Phuong Thao,''Vet','ltpt1234','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG');
insert into user(id,name,role,username,password)
values(2,'Nguyen Quynh Trang,''Satff','nqt1234','$2a$10$/RUbuT9KIqk6f8enaTQiLOXzhnUkiwEJRdtzdrMXXwU7dgnLKTCYG');


insert into role(id,role) values(1,'Admin');
insert into role(id,role) values(2,'Customer');
insert into role(id,role) values(3,'Vet');
insert into role(id,role) values(4,'Staff');

INSERT INTO user_role(user_id,role_id) VALUES (1,1);
INSERT INTO user_role(user_id,role_id) VALUES (2,2);
INSERT INTO user_role(user_id,role_id) VALUES (3,2);
INSERT INTO user_role(user_id,role_id) VALUES (4,3);
INSERT INTO user_role(user_id,role_id) VALUES (5,4);