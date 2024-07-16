create database social_media;
use social_media;

create table location (
location_id int primary key,city varchar(255),state varchar(255),zipcode varchar(255), country varchar(255)
 );

 
 create table userProfile(
 userprofile_id int,user_id int,firstName varchar(255),lastName varchar(255),location_id int, gender varchar(255),dob date,
 occupation varchar(255),about varchar(255),dateUpdated datetime,
 FOREIGN KEY (user_id) REFERENCES users(user_id), foreign key (location_id) references location(location_id)
 );


 create table users (
user_id int primary key,userName varchar(255),Email varchar(255),password varchar(255), passwordsalt varchar(255),
dateRegistered datetime,usertype varchar(255),accountStatus varchar(255)
 );
 
 
 create table followingRelationships  (
 followingRelationships_id int primary key,user_id int ,dateFollowed datetime,
 foreign key (user_id) references users(user_id));

 create table postComments(
 postComment_id int primary key,post_id int,commentText varchar(255),dateCommented datetime,user_id int,
 foreign key (post_id) references posts(post_id),foreign key (user_id) references users(user_id));
 
 create table userSettings(
 userSettings_id int primary key,notificationNewsSellter enum('on','off'),
 notificationFollowers enum('on','off'),notificationComments enum('on','off'),
 notificationMessage enum('on','off'),user_id int,
 foreign key (user_id) references users(user_id)
 );
 
 create table externalAccounts(
 user_external_id int primary key,facebookEmail varchar(255),twitterUerName varchar(255),
 user_id int ,foreign key (user_id) references users(user_id)
 );
 
 create table posts (
 post_id int primary key,user_id int ,title varchar(255),content varchar(255),
 status varchar(255),datepublished datetime,foreign key (user_id) references users(user_id)
 );
 create table postStats(
 post_stats_id int primary key,post_id int, viewCount int,
 foreign key (post_id) references posts(post_id)
 );
 create table postFavorities(
 post_fav_id int primary key,post_id int,user_id int,dateFavorited datetime,
 foreign key (post_id) references posts(post_id),foreign key (user_id) references users(user_id)
 );
 
 create table tags (
 tag_id int primary key,tagg varchar(255));
 
 create table postTags(
 post_tag_id int primary key,post_id int,tag_id int,
 foreign key (post_id) references posts(post_id),foreign key (tag_id) references tags(tag_id));
 
 create table postCatagories(
 post_catagory_id int primary key,post_id int,catagory_id int ,
 foreign key (post_id) references posts(post_id),foreign key (catagory_id) references catagories(catagory_id));
 
 
 create table catagories(
 catagory_id int primary key,catagory varchar(255));
 

 insert into location value
 (1,"sirohi","rajasthan","307001","india"),
 (2,"jaipur","gujrat","307002","u.k"),
 (3,"pune","maharashtra","307003","japan"),
 (4,"dehli","dehli","307004","india"),
 (5,"mathura","u.p","307005","india");
 
 
insert into users values
(1,"pradeep","p@gmail.com","12@12","12@12","2008-11-11 13:23:44","account","run"),
(2,"harsh","h@gmail.com","34@12","34@12","2009-11-11 14:23:44","business","stop"),
(3,"ramesh","r@gmail.com","56@12","56@12","2008-12-11 15:23:44","dance","run"),
(4,"navin","n@gmail.com","56@12","56@12","2010-06-11 11:23:44","online","stop"),
(5,"sita","s@gmail.com","78@12","78@12","2009-11-11 14:23:44","business","run");
   

 
insert into userProfile values
(1,1,"pradeep","sain",1,"M",'2008-11-12','influncer',"hello ji","2008-12-11 15:23:44"),
(2,2,"harsh","ag",2,"F",'2009-04-02','engineer',"hello ji","2008-12-11 15:23:44"),
(3,3,"ramesh","kumawat",3,"M",'2006-05-01','dance',"hello ji","2008-12-11 15:23:44"),
(4,4,"navin","sain",4,"M",'2016-06-13','account',"hello ji","2008-12-11 15:23:44"),
(5,5,"sita","ag",1,"F",'2006-05-01','labor',"hello ji","2008-12-11 15:23:44");


 insert into userSettings values 
 (1,'on','off','on','on',1),
 (2,'off','on','on','off',2),
 (3,'on','on','on','on',3),
 (4,'off','off','off','off',4),
 (5,'off','on','on','on',5);



