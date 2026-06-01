/*
Name: Gabriela Balanta
Date: 5-26-2026
Assignment 2.2 Project Manipulating Database Structure 
I forgot to save some of my queries 
so i had to redo them by looking at my prevoius
screenshots and what information i rember altering
*/


/* 2.2 Project  Manipulating Database Structure Task 1 */
    /*check table befor altering*/ 
    Select *
    From productlist;

        /* alter table*/ 
    Alter Table productlist
    Add ( Price number(8,2)
        Description varchar2(300));

    /* update satements*/
    Update productlist P
    Set (Price, Descrtiption) = (
        Select S.PRICE, S.DESCRIPTION
        From storefroint S
        Where S.productcode = P.productcode
    )

    /* check table after altering and updating*/
    Select *
    From productlist;

    /* delete storfront table*/
    Drop Table storefront;



/* 2.2 Project  Manipulating Database Structure Task 2 */
    Create Table ChatLog (
    ChatID number(3),
    ReceiverID number(3),
    SenderID number(3),
    DateSent DATE,
    Content varchar2(250),
    Foreign Key (ReceiverID) References USERBASE(USERID),
    Foreign Key (SenderID) References USERBASE(USERID)
    )
    Insert Into ChatLog Values (1, 101, 102, sysdate, 'Sup fam!');
    Insert Into ChatLog Values (2, 103, 104, sysdate, 'How did the game go?');
    Insert Into ChatLog Values (3, 105, 106, sysdate, 'I had a good day and you?');
    Insert Into ChatLog Values (4, 107, 108, sysdate, 'Did you finish your work?');
    Insert Into ChatLog Values (5, 109, 110, sysdate, 'How was the party?');
    Insert Into ChatLog Values (6, 111, 112, sysdate, 'Got in late night. It was snowing');
    Insert Into ChatLog Values (7, 113, 114, sysdate, 'Hi again!');
    Insert Into ChatLog Values (8, 115, 111, sysdate, 'How did the class reunion go?');
    Insert Into ChatLog Values (9, 106, 113, sysdate, 'The vacation was better than I thought!');
    Insert Into ChatLog Values (10, 107, 103, sysdate, 'I am feelig nice today. How about you?');

    /* show chat log */
    Select *
    From chatlog;



/* 2.2 Project  Manipulating Database Structure Task 3 */
    Create Table FriendList (
    UserID number(3),
    FriendID number(3),
    primary Key (UserID, FriendID),
    Foreign Key (UserID) References USERBASE(USERID),
    Foreign Key (FriendID) References USERBASE(USERID)
    )

    /* insert values to freind list table */
    Insert Into FriendList Values (101, 102);
    Insert Into FriendList Values (103, 104);
    Insert Into FriendList Values (105, 106);
    Insert Into FriendList Values (107, 108);
    Insert Into FriendList Values (109, 110);
    Insert Into FriendList Values (111, 112);
    Insert Into FriendList Values (113, 114);
    Insert Into FriendList Values (115, 111);
    Insert Into FriendList Values (106, 113);
    Insert Into FriendList Values (107, 103);

    /* show friendList table populated */
    Select *
    From FriendList;

/* 2.2 Project  Manipulating Database Structure Task 4 */
    Create Table WishList (
        UserID number(3),
        ProductCode varchar2(5),
        Position number(3),
        primary Key (UserID, ProductCode),
        Foreign Key (UserID) References USERBASE(USERID),
        Foreign Key (ProductCode) References PRODUCTLIST(ProductCode)
        )

    /* fills the WishList tabel with data */  
    Insert Into WishList Values (101, 'GAME4', 5);
    Insert Into WishList Values (102, 'GAME8', 1);
    Insert Into WishList Values (103, 'GAME6', 2);
    Insert Into WishList Values (104, 'GAME9', 3);
    Insert Into WishList Values (107, 'RPG10', 4);
    Insert Into WishList Values (108, 'GAME3', 6);
    Insert Into WishList Values (109, 'GAME2', 7);
    Insert Into WishList Values (110, 'GAME1', 8);
    Insert Into WishList Values (112, 'GAME7', 10);
    Insert Into WishList Values (114, 'GAME5', 9);

    /* checks table to see if data was entered*/
    Select *
    From WishList;

