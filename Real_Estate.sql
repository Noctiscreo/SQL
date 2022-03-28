/*

The below SQL was created from scratch but with some dummie data entries being input using an online tool.
(the website ended up being almost more trouble than it was worth, as the dummie data didn't quite work with the
assignment requirements). The SQL instructor said this would be looked into for future courses.

Please see 'Portfolio_2-John_Hasznosi.docx' in the GitHub repo for a more full explanation of this assignment.

*/

PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS Client;
DROP TABLE IF EXISTS EstateAgent;
DROP TABLE IF EXISTS Owner;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Staff;
DROP TABLE IF EXISTS Viewings;
DROP TABLE IF EXISTS Offer;

PRAGMA foreign_keys = ON;
	
    
    CREATE TABLE Owner (
      OwnerID INT(4) PRIMARY KEY
      ,FirstName VARCHAR(25) NOT NULL
      ,LastName VARCHAR(25) NOT NULL
      ,Phone VARCHAR(20)
      ,Email VARCHAR(255) NOT NULL UNIQUE
      ,StreetAddress VARCHAR(40)
      ,City VARCHAR(30)
      ,PostalCode VARCHAR(12)
      ,Country VARCHAR(12)
      );
  
  	CREATE TABLE Staff (
      StaffID INT(4) PRIMARY KEY
      ,FirstName VARCHAR(25) NOT NULL
      ,LastName VARCHAR(25) NOT NULL
      ,Phone VARCHAR(20) NOT NULL
      ,Email VARCHAR(255) NOT NULL UNIQUE
      );
    
  	CREATE TABLE EstateAgent (
      EstateAgentID INT(4) PRIMARY KEY
      ,FirstName VARCHAR(25) NOT NULL
      ,LastName VARCHAR(25) NOT NULL
      ,Phone VARCHAR(20) NOT NULL
      ,Email VARCHAR(255) NOT NULL UNIQUE
      );
  
  	CREATE TABLE Property (
      PropertyID INT(4) PRIMARY KEY
      ,StreetAddress VARCHAR(40)
      ,City VARCHAR(30)
      ,PostalCode VARCHAR(12)
      ,Country VARCHAR(12)
      ,PropertyType VARCHAR(25)
      ,PropertyValue INT(12)
      ,SellingPrice int(12)
      ,OwnerID INT(4)
      ,EstateAgentID INT(4)
      ,FOREIGN KEY (OwnerID) REFERENCES Owner (OwnerID)
      ,FOREIGN KEY (EstateAgentID) REFERENCES EstateAgent(EstateAgentID)
      );
    
    CREATE TABLE Client (
      ClientID INT(4) PRIMARY KEY
      ,FirstName VARCHAR(25) NOT NULL
      ,LastName VARCHAR(25) NOT NULL
      ,Phone VARCHAR(20)
      ,Email VARCHAR(255) UNIQUE
      ,StreetAddress VARCHAR(40)
      ,City VARCHAR(30)
      ,PostalCode VARCHAR(12)
      ,Country VARCHAR(12)
      );
      
     CREATE TABLE Viewings (
       ViewingID INT(4) PRIMARY KEY
       ,ViewDate DATE
       ,ViewTime TIME
       ,StaffID INT(4)
       ,ClientID INT(4)
       ,PropertyID INT(4)
       ,FOREIGN KEY (StaffID) REFERENCES Staff (StaffID)
       ,FOREIGN KEY (ClientID) REFERENCES Client (ClientID)
       ,FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID)
       );
       
      Create Table Offer (
        OfferID INT(4) PRIMARY KEY
        ,OfferAmount INT(12)
        ,Accepted VARCHAR(5)
        ,AcceptanceDate DATE
        ,ViewingID INT(4)
        ,PropertyID INT(4)
        ,ClientID int(4)
        ,FOREIGN KEY (ViewingID) REFERENCES Viewings (ViewingID)
        ,FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID)
        ,FOREIGN KEY (ClientID) References Client (ClientID)
        );
                           
