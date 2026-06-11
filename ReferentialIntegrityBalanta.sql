/* 
Name: Gabriela Balanta
Date: 6-04-2026
Assignment: 3-2 Project 
*/

/* 3.2 Project Adding Referential Integrity Balanta Question 1*/
    
    /* foreign key constraint on orders table*/
    Alter Table Orders
    Add Constraint FK_Orders_User
    Foreign Key (USerId)
    References UserBase(UserId);

    Alter Table Orders     /* adds ri for the products */
    Add Constraint FK_Orders_Product
    Foreign Key (ProductCode)
    References ProductList(ProductCode);
    
    /* foreign key constraint on reviews table*/
    Alter Table Reviews
    Add Constraint FK_Reviews_User
    Foreign Key (USerId)
    References UserBase(UserId);

    Alter Table Reviews
    Add Constraint FK_Reviews_Product
    Foreign Key (ProductCode)
    References ProductList(ProductCode);

    /* foreign key constraint on user library table*/
    Alter Table UserLibrary
    Add Constraint FK_Library_User
    Foreign Key (USerId)
    References UserBase(UserId);

    Alter Table UserLibrary
    Add Constraint FK_Library_Product
    Foreign Key (ProductCode)
    References ProductList(ProductCode);

/* 3.2 Project Adding Referential Integrity Balanta Question 2*/
    Select FirstName || ' ' || LastName As FullName,
           Username
    From UserBase
    Where Months_Between(sysdate, Birthday) / 12 >= 18;

/* 3.2 Project Adding Referential Integrity Balanta Question 3*/
    Select MAX(Length(UserName)) As Max_Username_Length,   /* max is used to find the highest amount of chracters in a user name*/
           AVG(Length(Username)) As Avg_Username_Length        /* avg is used to find the average amount of chracters in a user name*/
    From UserBase;

/* 3.2 Project Adding Referential Integrity Balanta Question 4*/
    Select Question
    From SecurityQuestion
    Where Question LIKE 'What is%'  /*looks for questions that match the criteria */
            OR Question LIKE 'What was%';

/* 3.2 Project Adding Referential Integrity Balanta Question 5*/
    Select Productcode,
           MIN(Rating) AS Lowest_Rating, /*gets the lowest rating of a game */
           COUNT(*) AS Review_Count
    From Reviews
    Group By ProductCode
    Order BY Review_Count DESC;

/* 3.2 Project Adding Referential Integrity Balanta Question 6*/
    Select ProductCode,
           COUNT(*) AS  User_Count
    From WishList
    Where Position = 1   /*i only put a game down once when i was adding data to the wishlist table */
    Group By ProductCode;

/* 3.2 Project Adding Referential Integrity Balanta Question 7*/
    Select UserId,
           SUM(Price) AS Total_Spent 
    From Orders
    Group By UserId;

/* 3.2 Project Adding Referential Integrity Balanta Question 8*/
    Select PurchaseDate,
           SUM(Price) AS Gross_Profit
    From Orders
    Group By PurchaseDate
    Order By Gross_Profit DESC;

/* 3.2 Project Adding Referential Integrity Balanta Question 9*/
    Select ProductCode,
           SUM(HoursPlayed) AS Total_hours
    From Userlibrary
    Group By ProductCode
    Order By Total_Hours DESC
    Fetch First 5 Rows ONLY;

/* 3.2 Project Adding Referential Integrity Balanta Question 10*/
    Create OR Replace VIEW VW_User_Infractions AS
    Select UserId,
           COUNT(*) AS Infraction_Count
    From Infractions
    Group By userId
    Order By Infraction_Count DESC;

/* 3.2 Project Adding Referential Integrity Balanta Question 11*/
    Create OR Replace VIEW VW_Rule_Breaks AS
    Select UserId,
           RuleNum,
           COUNT(*) As Rule_Count
    From Infractions
    Group By UserId, RuleNum
    Order By UserId;

/* 3.2 Project Adding Referential Integrity Balanta Question 12*/
    Select RuleNum,
           Penalty,
           COUNT(*) AS Penalty_Count /*checks to see if penalties are reasonable*/
    From Infractions
    Where Penalty IS NOT NULL
    Group By RuleNum, Penalty
    Order By RuleNum;

/* 3.2 Project Adding Referential Integrity Balanta Question 13*/
    Select AVG(DateUpdated - DateSubmitted) AS Avg_Days,
           MAX(DateUpdated - DateSubmitted) AS Max_Days,    /* looks fo the amount of days it took to solve a ticket */
           MIN(DateUpdated - DateSubmitted) AS Min_Days
    From UserSupport
    Where Status = 'CLOSED';/* i had to change the date uppdated info for two of the issues(ticket id 1 and 8)
 so that some information would show up*/

/* 3.2 Project Adding Referential Integrity Balanta Question 14*/
    Select Email,
           Issue,
           COUNT(*) AS Issue_Count
    From UserSupport
    Where Status = 'NEW'   /*looks for helps tickets that are new*/
    Group By DateSubmitted, Email, Issue
    Order By Issue_Count;

/* 3.2 Project Adding Referential Integrity Balanta Question 15*/
    Select UserId,
           FirstName,
           LastName,
           Password
    From UserBase
    Where UPPER(Password) LIKE '%' || UPPER(FirstName) || '%'
          OR UPPER(Password) LIKE '%' || UPPER(LastName) || '%';
    /*looks to see if either a persons first or last name is in their password*/ 

/* 3.2 Project Adding Referential Integrity Balanta Question 16*/
    Select Publisher,
           AVG(Price) AS Average_Price
    From ProductList        /* the store front table was dropped in week 2 so i would only use the product list table*/
    Group By Publisher
    Order By Publisher;

/* 3.2 Project Adding Referential Integrity Balanta Question 17*/
    Create OR Replace VIEW VW_Discount_Products AS
    Select ProductName,
           ROUND(Price * 0.75, 2) AS Discounted_Price
    From ProductList
    Where ReleaseDate <= ADD_MONTHS(sysdate, -60);

/* 3.2 Project Adding Referential Integrity Balanta Question 18*/
    Select Genre,
           MAX(Price) AS Max_Price,
           MIN(Price) AS Min_Price
    From ProductList
    Group By Genre
    Order By Genre;

/* 3.2 Project Adding Referential Integrity Balanta Question 19*/
    Create OR Replace VIEW VW_Recent_Chatlog AS
    Select *
    From ChatLog
    Where DateSent BETWEEN sysdate - 7 AND sysdate;

/* 3.2 Project Adding Referential Integrity Balanta Question 20*/
    Create OR Replace VIEW VW_Recent_Penalties AS
    Select UserId,
           DateAssigned,
           Penalty
    From Infractions
    Where Penalty IS NOT NULL
          AND DateAssigned >= ADD_MONTHS(sysdate, -1);


