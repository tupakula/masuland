# Login Example Feature Specification #



This document outlines the basic architecture of the [Login Example](LoginExample.md) application. You will get an overview about the application flow and states. Furthermore, types of value objects and client-server interface (Delegates) will be discussed.

## 1.1. Application Flow and States ##

With the Login Example application you will be guided through a simple login or registering process. After you have been logged in, the application lets you change and update your user account information. The following state chart diagram shows the application flow.

![http://masuland.googlecode.com/files/LoginExampleStateChart.png](http://masuland.googlecode.com/files/LoginExampleStateChart.png)

_Created with [ArgoUML](http://argouml.tigris.org).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/argouml/LoginExample.uml)._

Furthermore, the Login Example application lets you choose between different layouts (“web” or “phone” layout). Depending on the layout you have chosen you can select between different coloring styles (“red” or “green”) and languages (“English” or “German”). Since the coloring style and the language of an application is always dependent on its application layout – imagine an application with different writing directions (for example English or Chinese) or an application which is running on different devices (web browser or mobile phone) with different coloring styles (“Summer” or “Winter” theme) – the Login Example application should be able to deal with that, too.

## 1.2. Wireframe ##

![http://masuland.googlecode.com/files/LoginExampleWireframe.png](http://masuland.googlecode.com/files/LoginExampleWireframe.png)

_Created with [Adobe Flash Catalyst CS5.5](http://www.adobe.com/products/flashcatalyst.html).
Source available in the [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/LoginExampleWireframe.fxp)._

## 1.3. Value Objects ##

The Login Example application uses the following value objects.

![http://masuland.googlecode.com/files/LoginExampleValueObjects.png](http://masuland.googlecode.com/files/LoginExampleValueObjects.png)

_Created with [ArgoUML](http://argouml.tigris.org).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/argouml/LoginExample.uml)._

```

SettingsVO
 - layouts : ArrayCollection <LayoutVO>

LayoutVO
 - name : String
 - width : Number
 - heigth : Number
 - stateName : String
 - styles : ArrayCollection <StyleVO>
 - locales : ArrayCollection <LocaleVO>

StyleVO
 - name : String
 - path : String

LocaleVO
 - name : String
 - code : String

AuthenticationVO
 - username : String
 - password : String
 - email : String

UserVO
 - username : String
 - firstname : String
 - lastname : String
 - email : String
 - birthday : Date

```

## 1.4. Client-Server Interface ##

The client-server communication will be defined in delegate classes. The Login Example application uses the following methods for client-server communication.

![http://masuland.googlecode.com/files/LoginExampleDelegates.png](http://masuland.googlecode.com/files/LoginExampleDelegates.png)

_Created with [ArgoUML](http://argouml.tigris.org).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/argouml/LoginExample.uml)._

```

IAppDelegate
 - getSettings() : SettingsVO
 - login(auth : AuthenticationVO) : UserVO
 - register(auth : AuthenticationVO) : UserVO
 - updateUser(user : UserVO) : UserVO

```

# Code examples #

Code examples which implements this feature specification:

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)