insert into Owner (OwnerID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (3455, 'Clayborn', 'MacCracken', '887-417-City0522', 'cmaccracken0@yolasite.com', '531 Meadow Vale Court', 'Canguaretama', '59190-000', 'Brazil');
insert into Owner (OwnerID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (3242, 'Wilek', 'Goutcher', '165-806-3459', 'wgoutcher1@xing.com', '7585 Fallview Hill', 'Karlstad', '652 17', 'Sweden');
insert into Owner (OwnerID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (1342, 'Tobie', 'Maha', '182-459-2025', 'tmaha2@mtv.com', '3184 Northview Drive', 'Ddmashen', '5323424', 'Armenia');
insert into Owner (OwnerID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (6434, 'Kerry', 'Grealey', '614-458-2500', 'kgrealey3@deviantart.com', '47018 Ronald Regan Junction', 'Kimch’aek-si', '234242', 'North Korea');
insert into Owner (OwnerID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (2342, 'Lura', 'Royce', '187-627-9816', 'lroyce4@scribd.com', '14633 Fieldstone Way', 'Zhavoronki', '601107', 'Russia');

insert into Staff (StaffID, FirstName, LastName, Phone, Email) 
values (8347, 'De', 'Adkin', '257-395-8490', 'dadkin0@redcross.org');
insert into Staff (StaffID, FirstName, LastName, Phone, Email) 
values (1356, 'Mord', 'Longland', '845-902-1261', 'mlongland1@google.de');
insert into Staff (StaffID, FirstName, LastName, Phone, Email) 
values (9382, 'Selma', 'Winser', '902-981-3286', 'swinser2@admin.ch');
insert into Staff (StaffID, FirstName, LastName, Phone, Email) 
values (1345, 'Janeva', 'Mason', '916-176-1474', 'jmason3@who.int');
insert into Staff (StaffID, FirstName, LastName, Phone, Email) 
values (6742, 'Levon', 'Franseco', '380-579-7248', 'lfranseco4@uiuc.edu');

insert into EstateAgent (EstateAgentID, FirstName, LastName, Phone, Email) 
values (9483, 'Dix', 'Joyce', '765-852-0556', 'djoyce0@mysql.com');
insert into EstateAgent (EstateAgentID, FirstName, LastName, Phone, Email) 
values (3931, 'Pierre', 'Nutkins', '988-955-0980', 'pnutkins1@dropbox.com');
insert into EstateAgent (EstateAgentID, FirstName, LastName, Phone, Email) 
values (2039, 'Archibaldo', 'Kingzeth', '856-249-9494', 'akingzeth2@arstechnica.com');
insert into EstateAgent (EstateAgentID, FirstName, LastName, Phone, Email) 
values (3940, 'Kata', 'Vernazza', '921-623-0957', 'kvernazza3@chron.com');
insert into EstateAgent (EstateAgentID, FirstName, LastName, Phone, Email) 
values (9823, 'Konstance', 'Downey', '891-510-5196', 'kdowney4@ucla.edu');

insert into Property (PropertyID, StreetAddress, City, PostalCode, Country, PropertyType, PropertyValue, SellingPrice, OwnerID, EstateAgentID) 
values (9485, '58 Armistice Lane', 'Edingburgh', '2345344', 'UK', 'House', 350000, 260000, 3455, 9483);
insert into Property (PropertyID, StreetAddress, City, PostalCode, Country, PropertyType, PropertyValue, SellingPrice, OwnerID, EstateAgentID) 
values (1562, '818 Lukken Pass', 'Birmingham', '04012', 'UK', 'House', 400000, 500000, 3455, 3931);
insert into Property (PropertyID, StreetAddress, City, PostalCode, Country, PropertyType, PropertyValue, SellingPrice, OwnerID, EstateAgentID) 
values (9834, '79 Forest Run Alley', 'Manchester', '97670', 'Commercial', 'UK', 800000, 700000, 1342, 2039);
insert into Property (PropertyID, StreetAddress, City, PostalCode, Country, PropertyType, PropertyValue, SellingPrice, OwnerID, EstateAgentID) 
values (5243, '33 Del Mar Park', 'London', '324241', 'UK', 'Commercial', 1000000, 1250000, 6434, 3940);
insert into Property (PropertyID, StreetAddress, City, PostalCode, Country, PropertyType, PropertyValue, SellingPrice, OwnerID, EstateAgentID) 
values (6984, '1 Old Shore Terrace', 'Manchester', '6456345', 'UK', 'House', 400000, 200000, 2342, 9823);

insert into Client (ClientID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (5292, 'Melonie', 'Jojic', '960-793-8570', 'mjojic0@google.com', '7 Roxbury Plaza', 'N’dalatando', '1234235', 'Angola');
insert into Client (ClientID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (9420, 'Peta', 'Pitfield', '280-989-8163', 'ppitfield1@stanford.edu', '85 Sunnyside Drive', 'Satuek', '31150', 'Thailand');
insert into Client (ClientID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (1348, 'Nonnah', 'Newlyn', '330-209-9492', 'nnewlyn2@wordpress.com', '51790 Hanover Park', 'Hanyuan', '2345434', 'China');
insert into Client (ClientID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (1532, 'Aluino', 'Erickssen', '739-534-0509', 'aerickssen3@pen.io', '4 Kings Trail', 'Kawangkoan', '435534', 'Indonesia');
insert into Client (ClientID, FirstName, LastName, Phone, Email, StreetAddress, City, PostalCode, Country) 
values (1539, 'Leshia', 'Jurczik', '273-268-1286', 'ljurczik4@reverbnation.com', '8644 Cambridge Drive', 'Staraya Kulatka', '433940', 'Russia');

insert into Viewings (ViewingID, ViewDate, ViewTime, StaffID, ClientID, PropertyID) 
values (4933, '2020-03-09', '510 PM', 8347, 5292, 9485);
insert into Viewings (ViewingID, ViewDate, ViewTime, StaffID, ClientID, PropertyID) 
values (5948, '2020-09-23', '535 AM', 1356, 9420, 1562);
insert into Viewings (ViewingID, ViewDate, ViewTime, StaffID, ClientID, PropertyID) 
values (2342, '2020-08-02', '1027 PM', 9382, 1348, 9834);
insert into Viewings (ViewingID, ViewDate, ViewTime, StaffID, ClientID, PropertyID) 
values (9924, '2020-08-15', '1120 PM', 1345, 1532, 5243);
insert into Viewings (ViewingID, ViewDate, ViewTime, StaffID, ClientID, PropertyID) 
values (5394, '2021-05-01', '630 AM', 6742, 1539, 6984);

insert into Offer (OfferID, OfferAmount, Accepted, AcceptanceDate, ViewingID, PropertyID, ClientID) 
values (1434, 110000, 'Yes', '2020-03-10', 4933, 9485, 5292);
insert into Offer (OfferID, OfferAmount, Accepted, AcceptanceDate, ViewingID, PropertyID, ClientID) 
values (1435, 230000, 'No', '2020-05-12', 5948, 1562, 1348);
insert into Offer (OfferID, OfferAmount, Accepted, AcceptanceDate, ViewingID, PropertyID, ClientID) 
values (1436, 352000, 'No', '2020-10-21', 9924, 1562, 1348);
insert into Offer (OfferID, OfferAmount, Accepted, AcceptanceDate, ViewingID, PropertyID, ClientID) 
values (1437, 500000, 'No', '2020-7-15', 5394, 6984, 1532);
insert into Offer (OfferID, OfferAmount, Accepted, AcceptanceDate, ViewingID, PropertyID, ClientID) 
values (1438, 900000, 'No', '2021-5-17', 2342, 9834, 1539);

/* 

Some of the questions for this assignment:
1. List all properties located in the city of Manchester with a list price of over £200,000.(5 marks)

2. List all viewings that took place in August or September 2020 and the clients who
requested the viewings. (5 marks)

3. For each owner, list their total portfolio value (i.e. the total of all their properties’
prices) but only for properties which are houses. (10 marks)

4. For each property, list the smallest offer made by clients and which client made the
offer, but only for properties which have not been sold (10 marks

*/

SELECT  from Property
WHERE City = 'Manchester'
AND
PropertyValue = 200000;

SELECT  FROM Viewings
WHERE ViewDate = '2020-08-01'
AND ViewDate = '2020-09-30';

SELECT FirstName, LastName, SUM(PropertyValue)
FROM Owner
JOIN Property
ON Property.OwnerID = Owner.OwnerID
WHERE PropertyType = 'House'
GROUP BY FirstName;

SELECT PropertyID, MIN(OfferAmount), ClientID FROM Offer
WHERE Accepted = 'No' OR Accepted = NULL
GROUP BY PropertyID;
