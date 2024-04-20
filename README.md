# JanaDem

This is our graduation project. An application called "JanaDem", which will help citizens improve the condition of the city.

With this application, residents of the city have the opportunity to openly and easily declare the problems of the city, such as holes on highways, uncollected garbage in yards, alleys, etc.

This github repository was created in order to show the written code in the dart language, on the flutter framework.

Since I am the mobile developer of our team, I am responsible for the entire application. Now I want to explain to you which libraries and technologies I used for the correct operation of our application.

Our app, is connected with map, cause when users make a report, they should show location of problem, to solve them fast. And for this I used flutter_map package. It's very simple in use. And package latlong2 and location, to get users location.
And our app working on requests with backend server. For making requests in a good way, I used dio package. And for the state managing, I used riverpod state manager. It's also very simple in use. 
When making report, users should take photo of problem, to make solving problems easier. And for this, I added camera package. And for locally saving important data about users account, I used hive_flutter package.