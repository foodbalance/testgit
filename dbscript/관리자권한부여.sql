CREATE USER c##cat IDENTIFIED BY cat;
GRANT CONNECT, RESOURCE TO c##cat;
ALTER USER c##cat QUOTA 1024M ON USERS;

-- 잠긴 사용자계정 LOCK 해제
--ALTER USER c##cat IDENTIFIED BY cat ACCOUNT UNLOCK;