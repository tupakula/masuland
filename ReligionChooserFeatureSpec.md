# Religion Chooser Feature Specification #



This document outlines the basic architecture of the [Religion Chooser](ReligionChooser.md) application. You will get an overview about the application flow and states. Furthermore, types of value objects and client-server interface (Delegates) will be discussed.

## 1.1. Application Flow and States ##

The Religion Chooser application guides you through a decision process to find your religion.

Depending on the layout you have chosen you can select between different coloring styles (“red” or “green”) and languages (“English” or “German”). Since the coloring style and the language of an application is always dependent on its application layout – imagine an application with different writing directions (for example English or Chinese) or an application which is running on different devices (web browser or mobile phone) with different coloring styles (“Summer” or “Winter” theme) – the Religion Chooser application should be able to deal with that, too.

## 1.2. Wireframe ##

...

## 1.3. Value Objects ##

The Religion Chooser application uses the following value objects.

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

```

## 1.4. Client-Server Interface ##

The client-server communication will be defined in delegate classes. The Religion Chooser application uses the following methods for client-server communication.

```

IAppDelegate
 - getSettings() : SettingsVO

```

# Code examples #

Code examples which implement this feature specification:

  * [Religion Chooser](ReligionChooser.md) written in Flex 4.1 (Spark)