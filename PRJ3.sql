/*
Project Name: Food Delivery Application

Project tables are present in the cloud database.

Tables implemented in this database.
CUSTOMER(CUSTID, FNAME, LNAME, CADDRESS, CPHONE, CEMAIL): PK= CUSTID, NO FK
DELIVERYAGENT(AGENTID, ANAME, APHONE, VEHICLE#): PK=AGENTID, NO FK
ORD(ORDERID, ORDERDATE, TOTALAMOUNT, CUSTID, RESTAURANTID, PAYMENTID, AGENTID): PK=ORDERID, FK=CUSTID, RESTAURANTID, PAYMENTID, AGENTID
PAYMENT(PAYMENTID, PAYMENTSTATUS, PAYMENTDATE, TYPEID): PK=PAYMENTID, FK=TYPEID
PAYMENTTYPE(TYPEID, PAYMENTDESCRIPTION): PK=TYPEID, NO FK
RESTAURANT(RESTAURANTID, RNAME, RPHONE, RLOCATION, RADDRESS): PK=RESTAURANTID, NO FK
*/

Drop table customer cascade constraints;
Drop table deliveryagent cascade constraints;
Drop table ord cascade constraints;
Drop table payment cascade constraints;
Drop table paymenttype cascade constraints;
Drop table restaurant cascade constraints;

Purge RecycleBin;

CREATE TABLE CUSTOMER (
CUSTID NUMBER(2) NOT NULL,
FNAME VARCHAR2(10),
LNAME VARCHAR2(10),
CADDRESS VARCHAR2(50),
CPHONE VARCHAR2(20),
CEMAIL VARCHAR2(30),
CONSTRAINT CUSTOMER_CUSTID_PK PRIMARY KEY (CUSTID));


INSERT INTO CUSTOMER VALUES (1,'Adams','Roy','301 Strolington Street','(798) 123-4561','adams.roy@hotmail.com');
INSERT INTO CUSTOMER VALUES (2,'Joseph','Murdock','1664 Pensilvania Road','(564) 123-4231','murdock321@yahoo.com');
INSERT INTO CUSTOMER VALUES (3,'Martin','Luthor','456 Hampden Ave','(421) 546-7894','martinl@gmail.com');
INSERT INTO CUSTOMER VALUES (4,'Amanda','Seyfried','Cliff Street','(333) 445-7125','samanda156@outlook.com');
INSERT INTO CUSTOMER VALUES (5,'Anna','Paula','Rock Village','(254) 783-1214','paulaanna@outlook.com');
INSERT INTO CUSTOMER VALUES (6,'Raymond','Piche','14th Lavender Ave','(456) 123-4521','raymond245@gmail.com');


CREATE TABLE DELIVERYAGENT (
AGENTID NUMBER (4) NOT NULL,
ANAME VARCHAR2 (20),
APHONE VARCHAR2 (20),
VEHICLE# VARCHAR2 (20),
CONSTRAINT DELIVERYAGENT_AGENTID_PK PRIMARY KEY (AGENTID));


INSERT INTO DELIVERYAGENT VALUES (1001,'Goldberg','(475) 424-5654','ZA 132');
INSERT INTO DELIVERYAGENT VALUES (1002,'Ryan','(985) 421-3651','UH 142');
INSERT INTO DELIVERYAGENT VALUES (1003,'Wikin','(789) 456-4564','OH 554');
INSERT INTO DELIVERYAGENT VALUES (1004,'Zendya','(123) 452-1345','CO 887');
INSERT INTO DELIVERYAGENT VALUES (1005,'Roseberg','(222) 789-4125','WI 333');
INSERT INTO DELIVERYAGENT VALUES (1006,'Ellie','(885) 419-6652','IL 871');
INSERT INTO DELIVERYAGENT VALUES (1007,'Michael','(225) 134-8762','CO 332');


CREATE TABLE PAYMENTTYPE (
TYPEID VARCHAR2 (5),
PAYMENTDESCRIPTION VARCHAR2 (20),
CONSTRAINT PAYMENTTYPE_TYPEID_PK PRIMARY KEY (TYPEID));


