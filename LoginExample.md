# Login Example #



## Preface ##

The Login Example aims to be a quick and easy "Show Me The Code" guide for Flex beginners and intermediate Flex coders that try to build large-scale Flex apps. While you can see the following code examples as a way I would recommend building these apps, I am not in the position to say that: "This is the way you have to do it".

## Introduction ##

Please read the [Feature Specification](LoginExampleFeatureSpec.md) of the Login Example application. The following code examples provide solutions for several dimensions in Flex development:

  1. **Flex SDKs** (Flex 3.5 "Halo", Flex 4.1 "Gumbo", Flex 4.5 "Hero" and Apache Flex 4.8)
  1. **Runtimes** (Adobe Flashplayer & Adobe AIR)
  1. **Mobile platforms** (Google Android, Apple iOS TODO and BlackBerry Tablet OS TODO)
  1. **Flex 3 to Flex 4 Migration Guide**
  1. **MVC Microarchitectures** ([Cairngorm 2.2.2](http://sourceforge.net/adobe/cairngorm),  [PureMVC 2.0.4](http://trac.puremvc.org/PureMVC_AS3/) TODO)
  1. **IoC Microarchitectures** ([Mate 0.9.1](http://mate.asfusion.com/), [Robotlegs 1.5.2](http://www.robotlegs.org/), [Parsley 2.4.1](http://www.spicefactory.org/parsley/), [Spring AS 1.1](http://www.springactionscript.org/), [Swiz 1.4](http://www.swizframework.org/))
  1. **Eventarchitectures** ([AS3-Signals](https://github.com/robertpenner/as3-signals/wiki))
  1. **Nanoarchitectures** ([M](NanoarchitectureM.md), [VCb / VCp](NanoarchitectureVCb.md), [Cpll](NanoarchitectureCpll.md), [Cpsh](NanoarchitectureCpsh.md), [Ctl](NanoarchitectureCtl.md), [Cmd](NanoarchitectureCmd.md), [NoEvt](NanoarchitectureNoEvt.md), [PInj](NanoarchitecturePInj.md))
  1. **Design Pattern** (Presentation Model, Code Behind, Presenter, Mediator, MVP TODO ... etc.)
  1. **[Cairngorm 3 Libraries](http://sourceforge.net/adobe/cairngorm/wiki/CairngormLibraries/)** ([Validation Library](http://sourceforge.net/adobe/cairngorm/wiki/CairngormLibraries/#Validation), [Task Library](http://sourceforge.net/adobe/cairngorm/wiki/CairngormLibraries/#Task), [Observer Library](http://sourceforge.net/adobe/cairngorm/wiki/CairngormLibraries/#Observer))
  1. **Continuous Integration** ([Apache Maven](http://maven.apache.org/), [Flexmojos](http://flexmojos.sonatype.org/) TODO)
  1. **Build and Deployment Tools** ([Apache Ant](http://ant.apache.org/) with FlexTasks library)
  1. **Testing frameworks** ([FlexUnit 4.0](http://flexunit.org/))
  1. **Flex Automation** ([RIATest](http://www.riatest.com/), [FlexMonkey](http://www.gorillalogic.com/flexmonkey) ... etc.)
  1. **Server projects** ([AmfPHP 1.9](http://www.silexlabs.org/amfphp/), [Zend AMF 1.11.11](http://framework.zend.com/download/amf), BlazeDS TODO, GraniteDS TODO)
  1. **Flex coding conventions** ([Flex 3](Flex3CodingConventions.md), [Flex 4](Flex4CodingConventions.md))
  1. **Project planning** (see [Login Example Feature Specification](LoginExampleFeatureSpec.md))

## Screenshots ##

### Login Example for Web ###

![http://masuland.googlecode.com/files/LoginExampleScreenshotWeb.png](http://masuland.googlecode.com/files/LoginExampleScreenshotWeb.png)

### Login Example for Desktop ###

![http://masuland.googlecode.com/files/LoginExampleScreenshotDesktop.png](http://masuland.googlecode.com/files/LoginExampleScreenshotDesktop.png)

### Login Example for Mobile ###

![http://masuland.googlecode.com/files/LoginExampleScreenshotMobile.png](http://masuland.googlecode.com/files/LoginExampleScreenshotMobile.png)

## Client ##

### Apache Flex 4.8 (Spark) ###

#### Flex 4.8 (Spark) with MVCpshCtlDS\_PInj ####

Features: Flex 4.8 (Spark) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["C-Push" (Cpsh)](NanoarchitectureCpsh.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D), "Service" (S) & ["Property Injection" (PInj)](NanoarchitecturePInj.md) Nanoarchitectures

  * Flex 4.8 (Spark) Login Example for Web with Parsley 2.4.1 (MVCpshCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx48ParsleyWebMVCpshCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx48ParsleyWebMVCpshCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx48ParsleyWebMVCpshCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx48ParsleyWebMVCpshCtl_PInj/trunk/))
  * Flex 4.8 (Spark) Login Example for Web with Spring AS 1.1 (MVCpshCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx48SpringWebMVCpshCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx48SpringWebMVCpshCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx48SpringWebMVCpshCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx48SpringWebMVCpshCtl_PInj/trunk/))
  * Flex 4.8 (Spark) Login Example for Web with Swiz 1.4 (MVCpshCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx48SwizWebMVCpshCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx48SwizWebMVCpshCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx48SwizWebMVCpshCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx48SwizWebMVCpshCtl_PInj/trunk/))

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png)

### Adobe Flex 4.5 (Spark) ###

#### Flex 4.5 (Spark) with MVCpshCtlDS\_PInj ####

Features: Flex 4.5 (Spark) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["C-Push" (Cpsh)](NanoarchitectureCpsh.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D), "Service" (S) & ["Property Injection" (PInj)](NanoarchitecturePInj.md) Nanoarchitectures

  * Flex 4.5 (Spark) Login Example for Web with Parsley 2.4.1 (MVCpshCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroParsleyWebMVCpshCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroParsleyWebMVCpshCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroParsleyWebMVCpshCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroParsleyWebMVCpshCtl_PInj/trunk/))
  * Flex 4.5 (Spark) Login Example for Web with Spring AS 1.1 (MVCpshCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSpringWebMVCpshCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSpringWebMVCpshCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSpringWebMVCpshCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSpringWebMVCpshCtl_PInj/trunk/))
  * Flex 4.5 (Spark) Login Example for Web with Swiz 1.4 (MVCpshCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSwizWebMVCpshCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSwizWebMVCpshCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSwizWebMVCpshCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSwizWebMVCpshCtl_PInj/trunk/))

  * Flex 4.5 (Spark) Login Example for Desktop with Parsley 2.4.1 (MVCpshCtl, PInj), ([air app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroParsleyDesktopMVCpshCtl_PInj.air)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroParsleyDesktopMVCpshCtl_PInj/trunk/))
  * Flex 4.5 (Spark) Login Example for Desktop with Spring AS 1.1 (MVCpshCtl, PInj), ([air app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSpringDesktopMVCpshCtl_PInj.air)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSpringDesktopMVCpshCtl_PInj/trunk/))
  * Flex 4.5 (Spark) Login Example for Desktop with Swiz 1.4 (MVCpshCtl, PInj), ([air app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSwizDesktopMVCpshCtl_PInj.air)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSwizDesktopMVCpshCtl_PInj/trunk/))

  * Flex 4.5 (Spark) Login Example for Mobile with Parsley 2.4.1 (MVCpshCtl, PInj), ([air app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroParsleyMobileMVCpshCtl_PInj.air)) ([android app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroParsleyMobileMVCpshCtl_PInj.apk)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroParsleyMobileMVCpshCtl_PInj/trunk/))
  * Flex 4.5 (Spark) Login Example for Mobile with Spring AS 1.1 (MVCpshCtl, PInj), (air app TODO) (android app TODO) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSpringMobileMVCpshCtl_PInj/trunk/))
  * Flex 4.5 (Spark) Login Example for Mobile with Swiz 1.4 (MVCpshCtl, PInj), ([air app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSwizMobileMVCpshCtl_PInj.air)) ([android app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroSwizMobileMVCpshCtl_PInj.apk))  ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSwizMobileMVCpshCtl_PInj/trunk/))

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png)

#### Flex 4.5 (Spark) with MVCpshCmdDS\_PInj ####

Features: Flex 4.5 (Spark) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["C-Push" (Cpsh)](NanoarchitectureCpsh.md), ["Command" (Cmd)](NanoarchitectureCmd.md), "Delegate" (D), "Service" (S) & ["Property Injection" (PInj)](NanoarchitecturePInj.md) Nanoarchitectures

  * Flex 4.5 (Spark) Login Example for Mobile with Mate 0.9.1 (MVCpshCmd, PInj), ([air app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroMateMobileMVCpshCmd_PInj.air)) ([android app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroMateMobileMVCpshCmd_PInj.apk)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroMateMobileMVCpshCmd_PInj/trunk/))

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCmdDS_PInj.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCmdDS_PInj.png)

#### Flex 4.5 (Spark) with MVCpshCmdDS ####

Features: Flex 4.5 (Spark) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["C-Push" (Cpsh)](NanoarchitectureCpsh.md), ["Command" (Cmd)](NanoarchitectureCmd.md), "Delegate" (D) & "Service" (S) Nanoarchitectures

  * Flex 4.5 (Spark) Login Example for Mobile with Robotlegs 1.5.2 / AS3-Signals 0.8 (MVCpshCmd), ([air app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroRobotlegsSignalsMobileMVCpshCmd.air)) ([android app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HeroRobotlegsSignalsMobileMVCpshCmd.apk)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroRobotlegsSignalsMobileMVCpshCmd/trunk/))

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCmdDS.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCmdDS.png)

