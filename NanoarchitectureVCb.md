# "View - Code Behind / Component" (VCb / VCp) Nanoarchitecture #

This document describes the application flow of an Adobe Flex 3 and Flex 4 application written in the "View - Code Behind" (VCb) or "View - Component" (VCp)  Nanoarchitecture. The presentation pattern "Code Behind" will be used in this architecture as a synonym to the "Presentation Model" because they have lots in common. Furthermore, because this architecture tries to create a clean and simple communication language in your development team, and also, trying to avoid the confusions caused by the word "Presentation Model" (which is the Model-Logic component in the View Layer), this architecture proposes to use the word "Code Behind" instead. For a comparison of both presentation patterns please read the articles of Paul Williams about the [Code Behind](http://blogs.adobe.com/paulw/archives/2007/11/presentation_pa_5.html) pattern and the [Presentation Model](http://blogs.adobe.com/paulw/archives/2007/10/presentation_pa_3.html).

## VCb / VCp ##

![http://masuland.googlecode.com/files/NanoarchitectureVCb.png](http://masuland.googlecode.com/files/NanoarchitectureVCb.png)

_Created with the [yEd Graph Editor](http://www.yworks.com/en/products_yed_about.html).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/yed_diagram/NanoarchitectureVCb.graphml)._

## Application with VCb / VCp ##

![http://masuland.googlecode.com/files/ApplicationWithNanoarchitectureVCb.png](http://masuland.googlecode.com/files/ApplicationWithNanoarchitectureVCb.png)

_Created with the [yEd Graph Editor](http://www.yworks.com/en/products_yed_about.html).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/yed_diagram/ApplicationWithNanoarchitectureVCb.graphml)._

## Application Flows ##

This architecture contains 3 types of application flows:

1. View Flow:
  * (1) User Interface calls function in the Code Behind (Flex 3) / Component (Flex 4) class
  * (9) Databinding updates User Interface

2. Action Flow:
  * (1) User Interface calls function in the Code Behind (Flex 3) / Component (Flex 4) class
  * (2) Code Behind (Flex 3) / Component (Flex 4) class dispatches Event
  * (7) Processed data will be written back to the Model
  * (8) Databinding updates Code Behind (Flex 3) / Component (Flex 4) class
  * (9) Databinding updates User Interface

3. Business Flow:
  * (1) User Interface calls function in the Code Behind (Flex 3) / Component (Flex 4) class
  * (2) Code Behind (Flex 3) / Component (Flex 4) class dispatches Event
  * (3) Registered Action (Event handler) calls the Delegate
  * (4) Delegate calls its implemented Service
  * (5) Service returns data
  * (6) Delegate returns data to registered Action (Event handler)
  * (7) Processed data will be written back to the Model
  * (8) Databinding updates Code Behind (Flex 3) / Component (Flex 4) class
  * (9) Databinding updates User Interface

## Code Examples Implementing VCb / VCp ##

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)
  * [Religion Chooser](ReligionChooser.md) with Flex 4.1 (Spark)

...

## More Nanoarchitectures ##

  * ["C-Pull" (Cpll)](NanoarchitectureCpll.md)
  * ["C-Push" (Cpsh)](NanoarchitectureCpsh.md)
  * ["No Event" (NoEvt)](NanoarchitectureNoEvt.md)
  * ["Property Injection" (PInj)](NanoarchitecturePInj.md)
  * ["Model" (M)](NanoarchitectureM.md)
  * ["Controller" (Ctl)](NanoarchitectureCtl.md)
  * ["Command" (Cmd)](NanoarchitectureCmd.md)

...

## Frequently Asked Questions (FAQs) ##

#### What's a Nanoarchitecture? ####
Please read this page about [Nanoarchitectures](Nanoarchitecture.md).

...

## Feedback ##

Please feel free to post comments, suggestions or feature requests because this page is still work in progress.