insert into externalAccounts values
(1,'p@gmail.com','pradeep_1',1),
(2,'h@gmail.com','harsh_1',2),
(3,'r@gmail.com','ramesh_1',3),
(4,'n@gmail.com','navin_1',4),
(5,'s@gmail.com','sita_1',5);



insert into followingRelationships values
(1,1,"2008-11-11 13:23:44"),
(2,2,"2009-06-02 15:23:44"),
(3,1,"2008-12-08 13:23:44"),
(4,3,"2006-01-11 10:23:44"),
(5,2,"2010-07-11 13:23:44"),
(6,4,"2008-11-11 13:23:44"),
(7,5,"2016-03-07 11:23:44");



insert into posts values
(1,1,"home pooja","hello ji","submitted","2008-07-11 13:23:44"),
(2,2,"festival","hii ji","draft","2008-11-11 05:23:44"),
(3,1,"diwali","hello ji","pending","2006-05-11 11:23:44"),
(4,3,"holi",'hii jii',"submitted","2008-11-11 13:23:44"),
(5,3,"rakhi","hello jii","draft","2009-02-11 15:23:44"),
(6,4,"holiday","hiii jii","submitted","2010-02-05 13:23:44"),
(7,5,"celebrate","hello jii","pending","2008-11-11 13:23:44");



 insert into postFavorities values
 (1,1,1,"2008-07-10 08:23:44"),
 (2,2,2,"2008-03-11 06:23:44"),
 (3,1,1,"2008-07-11 13:23:44"),
 (4,3,1,"2008-06-10 14:23:44"),
 (5,4,3,"2008-05-02 15:23:44"),
 (6,5,4,"2008-04-13 10:23:44"),
 (7,6,5,"2008-11-11 11:23:44"),
 (8,7,4,"2008-12-01 12:23:44");
 

 insert into postComments values
 (1,1,"good","2008-12-01 10:23:44",1),
 (2,2,"awsome","2006-01-01 12:23:44",2),
 (3,1,"nice","2008-03-10 09:23:44",3),
 (4,3,"good","2008-12-16 13:23:44",2),
 (5,4,"fantastic","2008-07-07 16:23:44",4),
 (6,5,"nice","2008-10-28 12:23:44",1),
 (7,6 ,"awsome","2008-11-30 13:23:44",5),
 (8,7,"fantastic","2008-12-01 10:23:44",3);
 
  insert into postComments values
  (9,2,"good","2008-12-01 10:23:44",2);
 

 
insert into postStats values 
(1,1,302),(2,2,402),(3,3,102),(4,4,502),(5,5,10),(6,6,100),(7,7,200);



insert into postCatagories value
(1,1,1),(2,2,2),(3,1,3),(4,2,2),(5,4,5),(6,5,2),(7,6,4),(8,7,5);

