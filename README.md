# iOS-Projects

This repo showcases some of my iOS projects I have built using SWIFT and XCode. 

1. UrFeeds 

UrFeeds is an application that is a combination of current apps that focus on News and Social media feeds. 
The home screen is embedded inside a UINavigationBar and uses animation to create a seamless slide in and slide out menu.     Open menu places leading constraints when the menu is out and when the menu is in and is connected to the navigation button. 
Main menu has a collection view on top of it to be mini buttons to go directly to the associated view controller. There are four views associated with each social media account. Each collection cell has a UIImage and UILabel attached to it and use the dequeue method to generate different titles and labels for each. 

A WKWebKit is used to display each page of social media accounts. A view controller for Twitter, Instagram, Facebook and to view different News sites. The webkit allows for embedded web pages to be presented. I use the URLRequest method to fetch each https web page.

2. Booked N' Busy

Booked N' Busy is a mobile application that allows users to post services they are offering. These services are placed in their prospective sections and can be viewed by service users. Users can book an appointment. This is a group project and is unfinished. Practice use of Firebase database to save service post and update them to the main menu in real time.


