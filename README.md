Demo Me is an application for a Indie Labels' A&amp;R to streamline managing demo submissions

Springboard Capstone 2 

OVERVIEW
========

Demo Me is a one stop shop for independent labels who want to stream-line their A&R workflow. The app will use Filestack API for file management and cloud storage, the front end will be done in React for a polished frontend, and Express as the backend to handle API calls and user data. 

This will be a backend centered app as React will only be serving to make the UI attractive. The core of the app will be done in Express. Express will need to handle making calls to Filestack, managing the queue and handling user data as well as the demos itself. 

GOALS
=====

1.  Create an Upload portal for artists to upload their demos 

1.  At this time we will not be implementing artist  counts-we will only be handling their demos 

3.  Use Filestack to handle 0Auth2 handshakes with various services to retrieve the files and store them to the Demo Me "file bucket" (cloud storage provided by Filestack)

4.  Once in the file bucket- labels will be able to retrieve and que up demos as playlists

1.  They can mark a demo as "interested" or "rejected"

6.  Demos marked "Interested" will be kept in storage "Rejected" demos will be deleted from the DB

7.  Label Admins will be able to view "interested" demos contact artists accordingly

Anticipated Challenges
======================

-   Avoiding collisions when an A&R rep accesses the queue-no two people get the same demo

-   Handling the 0Auth2 for multiple services

-   Soundcloud which is popular for demos isn't accepting new app registrations-we'll have to address this somehow

-   Schema is efficient and clean- everything is clear in its purpose/use

-   Ensuring audio downloads and plays back correctly

-   How will we approach making sure the demo gets to the correct label?

Stretch Goals
=============

Adding Messaging
----------------

Create Demo me direct messaging so A&R reps can talk to one another as well label admins!

Adding Gmail Compatibility
--------------------------

-   Admins should be able to contact artists on gmail directly from the Demo Me app 

-   E-mail sent by artists to label go both into the label g-mail AND the Demo Me App

Artist Profiles
---------------

-   Artists will be able to create a profile with their social media, contact information, press kits as well as current demo tracks

-   This information will be used to "easy submit" their demos to various labels - labels will indicate whether they will allow "easy submit" demos.

-   Artists will be able to check the status of the demos they submit

Create Widget
-------------

Create a Widget that labels can embed into their website for Demo Submission

Mobile App
----------

Create a mobile app for efficient demo handling on the go!



DataBase Schemas 
=================

Models:
=================

Label

-   ID - Primary Key (Int, auto increment)

-   Name - String

-   Employees- Foreign Key (Int)

Employees

-   ID - Primary Key (Int, auto increment)

-   Name -String

-   Role - Enum [A_R, Manager, Admin]

-   Label - Foreign Key (Int)

-   We'll need functionality for:

-   Sign-up (Hash password, create, save to Db)

-   Authentication (Is this a Demo me user?)

-   isAdmin(check if user is admin)

Demos 

-   ID - Primary Key (Int, auto increment)

-   artistName -String

-   spotify/soundcloud (String URL, optional/nullable)

-   submittedTo- Foreign Key (Label Id)

-   status enum [pending,accepted,rejected]

-   contactAt- String

We'll Need functionality for:

-   Getting all unlistened - select all where rejected AND accepted are false

-   Evaluation- changing the the Accepted/Rejected status

-   Deletes upon changing the status to "rejected"

-   Patch Request to DB and updates the demo upon changing the status to "accepted"


Through or Join Tables
=================

Employee Label
- Employee_id
- Label_id

Demo Label
- Demo_id
- Label_id