### Adobe Flex 4.1 (Spark) ###

#### Flex 4.1 (Spark) with MVCpshStoTskDS\_PInjNoEvt ####

Features: Flex 4.1 (Spark) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["C-Push" (Cpsh)](NanoarchitectureCpsh.md), "Story/Task" (StoTsk), "Delegate" (D), "Service" (S), ["Property Injection" (PInj)](NanoarchitecturePInj.md) & ["No Event" (NoEvt)](NanoarchitectureNoEvt.md) Nanoarchitectures & Cairngorm 3 Task Library

  * Flex 4.1 (Spark) Login Example with Parsley 2.4.1 (MVCpshStoTsk, PInj, NoEvt), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCpshStoTsk_PInjNoEvt/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCpshStoTsk_PInjNoEvt/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCpshStoTsk_PInjNoEvt/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboParsleyMVCpshStoTsk_PInjNoEvt/trunk/))
  * Flex 4.1 (Spark) Login Example with Spring AS 1.1 (MVCpshStoTsk, PInj, NoEvt), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCpshStoTsk_PInjNoEvt/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCpshStoTsk_PInjNoEvt/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCpshStoTsk_PInjNoEvt/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSpringMVCpshStoTsk_PInjNoEvt/trunk/))
  * Flex 4.1 (Spark) Login Example with Swiz 1.4 (MVCpshStoTsk, PInj, NoEvt), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCpshStoTsk_PInjNoEvt/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCpshStoTsk_PInjNoEvt/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCpshStoTsk_PInjNoEvt/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSwizMVCpshStoTsk_PInjNoEvt/trunk/))

