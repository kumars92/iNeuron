
# Creating sql_task Databse
CREATE DATABASE sql_task;
USE sql_task;

# Question - 1
# Creating attribute_dataset table in sql_task DB
CREATE TABLE attribute_dataset (
dress_id int,
style varchar(25),
price varchar(25),
rating decimal(2,1),
size varchar(25),
season varchar(25),
neckline varchar(25),
sleeve_length varchar(25),
waiseline varchar(25),
material varchar(25),
fabric_type varchar(25),
decoration varchar(25),
pattern_type varchar(25),
recommendation int
);

# Creating dress_sales table in sql_task DB
CREATE TABLE dress_sales(
dress_id INT,
`29/8/2013` INT,
`31/8/2013` INT,
`2/9/2013` INT,
`4/9/2013` INT,
`6/9/2013` INT,
`8/9/2013` INT,
`10/9/2013` INT,
`12/9/2013` INT,
`14/9/2013` INT,
`16/9/2013` INT,
`18/9/2013` INT,
`20/9/2013` INT,
`22/9/2013` INT,
`24/9/2013` INT,
`26/9/2013` INT,
`28/9/2013` INT,
`30/9/2013` INT,
`2/10/2013` INT,
`4/10/2013` INT,
`6/10/2013` INT,
`8/10/2013` INT,
`10/10/2013` INT,
`12/10/2013` INT
);

# Question - 2
# Loading the data from csv file to attribute_dataset table.
LOAD DATA INFILE "C:/Program Files/MySQL/temp/Attribute DataSet.csv" 
INTO TABLE attribute_dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
select * from attribute_dataset;

# Loading the data from csv file to dress_sales table
SET sql_mode = ""; ## setting sql mode to non-strict mode to handle blank in csv file
LOAD DATA INFILE "C:/Program Files/MySQL/temp/Dress Sales.csv" 
INTO TABLE dress_sales
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

## Fetching all the records from attribute_dataset
SELECT * FROM attribute_dataset;

## Fetching all the records from dress_dataset
SELECT * FROM dress_sales;


### Question - 6. Left Join
SELECT * FROM attribute_dataset as ad
LEFT JOIN dress_sales as ds
ON ad.dress_id=ds.dress_id;

### Question - 7. Unique dress based on dress_id 
SELECT COUNT(DISTINCT dress_id) FROM attribute_dataset;

### Question - 8. How many dress have recommendtion=0
SELECT COUNT(dress_id) FROM attribute_dataset WHERE recommendation=0;

### Question - 9. Total dress sell for individual dress_id
SELECT dress_id,(`29/8/2013`+`31/8/2013`+`2/9/2013`+`4/9/2013`+`6/9/2013`+`8/9/2013`+
`10/9/2013`+`12/9/2013`+`14/9/2013`+`16/9/2013`+`18/9/2013`+`20/9/2013`+`22/9/2013`+
`24/9/2013`+`26/9/2013`+`28/9/2013`+`30/9/2013`+`2/10/2013`+`4/10/2013`+`6/10/2013`+
`8/10/2013`+`10/10/2013`+`12/10/2013`) AS total 
FROM dress_sales;

### Question - 10. Third highest most selling dress
SELECT dress_id, (`29/8/2013`+`31/8/2013`+`2/9/2013`+`4/9/2013`+`6/9/2013`+`8/9/2013`+
`10/9/2013`+`12/9/2013`+`14/9/2013`+`16/9/2013`+`18/9/2013`+`20/9/2013`+`22/9/2013`+
`24/9/2013`+`26/9/2013`+`28/9/2013`+`30/9/2013`+`2/10/2013`+`4/10/2013`+`6/10/2013`+
`8/10/2013`+`10/10/2013`+`12/10/2013`) AS total FROM dress_sales order by total desc limit 1 offset 2;