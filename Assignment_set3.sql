
Use assignment;

desc orders;
select * from orders;
select year(orderdate) from orders;

/*
				 QUE.1. Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. 
							Example:  call order_status(2005, 11);

		Delimiter $$
				CREATE DEFINER=`root`@`localhost` PROCEDURE `order_status`(Yr int,Mon int)
				BEGIN
					Declare ordernum int;
					Declare orderdt date;
					Declare orderstatus varchar(20);

							  Select ordernumber,orderdate,status from orders where year(orderdate)=Yr AND month(orderdate)=Mon;

				END
		$$
call assignment.order_status(2003, 07);

*/

call assignment.order_status(2005, 05);


/*
		QUE.2. Write a stored procedure to insert a record into the cancellations table for all cancelled orders.
        
        		a.	Create a table called cancellations with the following fields.
                     id (primary key), customernumber (foreign key - Table customers), ordernumber (foreign key - Table Orders), comments.
                All values except id should be taken from the order table.

              b. Read through the orders table. If an order is cancelled, then put an entry in the cancellations table.
        
	Delimiter $$
				CREATE DEFINER=`root`@`localhost` PROCEDURE `cancelled_orders`()
			BEGIN
			declare cnum, ordnum, finished integer default 0;
				
				declare ord_cur cursor for
				select customernumber, ordernumber from orders where status='cancelled';
				declare exit handler for NOT FOUND set finished = 1;
				
				open ord_cur;    
				
				ordloop:REPEAT
					fetch ord_cur into cnum, ordnum;
					insert into cancellations (customernumber, ordernumber) values(cnum, ordnum);
					
				until finished = 1
				end repeat ordloop;

			END
				$$
*/

create table cancellations (id integer primary key auto_increment, customernumber integer, ordernumber integer,
                                   foreign key(customernumber) references customers(customernumber), foreign key(ordernumber) references orders(ordernumber));
 
 Alter table cancellations add column Comments char(50);
 Desc cancellations;
 
Select * from orders; 
select customernumber,ordernumber,status from orders where status='cancelled';
select * from cancellations;                                              ##### Records inserted into cancellation tb when oredr is cancelled.
   
/*
				QUE.3. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]
							if the total purchase amount for the customer is < 25000 status = Silver, 
                            amount between 25000 and 50000, status = Gold
							if amount > 50000 Platinum

				Delimiter $$
							CREATE DEFINER=`root`@`localhost` FUNCTION `purchase_status`(custnum int) RETURNS varchar(20) CHARSET utf8mb4
							DETERMINISTIC
							BEGIN
								Declare amt int default 0;
								Declare purchase_status varchar(20);
								
							  Select sum(amount) into amt from payments where customernumber=custnum;
							   
								  If amt < 25000 then 
									   set purchase_status='Silver';
								   elseif amt between 25000 and 50000 then
										 set purchase_status='Gold';
									else
										 set purchase_status='Platinum';
								  End If;

							RETURN purchase_status;
							END
            $$
*/

select assignment.purchase_status(112);
select assignment.purchase_status(103);
select assignment.purchase_status(114);

/*
					QUE.3. b. Write a query that displays customerNumber, customername and purchase_status from customers table.
*/
Select customernumber, customername, purchase_status(customernumber) from customers;

/*
            QUE.4. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables.
                       Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.

DELIMITER $$
		CREATE DEFINER=`root`@`localhost` TRIGGER `movies_AFTER_DELETE` AFTER DELETE ON `movies` FOR EACH ROW BEGIN
			  Delete from rentals where movieid not in  (Select distinct id from movies);
		END

		CREATE DEFINER=`root`@`localhost` TRIGGER `movies_AFTER_UPDATE` AFTER UPDATE ON `movies` FOR EACH ROW BEGIN
			  Update rentals set movieid=id where movieid=old.id;
		END

$$

*/

/*
    5. Select the first name of the employee who gets the third highest salary. [table: employee]
*/
select * from employee;
Select * from (select fname,dense_rank() over (order by salary desc) as rank_value,salary from employee) as T1 where rank_value=3;
/*
    6. Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]
*/
desc employee;
select dense_rank() over(order by salary desc) as rank_value,empid,concat(fname,' ',lname) as name,deptno,salary from employee;