#### Flex 4.1 (Spark) with MVCpshCtlDS\_PInj ####

Features: Flex 4.1 (Spark) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["C-Push" (Cpsh)](NanoarchitectureCpsh.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D), "Service" (S) & ["Property Injection" (PInj)](NanoarchitecturePInj.md) Nanoarchitectures

  * Flex 4.1 (Spark) Login Example with Parsley 2.4.1 (MVCpshCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCpshCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCpshCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCpshCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboParsleyMVCpshCtl_PInj/trunk/))
  * Flex 4.1 (Spark) Login Example with Spring AS 1.1 (MVCpshCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCpshCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCpshCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCpshCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSpringMVCpshCtl_PInj/trunk/))
  * Flex 4.1 (Spark) Login Example with Swiz 1.4 (MVCpshCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCpshCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCpshCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCpshCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSwizMVCpshCtl_PInj/trunk/))

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png)

#### Flex 4.1 (Spark) with MVCpllCtlDS\_PInj ####

Features: Flex 4.1 (Spark) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["C-Pull" (Cpll)](NanoarchitectureCpll.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D), "Service" (S) & ["Property Injection" (PInj)](NanoarchitecturePInj.md) Nanoarchitectures

  * Flex 4.1 (Spark) Login Example with Parsley 2.4.1 (MVCpllCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCpllCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCpllCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCpllCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboParsleyMVCpllCtl_PInj/trunk/))
  * Flex 4.1 (Spark) Login Example with Spring AS 1.1 (MVCpllCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCpllCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCpllCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCpllCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSpringMVCpllCtl_PInj/trunk/))
  * Flex 4.1 (Spark) Login Example with Swiz 1.4 (MVCpllCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCpllCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCpllCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCpllCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSwizMVCpllCtl_PInj/trunk/))

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpllCtlDS_PInj.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpllCtlDS_PInj.png)

