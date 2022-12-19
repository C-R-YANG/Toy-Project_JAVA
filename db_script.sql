CREATE TABLE user (
    cd int not null AUTO_INCREMENT
  , id varchar(16) not null unique
  , pw varchar(64) not null
  , email varchar(100) not null unique
  , use_yn boolean not null default 0
  , role tinyint not null default 0
  , reg_dt datetime not null default now()
  , del_dt datetime null
  PRIMARY KEY(cd)
) ENGINE=MYISAM CHARSET=utf8;

CREATE TABLE file (
    cd int not null AUTO_INCREMENT
  , nm varchar(100) not null
  , path varchar(100) not null
  , reg_dt datetime not null default now()
  , PRIMARY KEY(cd)
) ENGINE=MYISAM CHARSET=utf8;

CREATE TABLE place (
 cd  INT NOT NULL AUTO_INCREMENT,
 opt tinyint NOT NULL,
 title VARCHAR(40) NOT NULL,
 category tinyint null,
 post_code VARCHAR(6) NOT NULL,
 main_address VARCHAR(100) NOT NULL,
 sub_address VARCHAR(100) NULL,
 district tinyint not null,
 neighborhood VARCHAR(20) not null,
 tel VARCHAR(14) NOT NULL,
 start_time VARCHAR(5) NOT NULL,
 end_time VARCHAR(5) NOT NULL,
 close_day VARCHAR(20) NULL,
 parking boolean NOT NULL DEFAULT true,
 views int not null default 0,
 ret_dt datetime not null default now(),
 upt_dt datetime null,
 del_dt datetime null,

  PRIMARY KEY(cd)
) ENGINE=MYISAM CHARSET=utf8;

CREATE TABLE cdmgr (
    cd varchar(20) not null
  , key_cd tinyint not null  
  , cd_nm varchar(100) not null
  , del_dt datetime null
) ENGINE=MYISAM CHARSET=utf8;

insert into cdmgr (cd, key_cd, cd_nm) values ('district', 0, '동구');
insert into cdmgr (cd, key_cd, cd_nm) values ('district', 1, '서구');
insert into cdmgr (cd, key_cd, cd_nm) values ('district', 2, '남구');
insert into cdmgr (cd, key_cd, cd_nm) values ('district', 3, '북구');
insert into cdmgr (cd, key_cd, cd_nm) values ('district', 4, '광산구');
insert into cdmgr (cd, key_cd, cd_nm) values ('food', 0, '한식');
insert into cdmgr (cd, key_cd, cd_nm) values ('food', 1, '일식');
insert into cdmgr (cd, key_cd, cd_nm) values ('food', 2, '중식');
insert into cdmgr (cd, key_cd, cd_nm) values ('food', 3, '양식');
insert into cdmgr (cd, key_cd, cd_nm) values ('food', 4, '분식');
insert into cdmgr (cd, key_cd, cd_nm) values ('hospital', 0, '평일진료');
insert into cdmgr (cd, key_cd, cd_nm) values ('hospital', 1, '야간진료');
insert into cdmgr (cd, key_cd, cd_nm) values ('hospital', 2, '공휴일진료');


CREATE TABLE place_review (
    cd int not null AUTO_INCREMENT
  , place_cd int not null  
  , user_cd int not null
  , file_cd int null
  , contents varchar(200) not null
  , score DECIMAL(2,1) not null default 0
  , reg_dt datetime not null default now()
  , upt_dt datetime null
  , del_dt datetime null
  , PRIMARY KEY(cd)
  , FOREIGN KEY (place_cd) REFERENCES place(cd) ON UPDATE CASCADE ON DELETE CASCADE
  , FOREIGN KEY (user_cd) REFERENCES user(cd) ON UPDATE CASCADE ON DELETE CASCADE
  , FOREIGN KEY (file_cd) REFERENCES file(cd) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=MYISAM CHARSET=utf8;