/* 2.2 Project  Manipulating Database Structure Task 5 */
    Create Table UserProfile(
            UserID number(3),
            ImageFile varchar2(250),
            Description varchar2(250),
            primary Key (UserID),
            Foreign Key (UserID) References USERBASE(USERID)
            )

    /* inserts data into UserProfile table*/
    Insert Into UserProfile Values (101, 'A_picture_of_a_purple_flower_in_a_glass_vase.jpeg', 'I am Ash1996 and this is my profile. I like action games <3');
    Insert Into UserProfile Values (102, 'A_picture_of_a_robot_with_four_arms_with_a_green_glow_coming_from_behind.png', 'Sup! I like gaming and chickens - xCoopX');
    Insert Into UserProfile Values (103, 'A_picture_of_a_two_people_walking_away_into_a_sunset.png', 'Gravey here! Stay frosty - COD:MW');
    Insert Into UserProfile Values (104, 'A_picture_of_a_cat_sleeping_on_a_dog.png', 'HI! :) Cool is the name and the game is the game.');
    Insert Into UserProfile Values (105, 'A_picture_of_Optimus_Prime_standing_over_Sentinel_Prime.jpeg', 'Am I your son? His son? Her Son? No I am Wills_Son');
    Insert Into UserProfile Values (106, 'A_picture_of_a_crown_adorned_with_jewels_sitting_on_a_red_velvet_pillow.png', 'You know who I am but what am I? a KING!');
    Insert Into UserProfile Values (107, 'A_picture_of_Michael_Jackson_performing_on_stage.png', 'Hey there! its ya pal XxSwordSmithXx');
    Insert Into UserProfile Values (108, 'A_picture_of_Cell_from_Dragon_Ball_Z.png', 'How perfect?');
    Insert Into UserProfile Values (109, 'A_picture_of_Princess_Leia_wielding_a_blaster.jpeg', 'Who needs a Death Star when you have a princess! xoxo ;)');
    Insert Into UserProfile Values (110, 'A_picture_of_Alexander_the_Great.png', 'All roads lead to Marcus!');
    Insert Into UserProfile Values (111, 'A_picture_of_a_blue_flame_with_a_black_background.jpeg', 'Soul_Searcher dont forget the name.');
    Insert Into UserProfile Values (112, 'A_picture_of_the_Queen_of_Hearts_from_Alice_in_Wonderland.png', 'Might make someone paint white roses red. lol');
    Insert Into UserProfile Values (113, 'A_picture_of_the_Warden_from_Minecraft.png', 'Dont let me keep ya! ha ha get it cus my name is WardenKeeper');
    Insert Into UserProfile Values (114, 'A_picture_of_Spider-Man.jpeg', 'With great power comes great responsiblity.- Uncle Ben');
    Insert Into UserProfile Values (115, 'A_picture_of_a_wolf_howling_at_the_moon.jpeg', 'When the sun is down, the Howlerwolf comes out. rawr xD');

    /* checks UserProfile table for data */
    Select *
    From UserProfile
    Order By UserID ASC;

/* 2.2 Project  Manipulating Database Structure Task 6 */
    Create Table SecurityQuestion (
        QuestionID number Primary Key,
        UserID number(3),
        Question varchar2(250),
        Answer varchar2(250),
        Foreign Key (UserID) References userbase(UserID)
        );

    /* used to insert user realted data into the Security question table*/ 
    Insert Into SecurityQuestion Values (1, 101, 'What was the name of your first pet?', 'Ralff');
    Insert Into SecurityQuestion Values (2, 102, 'Where were you born?', 'Ohio, Earth');
    Insert Into SecurityQuestion Values (3, 103, 'What is your mothers maiden name?', 'Stewart');
    Insert Into SecurityQuestion Values (4, 104, 'What street did you grow up on?', 'Elmert St');
    Insert Into SecurityQuestion Values (5, 105, 'How did you lose your first tooth?', 'Football to face');
    Insert Into SecurityQuestion Values (6, 106, 'What is your grandmothers madien name?', 'Smith');
    Insert Into SecurityQuestion Values (7, 107, 'Where was your father born?', 'New York New York');
    Insert Into SecurityQuestion Values (8, 108, 'When did you learn to ride a bike?', 'Age 7');
    Insert Into SecurityQuestion Values (9, 109, 'Who was your first friend?', 'My brother');
    Insert Into SecurityQuestion Values (10, 110, 'Which celebrity do you look like the most?', 'Justin Bieber');
    Insert Into SecurityQuestion Values (11, 111, 'What is your favorite movie?', 'Transformers(1984)');
    Insert Into SecurityQuestion Values (12, 112, 'What was your first car?', 'Honda Civic');
    Insert Into SecurityQuestion Values (13, 113, 'What was the name of your childhood stuffed animal?', 'Whiskers');
    Insert Into SecurityQuestion Values (14, 114, 'What day were you born on?', 'Tuesday');
    Insert Into SecurityQuestion Values (15, 115, 'What is your favorite food?', 'Pizza');

    /* checks the the info was inserted into the SecurityQuestion table */
    Select *
    From SecurityQuestion;

/* 2.2 Project  Manipulating Database Structure Task 7 */
    Create Table CommunityRules (
        RuleNum number(3) Primary Key,
        Title varchar2(250),
        Description Varchar2(250),
        Severitypoint Number(4)
        );

    /* inserts data into the CommunityRules table */
    Insert Into CommunityRules Values (1, 'Golden Rule', 'Treat others the way you would want to be treated!', 10);
    Insert Into CommunityRules Values (2, 'No hate speach', 'Do not target others based on ethnicity, gender, and/or sexuality', 10);
    Insert Into CommunityRules Values (3, 'No begging', 'Do not excessively beg for things in chat', 3);
    Insert Into CommunityRules Values (4, 'No spaming', 'Do not spam the chat with messages', 4);
    Insert Into CommunityRules Values (5, 'Limit trading', 'Limit trading messages to one every 10-15 minutes', 3);
    Insert Into CommunityRules Values (6, 'Keep things descent', 'No sexually explicit messages are to be sent in chat.', 8);
    Insert Into CommunityRules Values (7, 'No brainrot', 'Try to avoid sending brainrot in the chat', 5);
    Insert Into CommunityRules Values (8, 'No political talk', 'Try to avoid mentioning politics in the chat', 7);
    Insert Into CommunityRules Values (9, 'Stay active', 'Try to stay active in game and let others know when you have gone AFK.', 2);
    Insert Into CommunityRules Values (10, 'Have fun!', 'Try to have fun and enjoy the game.', 1);

    /* shows CommunityRules table to check that it is populated */
    Select *
    From CommunityRules;