#### Flex 4.1 (Spark) with MVCbCtlDS\_PInj ####

Features: Flex 4.1 (Spark) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D), "Service" (S) & ["Property Injection" (PInj)](NanoarchitecturePInj.md) Nanoarchitectures

  * Flex 4.1 (Spark) Login Example with Parsley 2.4.1 (MVCbCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCbCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCbCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCbCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboParsleyMVCbCtl_PInj/trunk/))
  * Flex 4.1 (Spark) Login Example with Spring AS 1.1 (MVCbCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCbCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCbCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCbCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSpringMVCbCtl_PInj/trunk/))
  * Flex 4.1 (Spark) Login Example with Swiz 1.4 (MVCbCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCbCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCbCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCbCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSwizMVCbCtl_PInj/trunk/))

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCbCtlDS_PInj.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCbCtlDS_PInj.png)

#### Flex 4.1 (Spark) with MVCbCtlDS ####

Features: Flex 4.1 (Spark) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D) & "Service" (S) Nanoarchitectures

  * Flex 4.1 (Spark) Login Example with Parsley 2.4.1 (MVCbCtl), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCbCtl/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCbCtl/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboParsleyMVCbCtl/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboParsleyMVCbCtl/trunk/))
  * Flex 4.1 (Spark) Login Example with Spring AS 1.1 (MVCbCtl), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCbCtl/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCbCtl/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSpringMVCbCtl/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSpringMVCbCtl/trunk/))
  * Flex 4.1 (Spark) Login Example with Swiz 1.4 (MVCbCtl), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCbCtl/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCbCtl/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4GumboSwizMVCbCtl/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboSwizMVCbCtl_/trunk/))

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCbCtlDS.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCbCtlDS.png)

### Adobe Flex 4.1 (MX) ###

#### Flex 4.1 (MX) with MVCbStoTskDS\_PInj ####

Features: Flex 4.1 (MX) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), "Story/Task" (StoTsk), "Delegate" (D), "Service" (S) & ["Property Injection" (PInj)](NanoarchitecturePInj.md) Nanoarchitectures & Cairngorm 3 Task Library

  * Flex 4.1 (MX) Login Example with Parsley 2.4.1 (MVCbStoTsk, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbStoTsk_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbStoTsk_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbStoTsk_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsleyMVCbStoTsk_PInj/trunk/))
  * Flex 4.1 (MX) Login Example with Spring AS 1.1 (MVCbStoTsk, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbStoTsk_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbStoTsk_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbStoTsk_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSpringMVCbStoTsk_PInj/trunk/))
  * Flex 4.1 (MX) Login Example with Swiz 1.4 (MVCbStoTsk, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbStoTsk_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbStoTsk_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbStoTsk_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSwizMVCbStoTsk_PInj/trunk/))

#### Flex 4.1 (MX) with MVCbCtlDS\_PInjNoEvt ####

Features: Flex 4.1 (MX) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D), "Service" (S), ["Property Injection" (PInj)](NanoarchitecturePInj.md) & ["No Event" (NoEvt)](NanoarchitectureNoEvt.md)  Nanoarchitectures

  * Flex 4.1 (MX) Login Example with Parsley 2.4.1 (MVCbCtl, PInj, NoEvt), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInjNoEvt/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInjNoEvt/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInjNoEvt/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsleyMVCbCtl_PInjNoEvt/trunk/))
  * Flex 4.1 (MX) Login Example with Spring AS 1.1 (MVCbCtl, PInj, NoEvt), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_PInjNoEvt/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_PInjNoEvt/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_PInjNoEvt/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSpringMVCbCtl_PInjNoEvt/trunk/))
  * Flex 4.1 (MX) Login Example with Swiz 1.4 (MVCbCtl, PInj, NoEvt), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_PInjNoEvt/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_PInjNoEvt/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_PInjNoEvt/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSwizMVCbCtl_PInjNoEvt/trunk/))

