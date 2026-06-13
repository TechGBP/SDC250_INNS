/*
Name: Gabriela Balanta
Date: 6-12-2026
Assignment 4.2 Project Manipulating Database Structure 
*/

/*4.2 Project Displaying Relational Data Balanta Question 1*/
    Select u.UserName,
        MIN(r.Rating) AS Lowest_Rating,  /*shows the lowet review left but a user and the review score*/
    From UserBAse u
    JOIN Reviews r ON u.UserId = r.UserId
    Group By u.UserName;

/*4.2 Project Displaying Relational Data Balanta Question 2*/
    Select u.Email,
        s.Question,  /*shows a users email, their secuirty question and the answer to the question*/
        s.Answer
    From UserBase u
    JOIN SecurityQuestion s ON u.UserId = s.UserId;

/*4.2 Project Displaying Relational Data Balanta Question 3*/
    Select FirstName,
        Email,  /*shows a user first name, their email, and their wallet balance if the do not have a wishlist item*/
        WalletFunds
    From UserBase
    Where UserId NOT IN
    (
        Select UserId
        From WishList
    );

/*4.2 Project Displaying Relational Data Balanta Question 4*/
    Select u.UserName,
        COUNT(o.ProductCode) AS Product_Count     /*shows a user and the amount of products they bought*/
    From UserBase u
    JOIN Orders o ON u.UserId = o.UserId
    Group By u.UserName;

/*4.2 Project Displaying Relational Data Balanta Question 5*/
    Select DISTINCT FLOOR(MONTHS_BETWEEN(sysdate, u.Birthday)/12) AS Age   /*shows the age of a user who bought a game in the lset 6 months*/
    From UserBase u
    JOIN Orders o ON u.UserId = o.UserId
    Where o.PurchaseDate >= ADD_MONTHS(sysdate, -6);
    /*there is no data because it is 2026 and the users bought thier games in 2022*/ 

/*4.2 Project Displaying Relational Data Balanta Question 6*/
    Select UserName,
        Birthday   /*shows the birthday and username of the user who has the most friends */
    From UserBase
    Where userId =
    (
        Select UserId
        From (
            Select UserId,
                COUNT(*) Friend_Count
            From FriendList
            Group By UserId
            Order By Friend_Count DESC
        )
        Where RowNum = 1
    );

/*4.2 Project Displaying Relational Data Balanta Question 7*/
    Select DISTINCT p.ProductName,  
        p.ReleaseDate,   /*shows the infrmation(product name, product release date, product price, and the product description) of any games in the wishlist table*/
        p.Price,
        p.Description
    From ProductList p
    JOIN WishList w ON p.ProductCode = w.ProductCode;

/*4.2 Project Displaying Relational Data Balanta Question 8*/
    Select p.ProductName,
        MAX(r.Rating) AS Highest_Rating,  /*shows the review count and highest rating of each game along with the games name*/ 
        COUNT(*) AS Review_Count
    From ProductList p
    JOIN Reviews r ON p.ProductCode = r.ProductCode
    Group By p.ProductName
    Order By Highest_Rating DESC;

/*4.2 Project Displaying Relational Data Balanta Question 9*/
    Create OR Replace VIEW VW_Product_Rating AS   /* makes/replaces view to show games that have either a 1 or 5 as a rating*/
    Select p.ProductName,
        p.Genre,
        r.Rating
    From ProductList p
    JOIN Reviews r ON p.ProductCode = r.ProductCode
    Where r.Rating IN (1,5)
    Order By r.Rating ASC;

/*4.2 Project Displaying Relational Data Balanta Question 10*/
    Select p.Genre,
        COUNT(*) AS Product_Count    /*show product count shorted by genre */
    From Orders o
    JOIN ProductList p ON o.ProductCode = p.ProductCode
    Group By p.Genre
    Order By p.Genre;

/*4.2 Project Displaying Relational Data Balanta Question 11*/
    Create OR Replace VIEW VW_Publisher_Stats AS
    Select p.Publisher,
        AVG(p.Price) AS Avg_Price,
        SUM(u.HoursPlayed) AS Total_Hours
    From ProductList p
    JOIN UserLibrary u ON p.ProductCode = u.ProductCode
    Group By p.Publisher;

/*4.2 Project Displaying Relational Data Balanta Question 12*/
    Select p.Publisher,
        SUM(o.Price) AS Total_Spent    /*shows the total spent and the publisher*/ 
    From Orders o
    JOIN ProductList p ON o.ProductCode = p.ProductCode
    Group By p.Publisher
    Order By Total_Spent DESC;

