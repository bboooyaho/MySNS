CREATE DATABASE IF NOT EXISTS mysns DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci; 

USE mysns;

CREATE TABLE IF NOT EXISTS user(
	id VARCHAR(128) PRIMARY KEY , 
	/*PASSWORD VARCHAR(32),
	NAME VARCHAR(32),
	TS TIMESTAMP DEFAULT CURRENT_TIMESTAMP	 
	*/
	--jsonstr VARCHAR(1024)
	jsonstr VARCHAR(8192) 
); 

CREATE TABLE IF NOT EXISTS feed(
	no INT UNSIGNED  PRIMARY KEY, --no 값을 입력하므로 AUTO_INCREMENT 
	id VARCHAR(128), 
	--content VARCHAR(4096),
	--images VARCHAR(1024), 
	--ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
	jsonstr VARCHAR(8192) 
); 

CREATE TABLE IF NOT EXISTS friend(
	id VARCHAR(128), -- "email"
	frid VARCHAR(128), -- "email“
	INDEX idx1(id)
);