INSERT INTO PAYMENTTYPE VALUES ('T1','Credit Card');
INSERT INTO PAYMENTTYPE VALUES ('T2','Online Payment');
INSERT INTO PAYMENTTYPE VALUES ('T3','Cash');
INSERT INTO PAYMENTTYPE VALUES ('T4','Wallet');
INSERT INTO PAYMENTTYPE VALUES ('T5','UPI');
INSERT INTO PAYMENTTYPE VALUES ('T6','In-app coins');
INSERT INTO PAYMENTTYPE VALUES ('T7','Debit Card');


CREATE TABLE PAYMENT (
PAYMENTID VARCHAR2 (5) NOT NULL,
PAYMENTSTATUS VARCHAR2 (30),
PAYMENTDATE DATE,
TYPEID VARCHAR2 (5),
CONSTRAINT PAYMENT_PAYMENTID_PK PRIMARY KEY (PAYMENTID),
CONSTRAINT PAYMENT_TYPEID_FK FOREIGN KEY (TYPEID) REFERENCES PAYMENTTYPE (TYPEID));


INSERT INTO PAYMENT VALUES ('P1','Payment processing', TO_DATE('3/10/2021 17:32:24', 'MM/DD/YYYY HH24:MI:SS'),'T1');
INSERT INTO PAYMENT VALUES ('P2','Payment pending', TO_DATE('6/8/2005 11:24:36', 'MM/DD/YYYY HH24:MI:SS'),'T3');
INSERT INTO PAYMENT VALUES ('P3','Payment complete', TO_DATE('4/16/2009 14:23:12', 'MM/DD/YYYY HH24:MI:SS'),'T5');
INSERT INTO PAYMENT VALUES ('P4','Payment failed' ,TO_DATE('5/22/2016 12:15:07', 'MM/DD/YYYY HH24:MI:SS'),'T6');
INSERT INTO PAYMENT VALUES ('P5','Payment initialized',TO_DATE('8/2/2017 15:06:01', 'MM/DD/YYYY HH24:MI:SS'), 'T4');
INSERT INTO PAYMENT VALUES ('P6','Payment declined',TO_DATE('6/23/2017 19:58:48', 'MM/DD/YYYY HH24:MI:SS'), 'T2');
INSERT INTO PAYMENT VALUES ('P7','Payment cancelled',TO_DATE('8/25/2008 20:32:16', 'MM/DD/YYYY HH24:MI:SS'), 'T4');


CREATE TABLE RESTAURANT (
RESTAURANTID VARCHAR2 (5) NOT NULL,
RNAME VARCHAR2 (25),
RPHONE VARCHAR2 (20),
RLOCATION VARCHAR2 (30),
RADDRESS VARCHAR2 (50),
CONSTRAINT RESTAURANT_RESTAURANTID_PK PRIMARY KEY (RESTAURANTID));


INSERT INTO RESTAURANT VALUES ('R1','Mythri Sweets','4193327458','North Avenue','412 S North Avenue, Littleton, CO 80214');
INSERT INTO RESTAURANT VALUES ('R2','BurgerKing','3128524454','Hampden Ave','4441 E Hampden Ave, Centennial, CO 80041');
INSERT INTO RESTAURANT VALUES ('R3','TacoBell','6897854876','Ridger Gate','3698 Ridger Gate, Martin Lane, IL 79842');
INSERT INTO RESTAURANT VALUES ('R4','Subway','1235987872','Boulder Street','1124 Boulder Street, Carolina, NC 45213');
INSERT INTO RESTAURANT VALUES ('R5','Rony Juice Center','2312125264','Park Meadows','3192 Park Meadows, West Minister, NY 12345');
INSERT INTO RESTAURANT VALUES ('R6','KFC','1327898974','Belleview Center','5678 Belleview Center, Tempe, AZ 85412');
INSERT INTO RESTAURANT VALUES ('R7','Tyson Drive-in','4583185249','Raymond Hallway','2258 Raymond Hallway, Kansas, KS 66841');


