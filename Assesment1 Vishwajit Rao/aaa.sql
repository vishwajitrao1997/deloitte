
create table patients1
( PATIENTID NUMBER(3)PRIMARY KEY,
  PATIENTNAME VARCHAR(10) NOT NULL,
  PEMAIL VARCHAR(10)  UNIQUE,
  PDATE  DATE 
  
)


CREATE TABLE MEDICINE1
( MID NUMBER(5) PRIMARY KEY ,
  MNAME VARCHAR(10) NOT NULL
)  

 
 
 CREATE TABLE PRESCRIPTION2
(   PRESCRIPTIONID NUMBER(5)PRIMARY KEY,
    PDATE DATE,
    PATIENTID NUMBER(3) UNIQUE
)  

ALTER TABLE prescription2
ADD FOREIGN KEY (PATIENTID) REFERENCES Patients1(PATIENTID);

CREATE TABLE INFO1
( INFOID NUMBER(3)PRIMARY KEY,
  PRESCRIPTIONID NUMBER(3)UNIQUE,
  MID NUMBER(5)UNIQUE
)
ALTER TABLE INFO1
ADD FOREIGN KEY (PRESCRIPTIONID) REFERENCES PRESCRIPTION2(PRESCRIPTIONID);

ALTER TABLE INFO1
ADD FOREIGN KEY (MID) REFERENCES MEDICINE1(MID);
 
 INSERT INTO PATIENTS1 VALUES (11,'ARUN','ARUN@GMAIL','28-mar-2017');
 INSERT INTO PATIENTS1 VALUES (12,'KARUN','kRUN@GMAIL','28-APR-2018');
 INSERT INTO PATIENTS1 VALUES (13,'VARUN','vRUN@GMAIL','28-mar-2017');
 INSERT INTO PATIENTS1 VALUES (14,'TARUN','tRUN@GMAIL','28-apr-2016');


Insert into medicine1 values(123,'budamate');
Insert into medicine1 values(456,'cipla');
Insert into medicine1 values(789,'crocin');
Insert into medicine1 values(111,'azethra');
Insert into medicine1 values(444,'fluenza');


Insert into prescription2  values(1,sysdate,11);
Insert into prescription2  values(2,sysdate,12);
Insert into prescription2  values(3,sysdate,13);
Insert into prescription2  values(4,sysdate,14);
Insert into info1(1,1,1);
--Query1
select * from patients1 where pdate between '1-jan-2016' and '1-dec-2017' 
--Query2
select prescriptionid,mid,mname from info1 i,prescription2 p,medicine1 m where (i.prescriptionid=p.prescriptionid and i.mid=m.mid)