![http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCtlDS_PInjNoEvt.png](http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCtlDS_PInjNoEvt.png)

#### Flex 4.1 (MX) with MVCbCtlDS\_PInjDdd ####

Features: Flex 4.1 (MX) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D), "Service" (S) & ["Property Injection" (PInj)](NanoarchitecturePInj.md) Nanoarchitectures & ["Domain-Driven Design" (Ddd)](http://en.wikipedia.org/wiki/Domain-driven_design) approach

  * Flex 4.1 (MX) Login Example with Parsley 2.4.1 (MVCbCtl, PInj, Ddd), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInjDdd/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInjDdd/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInjDdd/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsleyMVCbCtl_PInjDdd/trunk/))
  * Flex 4.1 (MX) Login Example with Spring AS 1.1 (MVCbCtl, PInj, Ddd), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_PInjDdd/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_PInjDdd/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_PInjDdd/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSpringMVCbCtl_PInjDdd/trunk/))
  * Flex 4.1 (MX) Login Example with Swiz 1.4 (MVCbCtl, PInj, Ddd), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_PInjDdd/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_PInjDdd/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_PInjDdd/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSwizMVCbCtl_PInjDdd/trunk/))

#### Flex 4.1 (MX) with MVCbCtlDS\_PInj ####

Features: Flex 4.1 (MX) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D), "Service" (S) & ["Property Injection" (PInj)](NanoarchitecturePInj.md) Nanoarchitectures

**Please note:** Two Parsley projects. First project Parsley 2.4.1 (MVCbCtl, PInj) uses the Publish/Subscribe-Tags from Parsley. Second project Parsley 2.4.1 (MVCbCtl, PInj, Wire) uses the Wire-tag from the Cairngorm 3 Observer Library.

  * Flex 4.1 (MX) Login Example with Parsley 2.4.1 (MVCbCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsleyMVCbCtl_PInj/trunk/))
  * Flex 4.1 (MX) Login Example with Parsley 2.4.1 (MVCbCtl, PInj, Wire), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInj_Wire/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInj_Wire/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_PInj_Wire/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsleyMVCbCtl_PInj_Wire/trunk/))
  * Flex 4.1 (MX) Login Example with Spring AS 1.1 (MVCbCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSpringMVCbCtl_PInj/trunk/))
  * Flex 4.1 (MX) Login Example with Swiz 1.4 (MVCbCtl, PInj), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_PInj/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_PInj/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_PInj/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSwizMVCbCtl_PInj/trunk/))

![http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCtlDS_PInj.png](http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCtlDS_PInj.png)

#### Flex 4.1 (MX) with MVCbCtlDS\_Val ####

Features: Flex 4.1 (MX) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D), "Service" (S) & "Validation" (Val) Nanoarchitectures & Cairngorm 3 Validation Library

  * Flex 4.1 (MX) Login Example with Parsley 2.4.1 (MVCbCtl, Val), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_Val/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_Val/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl_Val/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsleyCbVal/trunk/))
  * Flex 4.1 (MX) Login Example with Spring AS 1.1 (MVCbCtl, Val), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_Val/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_Val/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl_Val/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSpringMVCbCtl_Val/trunk/))
  * Flex 4.1 (MX) Login Example with Swiz 1.4 (MVCbCtl, Val), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_Val/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_Val/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl_Val/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSwizMVCbCtl_Val/trunk/))

#### Flex 4.1 (MX) with MVCbCtlDS ####

Features: Flex 4.1 (MX) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["Controller" (Ctl)](NanoarchitectureCtl.md), "Delegate" (D) & "Service" (S) Nanoarchitectures

  * Flex 4.1 (MX) Login Example with Parsley 2.4.1 (MVCbCtl), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCtl/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsleyMVCbCtl/trunk/))
  * Flex 4.1 (MX) Login Example with Spring AS 1.1 (MVCbCtl), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCtl/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSpringMVCbCtl/trunk/))
  * Flex 4.1 (MX) Login Example with Swiz 1.4 (MVCbCtl), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCtl/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSwizMVCbCtl/trunk/))

