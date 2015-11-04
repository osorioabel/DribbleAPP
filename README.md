# Create an App reading the Dribble's API [Dribbble](https://dribbble.com) #

** This app should be written in Objective-C, solutions using Swift will be considered a plus but Obj-C is mandatory **

Create an App to read the [Dribbble API](http://developer.dribbble.com/v1/) and load the most popular shots.
The layout should be based on the given mockup:

![Screen Shot 2014-10-09 at 3.42.06 PM.png](https://bitbucket.org/repo/bApLBb/images/3039998141-Screen%20Shot%202014-10-09%20at%203.42.06%20PM.png)

Send us a solution even if you can't manage to do everything. The reason of this test is to know your form of thinking, the way you solve problems and your code style.

# Should have #

* File .gitignore
* Storyboard & Autolayout
* Dependency management eg: Cocoapods
* Communication framework to read the API. eg:  AFNetwork
* JSON -> Object mapping . eg: [Mantle](https://github.com/Mantle/Mantle#mtlmodel)
* Read the Shots API (http://api.dribbble.com/shots/popular?page=1)
* Pagination with infinite scroll in shots list
* Pull to refresh
* Detail screen of a Shot when clicking in items of the list
* The Detail screen should contain at least the name of the author, picture and description

# Nice to Have - Extra Points #

* Unit Testing. eg: XCTests / Specta + Expecta
* Functional Testing. eg: KIF
* Universal App, Ipad | Iphone | Landscape | Portrait (Size Classes)
* Image cache. eg SDWebImage
* Share shots on Facebook and/or Twitter

# Sumbission #

To start the test, do a FORK of this repo, create a branch with your name and send us a pull request.
If you just clone this repo, you will not be able to push us your code and will be harder to make the pull request, so it's highly recommended that you fork this repo with your bitbucket account.