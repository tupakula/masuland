# "No Event" (NoEvt) Nanoarchitecture #

This document describes the application flow of an Adobe Flex 3 and Flex 4 application written in the "No Event" (NoEvt) nanoarchitecture. It is based on the ["Model - View - Code Behind" (MVCb)](NanoarchitectureMVCb.md) nanoarchitecture but avoids dispatching events inside the application, see arrow (2) and (3) in the following diagram:

![http://masuland.googlecode.com/files/NanoarchitectureNoEvt.png](http://masuland.googlecode.com/files/NanoarchitectureNoEvt.png)

_Created with the [yEd Graph Editor](http://www.yworks.com/en/products_yed_about.html).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/yed_diagram/NanoarchitectureNoEvt.graphml)._

## Application Layer Dependency ##

This Nanoarchitecture assumes to have the following dependency between their application layers:

![http://masuland.googlecode.com/files/LayerDependencyNoEvt.png](http://masuland.googlecode.com/files/LayerDependencyNoEvt.png)

_Created with the [yEd Graph Editor](http://www.yworks.com/en/products_yed_about.html).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/yed_diagram/LayerDependencyNoEvt.graphml)._

## Application Flows ##

Just like [MVCb](NanoarchitectureMVCb.md) this nanoarchitecture contains 3 types of application flows:

1. View Flow:
  * (1) User Interface calls function in the Code Behind (Flex 3) / Component (Flex 4) class
  * (9) Databinding updates User Interface

2. Action Flow:
  * (1) User Interface calls function in the Code Behind (Flex 3) / Component (Flex 4) class
  * (2) Code Behind (Flex 3) / Component (Flex 4) class calls Controller
  * (7) Processed data will be written back to the Model
  * (8) Databinding updates Code Behind (Flex 3) / Component (Flex 4) class
  * (9) Databinding updates User Interface

3. Business Flow:
  * (1) User Interface calls function in the Code Behind (Flex 3) / Component (Flex 4) class
  * (2) Code Behind (Flex 3) / Component (Flex 4) class calls Controller
  * (3) Controller calls the Delegate
  * (4) Delegate calls its implemented Service
  * (5) Service returns data
  * (6) Delegate returns data to registered Action (Event handler)
  * (7) Processed data will be written back to the Model
  * (8) Databinding updates Code Behind (Flex 3) / Component (Flex 4) class
  * (9) Databinding updates User Interface

## Code Examples Implementing NoEvt ##

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)

...

## More Nanoarchitectures ##

  * ["View - Code Behind / Component" (VCb / VCp)](NanoarchitectureVCb.md)
  * ["C-Pull" (Cpll)](NanoarchitectureCpll.md)
  * ["C-Push" (Cpsh)](NanoarchitectureCpsh.md)
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