![http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCtlDS.png](http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCtlDS.png)

#### Flex 4.1 (MX) with MVCbCmdDS ####

Features: Flex 4.1 (MX) with ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md), ["Command" (Cmd)](NanoarchitectureCmd.md), "Delegate" (D) & "Service" (S) Nanoarchitectures

  * Flex 4.1 (MX) Login Example with Mate 0.9.1 (MVCbCmd), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloMateMVCbCmd/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloMateMVCbCmd/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloMateMVCbCmd/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloMateMVCbCmd/trunk/))
  * Flex 4.1 (MX) Login Example with Parsley 2.4.1 (MVCbCmd), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCmd/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCmd/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsleyMVCbCmd/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsleyMVCbCmd/trunk/))
  * Flex 4.1 (MX) Login Example with Robotlegs 1.5.2 / AS3-Signals 0.8 (MVCbCmd), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloRobotlegsSignalsMVCbCmd/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloRobotlegsSignalsMVCbCmd/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloRobotlegsSignalsMVCbCmd/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloRobotlegsSignalsMVCbCmd/trunk/))
  * Flex 4.1 (MX) Login Example with Spring AS 1.1 (MVCbCmd), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCmd/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCmd/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpringMVCbCmd/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSpringMVCbCmd/trunk/))
  * Flex 4.1 (MX) Login Example with Swiz 1.4 (MVCbCmd), ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCmd/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCmd/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwizMVCbCmd/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSwizMVCbCmd/trunk/))

![http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCmdDS.png](http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCmdDS.png)

#### Flex 4.1 (MX) with MVCtlDS ####

Features: Flex 4.1 (MX) with "Model - View - Controller - Delegate - Service" (MVCtlDS) Nanoarchitectures

  * Flex 4.1 (MX) Login Example with Parsley 2.4.1, ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsley/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsley/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloParsley/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsley/trunk/))
  * Flex 4.1 (MX) Login Example with Spring AS 1.1, ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpring/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpring/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSpring/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSpring/trunk/))
  * Flex 4.1 (MX) Login Example with Swiz 1.4, ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwiz/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwiz/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx4HaloSwiz/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSwiz/trunk/))

![http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCtlDS.png](http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCtlDS.png)

### Adobe Flex 3 ###

#### Flex 3 with MVCtlDS ####

Features: Flex 3 with "Model - View - Controller - Delegate - Service" (MVCtlDS) Nanoarchitectures

  * Flex 3 Login Example with Parsley 2.4.1, ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Parsley/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Parsley/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Parsley/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx3Parsley/trunk/))
  * Flex 3 Login Example with Spring AS 1.1, ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Spring/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Spring/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Spring/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx3Spring/trunk/))
  * Flex 3 Login Example with Swiz 0.6.4, ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Swiz064/index.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Swiz064/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx3Swiz064/trunk/))
  * Flex 3 Login Example with Swiz 1.4, ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Swiz/index.html)) ([web test](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Swiz/index_test.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Swiz/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx3Swiz/trunk/))