/*4.2 Project Displaying Relational Data Balanta Question 13*/
    Select s.TicketId,
        u.UserName,  /*shows information(support ticket id, user ticket was assigned to, the user email and ticket issue) on any new or in progress help tickets*/
        s.Email,
        s.Issue
    From UserSupport s
    JOIN UserBase u ON s.Email = u.Email
    Where UPPER(s.Status) IN ('NEW', 'IN PROGRESS')
    Order By s.DateUpdated DESC;

/*4.2 Project Displaying Relational Data Balanta Question 14*/
    Select u.UserName,
        COUNT(s.TicketId) AS Ticket_Count  /*shows tickets that were submmited for help*/
    From UserBase u
    JOIN UserSupport s ON u.Email = s.Email
    Group By u.UserName;

/*4.2 Project Displaying Relational Data Balanta Question 15*/
    Select DISTINCT u.UserId,  /*finds emails that have ther persons first or last name*/
        s.Email
    From UserBase u
    JOIN UserSupport s ON u.Email = s.Email
    Where LOWER(s.Email) LIKE '%' || LOWER(u.FirstName)|| '%'
        OR LOWER(s.Email) LIKE '%' || LOWER(u.LastName)|| '%'
        OR LOWER(s.Email) LIKE '%' || LOWER(u.FirstName)|| LOWER(u.LastName) || '%';

/*4.2 Project Displaying Relational Data Balanta Question 16*/
    Select DISTINCT s.Email      
    From UserSupport s      /*shows emails that are not found in user base*/
    Where UPPER(s.Status) IN ('NEW', 'IN PROGRESS')
        AND s.Email NOT IN (
            Select Email     /*it should not come back with data becuase i only used email on the userbase*/ 
            From UserBase
        );

/*4.2 Project Displaying Relational Data Balanta Question 17*/
    Select s.TicketId,
        u.FirstName,   /*shows information(support ticket id, users first name, users last name, and username) of user that have a support ticket*/
        u.LastName,
        u.Username
    From UserSupport s
    JOIN Userbase u ON s.UserId = u.UserId
    Where LOWER(s.Issue) LIKE '%' || LOWER(u.UserName) || '%';

/*4.2 Project Displaying Relational Data Balanta Question 18*/
    Select DISTINCT u.UserName, 
        u.PassWord    /*shows the usernames and passswords assisiated with the emails with a ticket in the user support table*/
    From UserBase u
    JOIN UserSupport s ON u.Email = s.Email;

/*4.2 Project Displaying Relational Data Balanta Question 19*/
    Create OR Replace VIEW VW_Recent_Penalties AS
    Select u.UserName,
        i.DateAssigned, /*shows the date a penalty was given on*/
        i.Penalty
    From UserBase u
    JOIN Infractions i ON u.UserId = i.UserId
    Where i.Penalty IS NOT NULL
        AND i.DateAssigned >= ADD_MONTHS(sysdate,-1);

/*4.2 Project Displaying Relational Data Balanta Question 20*/
    Select u.UserName,
        Email     /*shows user 18 or older with infraction in the last 4 months*/
    From UserBase u
    Where FLOOR(MONTHS_BETWEEN(sysdate, u.Birthday)/12) >= 18
        AND NOT EXISTS (
            Select UserId
            From Infractions
            Where DateAssigned >= ADD_MONTHS(sysdate,-4)
        );  /*every user 18 or older has an infraction*/

/*4.2 Project Displaying Relational Data Balanta Question 21*/
    Select u.UserName,
        i.DateAssigned,    /*shows users who have violated community guidelines*/
        i.RuleNum ||''||
        c.Title AS Guideline
    From UserBase u
    JOIN Infractions i ON u.UserId = i.UserId
    JOIN CommunityRules c ON i.RuleNum = c.RuleNum;

/*4.2 Project Displaying Relational Data Balanta Question 22*/
    Select u.UserId,
        u.UserName,  /*shows the severity points of users */
        u.Email,
        SUM(c.SeverityPoint) AS Toatl_Severity
    From Userbase u
    JOIN Infractions i ON u.UserId = i.UserId
    JOIN CommunityRules c ON i.RuleNum = c.RuleNum
    Group By u.UserId,
            u.UserName,
            u.Email

/*4.2 Project Displaying Relational Data Balanta Question 23*/
    Select c.Title,
        c.Description, /*shows community rules, their title, and their descriptions */
        i.Penalty
    From CommunityRules c
    JOIN Infractions i ON c.RuleNum = i.RuleNum
    Where i.Penalty IS NOT NULL;

/*4.2 Project Displaying Relational Data Balanta Question 24*/
    Select u.UserName,   /*check to see if users have 15 or more infractions*/
        COUNT(*) AS Infraction_Count
    From UserBase u
    JOIN Infractions i ON u.UserId = i.UserId  /*there are no user who have more than 15 infractions*/
    Group By u.UserName
    HAVING COUNT(*) >= 15; 