insert into postTags value
(1,1,1),(2,2,2),(3,1,3),(4,2,2),(5,4,5),(6,5,2),(7,6,4),(8,7,5);

 insert into catagories values
 (1,"reel"),(2,"dance"),(3,"music"),(4,"culture"),(5,"poem");
 

 
 insert into tags values
 (1,"#dance"),(2,"music"),(3,"like"),(4,"comment"),(5,"share");
 
 --  query execution start -- 
 
 -- 1.Get all the post comments associated with userid=2
 select pc.commentText from posts po
 inner join postComments pc on po.post_id=pc.post_id
 inner join users us on us.user_id=po.user_id
 where us.user_id=2;
 
 -- 2.Get all the tags asccociated with a postcomments with id =1
 select tg.tagg from postTags pt
 inner join tags tg on tg.tag_id=pt.tag_id
 inner join posts po on po.post_id=pt.post_id
 inner join postComments pc on po.post_id=pc.post_id
 where  pc.postComment_id=1;
 
 -- 3.Get the count of the postcomments done whose categoryId is 2
 select count(pct.postComment_id) as count  from postComments pct
 inner join posts po on po.post_id=pct.post_id
 inner join postCatagories  pc on po.post_id=pc.post_id
 inner join catagories cat on cat.catagory_id=pc.catagory_id
 where cat.catagory_id=2;

 
 -- 4.Get all the locations of the users in India
 select city,state,country from location 
 where country="india";
 
 -- 5 PostcommentId is 5, get the user details associated with that and also 
 -- show whether that user is associated with external account or not
 
 select u.user_id,u.userName,u.Email,e.user_external_id from postComments pc 
 inner join users u on pc.user_id=u.user_id
 inner join externalAccounts e on u.user_id=e.user_id
 where pc.postComment_id=5;
 
 -- 6. Get the Username of all the users who belongs to Jaipur 
 select us.userName from  users us 
 inner join userProfile up  on us.user_id=up.user_id
 inner join location loc on loc.location_id=up.location_id
 where loc.city ="jaipur";
 
-- 7.Get all the recent posts of this current month
select * from posts
where  month(datepublished)= 02
order  by  datepublished desc ;


-- 8. Show the userdetails which have maximum views
select max( ps.viewCount) as maxView,us.user_id,us.userName,us.Email from posts po
inner join postStats ps on po.post_id=ps.post_id
inner join users us on us.user_id=po.user_id
group by us.user_id
order by maxView desc
limit 1;

-- 9.Show the count of users which notificationComments setting "OFF" 

select count(u.userName) from users u
inner join userSettings us on u.user_id=us.user_id
where notificationComments='off';

-- 10.Show all the posts and its associated comments associated with a User Id 3

 select po.post_id,po.title,po.content,po.status,pc.commentText from posts po
 inner join users us on us.user_id=po.user_id
 inner join postComments pc on po.post_id=pc.post_id
 where us.user_id=3;


-- 11 Create a view for showing the tags associated with a post
create view showPost as
select tg.tagg from tags as tg 
inner join postTags pt on tg.tag_id=pt.tag_id
inner join posts po on po.post_id=pt.post_id;

select * from showPost;

-- 12  Create a view for showing the post and show the post comments count associated with each
create view showPostAndComment as
select ps.post_id,ps.title,ps.content,ps.status ,count(pc.postComment_id) from posts ps
inner join postComments pc on ps.post_id=pc.post_id
group by ps.post_id;

select * from showPostAndComment ;

-- 13  Create a procedure that takes the user id as parameter and output its favorite posts

DELIMITER $$
CREATE PROCEDURE favPost(in user_id int)
begin
  select post_fav_id,dateFavorited from postFavorities pf
  inner join posts po on po.post_id=pf.post_id
  inner join users us on us.user_id=po.user_id
  where us.user_id=user_id;
 

end $$
DELIMITER ;
call favPost(2);

-- 14 Create a function that takes gender as input and shows all 10 posts created by this gender recently 
DELIMITER $$
CREATE PROCEDURE showPost(in gender varchar(255))
begin
select po.post_id,po.title,po.content,po.status,po.datepublished from posts po
inner join userProfile up on up.user_id=po.user_id
where up.gender=gender
order  by  datepublished desc 
limit 10;
end $$
DELIMITER ;
call showPost('m');


-- 15 Create a trigger that shows the total number of external user accounts 
-- as soon as any external account is added into User table 
DELIMITER $$
create trigger totalNumber after insert 
on users for each row 
begin
DECLARE errorMessage VARCHAR(255);

  select count(user_external_id) into errorMessage from externalAccounts;
         SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = errorMessage;

end $$
DELIMITER ;
insert into users values
(6,"ravina",'r@gmail.com','89@12','89@12',"2010-06-11 11:23:44","online","stop");