![http://masuland.googlecode.com/files/Flex3AppWithNanoarchitecturesMVCtlDS.png](http://masuland.googlecode.com/files/Flex3AppWithNanoarchitecturesMVCtlDS.png)

#### Flex 3 with MVCmdDS ####

Features: Flex 3 with "Model - View - Command - Delegate - Service" (MVCmdDS) Nanoarchitectures

  * Flex 3 Login Example with Cairngorm 2.2.2, ([web app](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Cairngorm222/index.html)) ([view source](https://dl.dropboxusercontent.com/u/352808/code/LoginExampleFx3Cairngorm222/srcview/index.html)) ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx3Cairngorm222/trunk/))

![http://masuland.googlecode.com/files/Flex3AppWithNanoarchitecturesMVCmdDS.png](http://masuland.googlecode.com/files/Flex3AppWithNanoarchitecturesMVCmdDS.png)

## Server ##

### AmfPHP ###

  * Login Example Server, AmfPHP 1.9, ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleServerAmfPHP_1.9/trunk/))

### Zend AMF ###

  * Login Example Server, Zend AMF 1.11.11, ([svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleServerZendAmf_1.11.11/trunk/))

### BlazeDS ###

  * TODO

### GraniteDS ###

  * TODO

## Used Nanoarchitectures ##

  * ["View - Code Behind / Component" (VCb / VCp)](NanoarchitectureVCb.md)
  * ["C-Pull" (Cpll)](NanoarchitectureCpll.md)
  * ["C-Push" (Cpsh)](NanoarchitectureCpsh.md)
  * ["Property Injection" (PInj)](NanoarchitecturePInj.md)
  * ["No Event" (NoEvt)](NanoarchitectureNoEvt.md)
  * ["Model" (M)](NanoarchitectureM.md)
  * ["Controller" (Ctl)](NanoarchitectureCtl.md)
  * ["Command" (Cmd)](NanoarchitectureCmd.md)
  * "Story/Task" (StoTsk)
  * "Action Chaining" (AChn)
  * "Delegate" (D)
  * "Service" (S)

## Frequently Asked Questions (FAQs) ##

#### Why have you created the Login Example? ####
Please read my [Letter of Motivation](LetterOfMotivation.md).

#### I am new to this website. Where should I start? ####
Please check out this [page](ApplicationDevelopmentProcedure.md).

#### What's a Nanoarchitecture? ####
Please read this page about [Nanoarchitectures](Nanoarchitecture.md).

#### Which Microarchitecture has the best performance? ####
Don't know. Maybe somebody could create performance tests for it ;)

#### Which Microarchitecture do you prefer? ####
I am not making that decision for you. It is up to you to decide which one suites best to your needs.

#### Why haven't you choosen Microarchitectures like PureMVC, SmartyPants or Flicc ... etc. for your Login Example? ####
I am thinking of adding other Microarchitectures, too. If they fit into the concept I will definitely add them. One issue I have with PureMVC and Robotlegs (without AS3-Signals) is that they are using the Mediator pattern for their views. This feels quiet massive when you want to work with SkinnableComponents in Flex 4 (3 classes = Skin class + SkinnableComponent + Mediator). If you have a good solution please [let me know](http://www.masuland.com?content=contact). Thanks!

#### Why do you have only so few Robotlegs and Mate examples for the Login Example? Are you biased? ####
No! I just have started adding Robotlegs and Mate examples to the Login Example.

#### Which Nanoarchitectures do you prefer? ####
For Flex 4 applications, I recommend, you should have a look at the [Login Example for Flex 4.1 (Spark) with MVCpshStoTskDS\_PInjNoEvt](LoginExample#Flex_4.1_(Spark)_with_MVCpshStoTskDS_PInjNoEvt.md) Nanoarchitectures. For Flex 3 applications, consider to use the ["Model" (M)](NanoarchitectureM.md), ["View - Code Behind" (VCb)](NanoarchitectureVCb.md) Nanoarchitecture as shown in the [LoginExample for Flex 4.1 (MX) with MVCbCtlDS](LoginExample#Flex_4.1_(MX)_with_MVCbCtlDS.md).

#### How can I migrate my Flex 3 application to a Flex 4 application? ####
Please read this [Flex 3 to Flex 4 Migration Guide](MigrationFromFlex3ToFlex4.md).

#### I have found issues in your code examples. Where can I post them? ####
You can post problems and feature enhancements into my [issue tracker](http://code.google.com/p/masuland/issues/list), or, you can contact me [directly](http://www.masuland.com?content=contact).

#### Can I participate in your project? ####
Sure! There are still things left for me to do (see [issue tracker](http://code.google.com/p/masuland/issues/list)). Any help would be appreciated!

#### Would you be willing to donate your code and docs to a higher instance? ####
Of cause! For the moment, I just haven't found the people sharing the same interest making the lifes of Flex beginners ... etc. easier building large-scale Flex apps. If I would see an authority growing up somewhere I would be happy to jump over.

#### Who is this guy occupying land in the web? ####
Details about me can be found [here](http://masuland.wordpress.com/about/).

# More Code Examples #

  * [Religion Chooser](ReligionChooser.md) written in Flex 4.1 (Spark)

# Feedback #

Please feel free to post comments, suggestions or feature requests because the code is still work in progress.