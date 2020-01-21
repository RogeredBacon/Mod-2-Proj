# Mod-2-Project

## Module 2 Project Pitch

### **Requirements:**
* At least 5 models
* At least 20 methods in the models
* No API’s unless we get approval from an instructor
* 10 specs, 5 per person --optional
* Analytics page --Main goal is to write interesting queries(insights)
* No Javascript


## App

### **Description**
Users can login to the app and create text documents that they can edit interactively via (ckeditor gem). These documents are saved to a database and can be accessed every time the user logs in. Each user has access to their specific documents. Each user can choose to make  any of their documents public for all users to see. Also Users can request to be friends with other users; which they need to confirm. This means they will be able to share individual documents with them. Friends can send PM’s to each other and view the entire conversation.

*Stretch:* Add user viewable timestamps to the PM’s. To add PDF generation/download (Wicked PDF gem). Add like/dislike, emoji’s and comments to public docs.



### **Models & Relationships**
* Users
  * Username
  * First Name
  * Last Name
  * Password
  * Admin?
* Documents
  * Data
  * Public?
* Document_Access
  * User_ID
  * Document_ID
* Friendships
  * User_ID
  * User_ID
  * Confirmed?
* Messages
  * User_ID
  * User_ID
  * Data

![Project 2 Relationship Diagram](https://raw.githubusercontent.com/RogeredBacon/Mod-2-Project/master/App%20relationships%20Diagram.png "Diagram")


### **MVP Goals**
1. I can log in as a user or admin
2. I can see all my available docs(index/show)
3. I can create a new doc and save it.
4. I can make any of my docs public.
5. I can see my current friendships
6. I can request a friendship with another user.
7. I can confirm a friendship with another user.
8. I can make a doc available to a friend.
9. I can send a message to a friend.



### **Stretch Goals**
1. Add user viewable timestamps to the PM’s.
2. Add PDF generation/download (Wicked PDF gem).
3. Add like/dislike, emoji and comments to public docs.


### **Wireframes**

![Project 2 Wireframes](https://raw.githubusercontent.com/RogeredBacon/Mod-2-Project/master/Wireframes.png "Wireframes")