/* 2.2 Project  Manipulating Database Structure Task 8 */
    Create Table Infractions (
        InfractionID number Primary Key,
        UserID number(3),
        RuleNum number(3),
        DateAssigned date,
        Penalty varchar2(250),
        Foreign Key (Userid) References userbase(UserID),
        Foreign Key (RuleNum) References communityrules(RuleNum)
        );
    /* puts data into the Infractions table */
    Insert Into Infractions Values (1, 107, 3, sysdate, '1 hour ban from from game chat');
    Insert Into Infractions Values (2, 105, 4, sysdate, '2 hour ban from from public game lobbies');
    Insert Into Infractions Values (3, 104, 8, sysdate, '12 hour ban from from game chat');
    Insert Into Infractions Values (4, 106, 10, sysdate, 'Remider to keep calm, this is a game. Take a break and come back with a clear head');
    Insert Into Infractions Values (5, 113, 7, sysdate, '3 hour ban from from public game lobbies');
    Insert Into Infractions Values (6, 113, 2, sysdate, 'User is locked out of account for 24 hours, if the incident is repeated they will be permanently banned form the game');
    Insert Into Infractions Values (7, 107, 6, sysdate, '4 hour ban from from public game lobbies and note on account satating the infraction');
    Insert Into Infractions Values (8, 102, 1, sysdate, 'Be Nice to others. 8 hour ban from from public game lobbies.');
    Insert Into Infractions Values (9, 115, 6, sysdate, 'Remider: Keep things decent! 4 hour ban from from public game lobbies');
    Insert Into Infractions Values (10, 110, 4, sysdate, '1 hour ban from from public game chat');

    /*checks table */
    Select *
    From Infractions;
    

/* 2.2 Project  Manipulating Database Structure Task 9 */
    Create Table UserSupport (
        TicketID Number Primary Key,
        Email varchar2(250),
        Issue varchar2(250),
        DateSubmitted date,
        DateUpdated date,
        Status varchar2(250)
        );
    
    /* inserts info into the UserSupport table*/
    Insert Into UserSupport Values (1, 'RHOffice@gmail.com', 'Locked out of game for 24 hours. I was due to a comunity rule violation', sysdate, sysdate, 'CLOSED');
    Insert Into UserSupport Values (2, 'EllieJo@gmail.com', 'Could not view chat even though she was not banned from it.', sysdate, sysdate, 'NEW');
    Insert Into UserSupport Values (3, 'C_Hero@gmail.com', 'Chracter glicthed through map.', sysdate, sysdate, 'IN PROGRESS');
    Insert Into UserSupport Values (4, 'MattWilson@yahoo.com', 'Could not load website, he did not have cookies enabled', sysdate, sysdate, 'CLOSED');
    Insert Into UserSupport Values (5, 'GreenM@gmail.com', 'Game crashed and error message showed explorer.exe has stopped working.', sysdate, sysdate, 'IN PROGRESS');
    Insert Into UserSupport Values (6, '92Gavin@yahoo.com', 'His payment did not show up on his acctout even though his card was charged.', sysdate, sysdate, 'NEW');
    Insert Into UserSupport Values (7, 'BrianKim1998@gmail.com', 'Host migration due to sudden network disconnect ', sysdate, sysdate, 'NEW');
    Insert Into UserSupport Values (8, 'RonyBrooks@gmail.com', 'Game crashed due to corrupted files.', sysdate, sysdate, 'CLOSED');
    Insert Into UserSupport Values (9, 'Smith.Smith2@gmail.com', 'Failed login. User name is case sensitive.', sysdate, sysdate, 'CLOSED');
    Insert Into UserSupport Values (10, 'CoolGuy@gmail.com', 'Game closed suddenly. Reason unknown.', sysdate, sysdate, 'IN PROGRESS');

    /* shows table to check if data was entered */
    Select *
    From  UserSupport;

/* 2.2 Project  Manipulating Database Structure Task 9 */
   /* makes a view for unique security questions*/
   Create View Unique_Questions AS
   Select Distinct Question
   From SecurityQuestion;

   /*checks Unique Questions view*/
    Select*
    From Unique_Question;

    /*makes a view for tickets that are active*/
    Create View Active_Tickets AS
    Select ticketID,
        Email,
        Issue,
        DateUpdated
    From UserSupport
    Where Status In ('NEW', 'IN PROGRESS')
    Order By DateUpdated;

    /* checks view for data*/
    Select*
    From Unique_Question;