CREATE TABLE ORD (
ORDERID NUMBER (3) NOT NULL,
ORDERDATE DATE,
TOTALAMOUNT NUMBER (7,2),
CUSTID NUMBER (2),
RESTAURANTID VARCHAR2 (4),
PAYMENTID VARCHAR2 (4),
AGENTID NUMBER (4),
CONSTRAINT ORD_ORDERID_PK PRIMARY KEY (ORDERID),
CONSTRAINT ORD_CUSTID_FK FOREIGN KEY (CUSTID) REFERENCES CUSTOMER (CUSTID),
CONSTRAINT ORD_RESTAURANTID_FK FOREIGN KEY (RESTAURANTID) REFERENCES RESTAURANT (RESTAURANTID),
CONSTRAINT ORD_PAYMENTID_FK FOREIGN KEY (PAYMENTID) REFERENCES PAYMENT (PAYMENTID),
CONSTRAINT ORD_AGENTID_FK FOREIGN KEY (AGENTID) REFERENCES DELIVERYAGENT (AGENTID));


INSERT INTO ORD VALUES (101,TO_DATE('3/9/2021','MM/DD/YYYY'),1500,1,'R2','P1',1002);
INSERT INTO ORD VALUES (102,TO_DATE('5/7/2006','MM/DD/YYYY'),3128,5,'R6','P3',1003);
INSERT INTO ORD VALUES (103,TO_DATE('4/16/2003','MM/DD/YYYY'),15278,6,'R2','P2',1001);
INSERT INTO ORD VALUES (104,TO_DATE('7/31/2017','MM/DD/YYYY'),31234,4,'R4','P5',1002);
INSERT INTO ORD VALUES (105,TO_DATE('8/19/2005','MM/DD/YYYY'),5558,3,'R3','P4',1003);
INSERT INTO ORD VALUES (106,TO_DATE('12/16/2012','MM/DD/YYYY'),1626,2,'R1','P2',1004);
INSERT INTO ORD VALUES (107,TO_DATE('6/19/2017','MM/DD/YYYY'),5135,6,'R2','P6',1006);
INSERT INTO ORD VALUES (108,TO_DATE('8/25/2008','MM/DD/YYYY'),3961,3,'R4','P7',1002);


commit;

/* Find the customer who placed an order in the June months */
select customer.custid 
from customer inner join ord on (ord.custid = customer.custid)
where to_char(orderdate, 'MON') = 'JUN';

/* What is the mode of payment used for paymentid equal to P1 */
select paymentdescription
from payment inner join paymenttype on (payment.typeid = paymenttype.typeid)
where paymentid = 'P1';

/* Find the total number of orders placed by a customer with custid as 6. */
select count(orderid) "Count_of_Orders" from ord where custid = 6;

/*Find the maximum amount spent by a customer to order food.*/
select max(totalamount) "Max_Amount"
from ord;

/* Display the minimum amount spent by a customer in the August month*/
select min(totalamount) "Min_Amount"from ord where to_char(orderdate, 'MON') = 'AUG';

/*Find all customers who has spent less than custid = 4 for various orders*/
select custid, totalamount  from ord
where totalamount < (select totalamount from ord where custid = 4);

/*Find all orders which were placed in between 2006 and 2008*/
select orderid from ord
where orderdate in (select orderdate from ord where orderdate between '01-JAN-2006' and '31-DEC-2008');

/*Find orders where total amount spent was more than 5000 AND custid is 3 or 6. */
select orderid from ord
where totalamount > 5000 AND (custid = 3 or custid = 6);

/*Find the delivery agent id whose name is goldberg and (vehicle number is ZA 132 or OH 554).*/
select agentid, aname from deliveryagent
where (lower(aname) = 'goldberg') AND (vehicle# = 'ZA 132' or vehicle# = 'OH 554');

/*Find restaurants whose location has 'Ave' as a part of the location and restaurantid as r1 or r3 or r2.*/
select restaurantid, rname from restaurant
where (lower(rlocation) like '%ave%') and (restaurantid = 'R1' or restaurantid = 'R3' or restaurantid = 'R2');