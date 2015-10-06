**Please note:** The following information only reflects my personal experience and does not necessarily reflect the view of the Apache Flex community and Adobe. Any advice of the direction of this document is highly welcome!

# What's wrong with Flex? #



## Abstract ##

This document aims to be an objective and independent resource of the current state of Adobe Flex / Apache Flex. Furthermore, this document tries to evaluate things that can be seen positive and negative in Flex, defines goals for future versions of Flex and shows up some ways how to reach these goals in future. This document is currently under construction and the author highly encourages the community to take part in the creation of this document, or, to write down your own document with your personal ideas.

## Before you start reading ... ##

... please make sure you have a basic understanding of the following ["Rich Internet Application" (RIA)](http://en.wikipedia.org/wiki/Rich_Internet_application) technologies:

  * http://en.wikipedia.org/wiki/Adobe_Flash
  * http://en.wikipedia.org/wiki/Microsoft_Silverlight_History
  * http://en.wikipedia.org/wiki/Java_applet
  * http://en.wikipedia.org/wiki/JavaFX

... and other "Standard Web Application" (SWA) technologies:

  * http://en.wikipedia.org/wiki/HTML
  * http://en.wikipedia.org/wiki/Svg
  * http://en.wikipedia.org/wiki/JavaScript
  * http://en.wikipedia.org/wiki/Ajax_(programming)
  * http://en.wikipedia.org/wiki/Css

## 1. Analysis: Flex-Coding Past & Today ##

In the following, I am trying to analyse the history of Flex-Coding until today from an objective point of view.

### 1.1. Comparing Flex with the Fellows ###

The history of building ["Web Application" (WA)](http://en.wikipedia.org/wiki/Web_application) between 2005 and 2011 could be summarised as follows (see diagram below):

![http://masuland.googlecode.com/files/WebHistory.png](http://masuland.googlecode.com/files/WebHistory.png)

_Created with the [yEd Graph Editor](http://www.yworks.com/en/products_yed_about.html).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/yed_diagram/WebHistory.graphml)._

During the last years, due to heavy competition between involved companies (like [Macromedia](http://en.wikipedia.org/wiki/Macromedia), [Adobe](http://en.wikipedia.org/wiki/Adobe_Systems), [Microsoft](http://en.wikipedia.org/wiki/Microsoft), [Sun](http://en.wikipedia.org/wiki/Sun_Microsystems) and [Oracle](http://en.wikipedia.org/wiki/Oracle_Corporation)), all RIA technologies have evolved fairly dramatically. Also SWA technologies have evolved since inside the [World Wide Web Consortium (W3C)](http://www.w3.org) and [ECMA International](http://www.ecma-international.org/), but, the evolution was significantly slower so far (see diagram above). Today, RIA and SWA technologies could be compared as follows:

| Today | **HTML / Javascript** | **Flashplayer 11** | **Silverlight 5** | **Java (Applets)** |
|:------|:----------------------|:-------------------|:------------------|:-------------------|
| **Runtime Features** | Dependent on Web Browser | GPU support        | GPU support, [Multithreading](http://stulic.blogspot.com/2009/09/multi-threading-options-in-rich.html)  |  GPU support, Multithreading |
| **Markup Language** | [XHTML 1.1](http://www.w3.org/2007/07/xhtml-basic-ref.html), [HTML5](http://www.w3.org/TR/html5/), [SVG](http://www.w3.org/Graphics/SVG/) | [FXG 2.0](http://opensource.adobe.com/wiki/display/flexsdk/FXG+2.0+Specification), [MXML](http://opensource.adobe.com/wiki/display/flexsdk/MXML+2009) | [XAML](http://msdn.microsoft.com/en-us/library/ms752059.aspx) | [FXML](http://docs.oracle.com/javafx/2.0/fxml_get_started/jfxpub-fxml_get_started.htm) |
| **Scripting Language** | Javascript            | Actionscript       | JScript           |  Java, JRuby, Groovy |
| **Interaction Design Tools** | [Adobe Muse](http://muse.adobe.com/), [Adobe Edge](http://labs.adobe.com/technologies/edge/), [Adobe Proto](http://www.adobe.com/products/proto.html) | [Adobe Flash Catalyst](http://www.adobe.com/products/flashcatalyst.html),  [Adobe Flash Pro](http://www.adobe.com/products/flash.html) | [Microsoft Expression Blend](http://www.microsoft.com/expression/products/blend_overview.aspx) | [JavaFX Scene Builder](http://javafx.com/roadmap/#3) |
| **Developer Tools** | [Eclipse](http://www.eclipse.org/), [Adobe Dreamweaver](http://www.adobe.com/products/dreamweaver.html) | [Adobe Flash Pro](http://www.adobe.com/products/flash.html), [Adobe Flash Builder](http://www.adobe.com/products/flash-builder.html) | [Microsoft Visual Studio](http://www.microsoft.com/visualstudio/en-us) | [Eclipse](http://www.eclipse.org/)  |

### 1.2. Evolution of the Flashplayer, Adobe AIR ###

Due to heavy investments of Macromedia (and later Adobe) into the Flashplayer - and later Adobe AIR (the successor of [Macromedia Central](http://www.adobe.com/products/central/)) - and their Flash platform tools ([Adobe Flash Pro](http://www.adobe.com/products/flash.html)), the creative web industry was highly interested to build artistic Flash websites, to create compelling animations to attract customers and to use the Flash video delivery capabilities for years.

Adobe plans to update its Flashplayer and Adobe AIR on faster release cycles (four times a year). More information about future version of the Flashruntime can be found here:
http://www.adobe.com/devnet/flashplatform/whitepapers/roadmap.html

### 1.3. Evolution of Flex ###

In 2003-2004 enterprise businesses slowly moved away from building SWAs and showed a growing interest to build consistent cross-browser, ["asynchronous" Ajax-like](http://en.wikipedia.org/wiki/Ajax_(programming)) web sites with Flash, but, it was hard to build RIAs with the existing [Actionscript 3.0 components](http://livedocs.adobe.com/flash/9.0/main/flash_as3_components_help.pdf) these days. Therefore, Macromedia has released its first version of the Flex SDK and the Macromedia Flex Builder (the former version of [Adobe Flash Builder](http://www.adobe.com/products/flash-builder.html)) in [March 2004](http://en.wikipedia.org/wiki/Adobe_Flex). After Adobe acquired Macromedia in [March 2005](http://en.wikipedia.org/wiki/Macromedia#Purchase), Adobe showed big interest of being competitive with Silverlight ([XAML](http://msdn.microsoft.com/en-us/library/ms752059.aspx)) and its existing tools ([Microsoft Expression Blend](http://www.microsoft.com/expression/products/blend_overview.aspx)), and therefore, Adobe began heavily working on Flex 4 features ([FXG](http://opensource.adobe.com/wiki/display/flexsdk/FXG+2.0+Specification) skins & the new ["Spark Component"](http://opensource.adobe.com/wiki/display/flexsdk/Spark+Skinning) model) and its own tools ([Adobe Flash Catalyst](http://www.adobe.com/products/flashcatalyst.html) formerly codenamed Thermo) in 2007.

**In short: What is Flex?**

  * Skinnable user-interface components with a component lifecycle:
    * Flex 3 ([Birth](http://livedocs.adobe.com/flex/3/html/help.html?content=layoutperformance_03.html), [Life](http://livedocs.adobe.com/flex/3/html/help.html?content=ascomponents_advanced_2.html), Death)
    * Flex 4 (Birth, [Life](http://help.adobe.com/en_US/flex/using/WS460ee381960520ad-2811830c121e9107ecb-7fff.html), Death)
  * A set of services (HTTPService, WebService, RemoteObject)
  * Has Managers to handle:
    * Styling
    * Skinning
    * Layout
    * Localization
    * Animation
    * Module-loading
    * User interaction management
  * Has accessibility support
  * Flex has an Automation-Testing Framework
  * Flex SDK provides a compiler
  * Defines a simple application flow:

![http://masuland.googlecode.com/files/FlexLayers-ApplicationFlow.png](http://masuland.googlecode.com/files/FlexLayers-ApplicationFlow.png)

_Created with the [yEd Graph Editor](http://www.yworks.com/en/products_yed_about.html).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/yed_diagram/FlexLayers-ApplicationFlow.graphml)._

This is a Flex 4 "Hello World" example which is (only) implementing the View-Layer and Service-Layer **into a single file**:

```
<?xml version="1.0" encoding="utf-8"?>
<s:Application
	xmlns:fx="http://ns.adobe.com/mxml/2009" 
	xmlns:s="library://ns.adobe.com/flex/spark" 
	xmlns:mx="library://ns.adobe.com/flex/mx"
	>
	
	<fx:Declarations>
		<s:RemoteObject
			id="helloWorldServive"
			destination="HelloWorldServive"
			>
			<s:method name="getHello" result="getHello_resultHandler(event)">
				<s:arguments>
					<name>{ tip_name.text }</name>
				</s:arguments>
			</s:method>
		</s:RemoteObject>
	</fx:Declarations>
	
	<fx:Script>
		<![CDATA[
			import mx.rpc.events.ResultEvent;
			
			private function getHello_resultHandler(event:ResultEvent):void
			{
				txt_result.text = 'Hello ' + event.result as String;
			}
		]]>
	</fx:Script>
	
	<s:VGroup
		horizontalCenter="0" verticalCenter="0"
		>
		<s:TextInput
			id="tip_name"
			prompt="Type in your name"
			/>
		<mx:Button
			label="Get Hello"
			click="helloWorldServive.getHello()"
			/>
		<mx:Label
			id="txt_result"
			/>
	</s:VGroup>
		
</s:Application>
```

Using this approach for constantly growing applications would potentially result in ["Spaghetti code"](http://en.wikipedia.org/wiki/Spaghetti_code).

**How many MXML files do you have in your latest Flex projects?**

![http://masuland.googlecode.com/files/Flex_Usage_2011-Result-Question_1.png](http://masuland.googlecode.com/files/Flex_Usage_2011-Result-Question_1.png)

_Original source: Question 1 from this [survey](http://code.google.com/p/masuland/wiki/Statistics#Question_1:_How_many_MXML_files_do_you_have_in_your_latest_Flex)._

### 1.4. Evolution of Microarchitectures ###

MVC Microarchitectures:
  * [Cairngorm 2.2.2](http://sourceforge.net/adobe/cairngorm)
  * [PureMVC 2.0.4](http://trac.puremvc.org/PureMVC_AS3/)

IoC Microarchitectures:
  * [Parsley 3.0](http://www.spicefactory.org/parsley/)
  * [Spring AS 1.1](http://www.springactionscript.org/)
  * [Swiz 1.4](http://www.swizframework.org/)
  * [Robotlegs 1.5.2](http://www.robotlegs.org/)
  * [Mate 0.9.1](http://mate.asfusion.com/)

Microarchitectures have been created because of the lack of separation of concerns when creating applications with the Flex SDK.

![http://masuland.googlecode.com/files/FlexWithMvcLayers-ApplicationFlow.png](http://masuland.googlecode.com/files/FlexWithMvcLayers-ApplicationFlow.png)

_Created with the [yEd Graph Editor](http://www.yworks.com/en/products_yed_about.html).
Source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleDocs/trunk/yed_diagram/FlexWithMvcLayers-ApplicationFlow.graphml)._

Implementations of Flex applications with the above mentioned MVC Layers can be found here:
  * [Login Example](LoginExample.md) with Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)
  * [Religion Chooser](ReligionChooser.md) with Flex 4 (Spark)

Since the release of the Cairngorm 3 specification Adobe Consulting [suggests](http://sourceforge.net/adobe/cairngorm/home/Home/) the use of third party open source Inversion-of-Control (IoC) Microarchitectures like ([Parsley](http://www.spicefactory.org/parsley/), [Spring Actionscript](http://www.springactionscript.org/), [Swiz](http://www.swizframework.org/), [Robotlegs](http://www.robotlegs.org/), [Mate](http://mate.asfusion.com/)) ... which means: Inject your things!

**Which Model-View-Controller (MVC) Microarchitectures have you used in your Flex projects?**

![http://masuland.googlecode.com/files/Flex_Usage_2011-Result-Question_2.png](http://masuland.googlecode.com/files/Flex_Usage_2011-Result-Question_2.png)

_Original source: Question 2 from this [survey](http://code.google.com/p/masuland/wiki/Statistics#Question_2:_Which_Model-View-Controller_(MVC)_Microarchitectures)._

### 1.5. Flex 4.x is a "Hybrid" ###

Flex 4.x is a "Hybrid" SDK because Flex 4.x still relies on the old MX-namespace for two main reasons:

  1. Downward-compatibility with Flex 3 UIComponents
  1. Some MX-components have not been transfered to the Spark-component set yet (e.g. MX-DateChooser, MX-ColorPicker, MX-TabNavigator ... etc.). For more information, check out this link: https://cwiki.apache.org/confluence/display/FLEX/Missing+Spark+Components

Flex 5, potentially, ties off this dependency to the MX-namespace, and therefore can be seen again as a pure Flex SDK (just like Flex 3 is).

### 1.6. Designer/Developer Workflow ###

The designer/developer workflow has been introduced with Flash Catalyst CS5.5 and Flash Builder 4.5. For more information about this topic please read these two articles:

http://learn.adobe.com/wiki/display/fcc/Flash+Catalyst+CS5.5+compatibility+schema
http://www.adobe.com/devnet/flashcatalyst/articles/flashcatalyst-compatibility-checker.html

### 1.7. Flex Developer Community ###

The Flex Developer community is a fairly active community. Many Flex User Groups and Forums exist worldwide.

### 1.8. Flex Code Examples ###

Lots of code examples can be found in the web for Adobe and Apache Flex.

### 1.9. Coding Conventions ###

Adobe promotes the usage of [Coding Conventions](http://sourceforge.net/adobe/flexsdk/wiki/Coding%20Conventions/).

### 1.10. Code generation tools ###

  * Ant and Maven code generators for services and value objects (VO) ... etc.
  * Flash Catalyst CS5.5 (Generating skins for SkinnableComponent classes)
  * Flash Builder 4.6 (Generating services & code templates)
  * Adobe Creative Suite 5+ Products (Generating skins)

### 1.11. Varying Developer Coding Backgrounds ###

Developers have different coding backgrounds:

  * Flash Developers with different coding skills based on the Flashplayer version (e.g. Flashplayer 7, 8, 9, 10, 11)
  * PHP Developers
  * Java Developers
  * ASP Developers
  * HTML Developers
  * Javascript Developers
  * ... etc.

... Combining this with the circumstance that Flex is open to all kinds of coding techniques (OOP-Coding, Functional-Coding, "All-Into-A-Single-File"-Coding ... etc.) the emerging Flex-Code could easily result into ["Spaghetti code"](http://en.wikipedia.org/wiki/Spaghetti_code) without any coding-conventions at all ... and therefore: this could lead to massive code-refactoring efforts years later.

### 1.12. Teaching Flex Development ###

There are not many universities and institutions teaching flex development. Furthermore, because the Flashplayer and Adobe AIR constantly evolves, teachers have to update their knowledge constantly, which is not always the case.

## 2. Evaluation: How could Flex-Coding Past & Today be evaluated? ##

### 2.1. What's positive? ###

#### 2.1.1. Positive: Flex Developers are needed ####

The current situation is good for all Flex Developers. Working in such an uncertain and constantly changing market means: There is lots of work to do, and, there is always something that needs to be fixed ... for clarification watch [this scene](http://www.youtube.com/watch?v=Tt1W0F0yObg) of the movie "The Fifth Element" in which Gary Oldman explains why "Graffiti" (and "a bad Flex coding practice" respectively) is "good for the world"!

#### 2.1.2. Positive: Adobe is getting payed for their Investments ####

Until the end of 2011, Adobe was heavily investing into Adobe Flex. I personally want to acknowledge their past work, and, I want to encourage the Flex Community to continue buying their Designer & Developer tools that support the creation of Flex application (e.g. Flash Catalyst CS5.5, Flash Builder 4.6 Premium, Fireworks CS6, Illustrator CS6, Photoshop CS6, ... etc.)

#### 2.1.3. Positive: The Flash-Platform and Apache Flex are becoming more and more powerful ####

Based on the circumstance that Flashplayer 12 will introduce a new AVM with better Multithreading support, Apache Flex should considerably become more and more powerful in future.

#### 2.1.4. Positive: Adobe continuously open sourcing technology ####

Adobe will continue to collaborate with the Open Source Community and will provide more open source technologies in future ... see examples:

  * Adobe Opensource, http://sourceforge.net/adobe/
  * Adobe Github, https://github.com/adobe
  * Apache Flex, http://wiki.apache.org/incubator/FlexProposal
  * Adobe at W3C, http://www.w3.org/Consortium/Member/List
  * Adobe at ECMA International, http://www.ecma-international.org/memento/members.htm

### 2.2. What's negative? ###

#### 2.2.1. Negative: Release cycles of Flashplayer, Adobe AIR and Flex to fast ####

While this also has pros to update the Flashplayer, Adobe AIR and Flex framework on faster release cycles (four times a year), for developers this means your application constantly has to be updated and this could be an issue for big long-term projects.

#### 2.2.2. Negative: The use of Microarchitectures uncertain ####

While this can be seen as a great opportunity to the open source community and opens up lots of creativity to these Microarchitectures, this also means for applications, that use these Microarchitectures, that they have to trust into the continuity of a certain Microarchitecture which they use. Furthermore, updating Microarchitectures to their latest version could also be an issue for big long-term projects.

#### 2.2.3. Negative: Flex 4.x has still an incomplete Spark component set ####

Because Flex 4.x has still an incomplete Spark component set, we are forced to use the old MX components (e.g. MX-DateChooser, MX-ColorPicker, MX-TabNavigator ... etc.), or, have to take the time to build them ourself.

#### 2.2.4. Negative: Restrictive Designer/Developer Workflow ####

The designer/developer workflow introduced with Flash Catalyst CS5.5 and Flash Builder 4.5 is great, but, fairly restrictive, and therefore, not very productive. Hopefully, this issue will be improved when Flex 5, Flash Builder 5 and Flash Catalyst CS6 has been released.

#### 2.2.5. Negative: "Fairly unexperienced" Developer Community ####

Because Flex is a fairly new technology, the Flex community in average is still "fairly unexperienced", and, in this community there are only a few "very well experienced" Flex Evangelists out there from whom "normal experienced" Flex developers, like me, could learn from. Communities like the Java, ASP.NET or PHP community are much more settled down ... and the chance to find a helping hand in these communities is much more likely than in ours.

#### 2.2.6. Negative: Misleading Code Examples ####

Even though there are many Flex code examples out there - most of them cover the topic "Component Development in Flex" (like Spark- and MX-Components) - only few information can be found on professional and sustainable "Application-Architecture Development in Flex" in combination with third party Microarchitectures. Because of the lack of these information many Flex projects tend to implement their required application-features with unconventional coding practices.

#### 2.2.7. Negative: Missing Coding Conventions ####

Even though Adobe promotes the usage of [Coding Conventions](http://opensource.adobe.com/wiki/display/flexsdk/Coding+Conventions) the Flex community still seems to be unhappy, and therefore, very creative regarding their own conventions.

#### 2.2.8. Negative: Only few code generation tools ####

A lack of code generation tools and wizards to speedup development productivity with Microarchitectures. Because of that the development of well featured real world applications using Microarchitectures potentially produces a development overhead when adding new features to these applications.

#### 2.2.9. Negative: Lack of Education for Flex Beginners ####

Apart from the USA, only few universities (or comparable institutions) teach Flex development. Therefore Flex beginners and intermediate Flex developers are forced to learn from code in the web. Because the web is packed with many misleading code examples the risk for Flex beginners and intermediate Flex developers rises that they build improper Flex code.

#### 2.2.10. Negative: Black-Box Coding with Adobe Flashplayer and Adobe AIR ####

Because Adobe Flashplayer and Adobe AIR cannot be developed Open Source, other Open Source communities, like Apache Flex, have to live with the restrictions of the underlying Virtual Machine.

## 3. Goals: How should Flex-Coding be? ##

### 3.1. Strengthening large-scale Flex applications ###

Because Flex tends to be used for smaller projects (see diagram below: between 25 and 100 MXML files per Flex project), Apache Flex should consider finding ways to strengthen large-scale Flex applications (more than 250 MXML files per Flex project). This can be done by simplifying (or restricting) the ways how the Flex community should develop their Flex projects. Furthermore, educating the Flex community might be another option to improve large-scale Flex applications (e.g. writing articles about "Best Practices for large-scale Flex Applications").

![http://masuland.googlecode.com/files/Flex_Usage_2011-Result-Question_1-Goal_2012+.png](http://masuland.googlecode.com/files/Flex_Usage_2011-Result-Question_1-Goal_2012+.png)

### 3.2. Highly productive and fast development environment ###

...

### 3.3. Flex code should be easily mergeable across different Flex projects worldwide ###

...

### 3.4. Flex code should be based on coding standards ###

Because coding standards matter, I'd like to encourage the Flex community to use the existing [Coding Conventions](http://sourceforge.net/adobe/flexsdk/wiki/Coding%20Conventions/) provided by Adobe. I would also see the need to introduce an [Application Development Procedure](http://code.google.com/p/masuland/wiki/ApplicationDevelopmentProcedure) into the Flex application development process.

### 3.5. Flex code should be sustainable and easily maintainable ###

...

### 3.6. There should be more highly skilled Flex Developers around ###

Because education matters, I'd like to ask the Flex experts out there to think about ways how you could give back your valuable knowledge to those that consider themselves being a Flex beginner. The faster those unskilled Flex developers learn from you, the sooner we have more highly skilled Flex Developers around.

### 3.7. Developer tools should be easy to be used and should help the designer/developer to be more productive ###

Flex could not survive without tools that support the productivity of the designer and developer. Therefore, I encourage the Flex community to build those tools that are needed to speed up our developer productivity.

### 3.8. The Flashplayer - "Actionscript Virtual Machine" (AVM) respectively - should be as powerful as the "Java Virtual Machine" (JVM) ###

The faster a virtual machine becomes, the more the performance gets your code that runs in it. Therefore, I see the need that Apache Flex 5 will run in the latest AVM of the Adobe Flashplayer (e.g. Flashplayer 12+ approx. released in Mid 2013).

### 3.9. The Adobe Flash Catalyst should be as powerful as Microsoft Expression Blend ###

...

## 4. Alternatives: How to achieve these Goals? ##

  * Less release cycles starting with Flex 5 and Flashplayer 12
  * Funding for the developer teams which create Microarchitecture frameworks to speed up their development cycles
  * Open up a Flex Coding Standard Foundation (together with Flex community and Adobe) ... maybe the Spoon Project will help: http://www.spoon.as
  * Integration of a MVC framework to Flex 5 in collaboration with existing Microarchitecture developers
  * MVC code generators In Flash Builder 5 on the basis of the Flex 5 MVC framework

...

## 5. Vision: Where could Flex-Coding be in the year 2050? ##

I strongly believe that the World Wide Web (WWW) in 2050 should still be an open platform for both: their developers and their users. Therefore, it is necessary that the future of the WWW follows the guidelines provided by [World Wide Web Consortium (W3C)](http://www.w3.org) with [their members](http://www.w3.org/Consortium/Member/List) and [ECMA International](http://www.ecma-international.org/) with [their members](http://www.ecma-international.org/memento/members.htm). Depending on the future strategy of the W3C and ECMA Int, their decisions will have direct implications for the future use of the Flash-Platform (Java-Applet & Silverlight ... etc.). In the following I'd like to name a few things that might make Flash (Java-Applet & Silverlight ... etc.) development irrelevant in 2050:

### 5.1. The W3C and ECMA Int will implement their standards ###

Flash- and Flex-Coding would still be relevant in 2050 unless the W3C and ECMA Int will decide that it is not just enough to define a standard for the web - and HTML in particular. Instead, they would also take care of its implementation of a freely available and open WWW with a **_single_** web browser. Still having so many versions of web browsers out there could mean: the WWW is still very new and we (including the W3C and ECMA Int) probably don't know yet where it should lead us to.

Benefits:
  * HTML/Javascript documents look and behave the same EVERYWHERE!

Risks:
  * The risk grows that the development of a single web browser inside the W3C and ECMA Int could be misused in favor to a certain involved company.
  * Different web browser stay in competition in growing features, speed and their user community. Removing that could result into a weaker WWW.

### 5.2. HTML/Javascript will go RIA ###

Flash- and Flex-Coding would still be relevant in 2050 unless the W3C and ECMA Int does not combine SVG, WebGL, HTML, CSS & Javascript ... etc. into a single Rich Internet Application (RIA) document specification - hereby called "RIA-HTML". For the moment the W3C still considers HTML to be a "text document with additional multimedia features", whereas, a Flash document can be considered as a "pure multimedia document" (Audio, Video, 3D, Text ... etc).

Benefits:
  * A "pure multimedia document" similar to MXML/FXG (Flex) or XAML (Silverlight) would be way more expressive

### 5.3. HTML/Javascript will be binary a with Semantic Webservice API ###

Flash- and Flex-Coding would still be relevant in 2050 unless HTML/Javascript cannot be compiled into binary code so that search engines, crawlers and web bots will be restricted to only communicate to the "RIA-HTML" document via a certain separated Semantic Webservices API ... for more information read [Semantic Web](http://www.w3.org/standards/semanticweb/) and [RDF](http://www.w3.org/standards/techs/rdf), [OWL](http://www.w3.org/standards/techs/owl) ... etc.

Benefits:
  * Compiled binary HTML/Javascript could significantly be transfered much faster between client and server
  * Users don't have to run through any human-prove task in the web anymore ... e.g.
    * "Prove you are human while typing in the letters below: k2eMSlo rUs4Kin"
    * "ATTENTION: Spambots must die! Humans must visit http://contact.futurescale.com to request forum access."
  * Search engines, crawlers or any type of web bots only get the information which is intended for them

Risks:
  * Users don't see what is inside a binary HTML/Javascript anymore (unless there is a "View Sourcecode API" included)

### 5.4. Javascript will become a type-safe OOP-language ###

Flash- and Flex-Coding would still be relevant in 2050 unless Javascript will become a type-safe OOP-language ... which means: introducing **_castable_** typed objects and more powerful OOP features into the language.

Benefits:
  * Faster Javascript code execution
  * Better tooling-support for Javascript

## 6. Conclusion ##

So, again, the question: What's wrong with Flex? The answer: There is nothing really wrong with Flex! Things are only - as usual - imperfect! And, we have to live with the imperfectness of the Web and Apache Flex, and, everyone who is working on those technologies, can only make small improvements for them. And, in the meantime, we have to simply except those silly fights like [www.occupyflash.org](http://www.occupyflash.org) and [www.occupyhtml.org](http://www.occupyhtml.org) until a perfect Web for their developers and their users has finally emerged out of it. Let's talk again in 2050 ;)

As a summary, please, also check out my presentation ["Apache Flex and the imperfect Web"](http://code.google.com/p/masuland/wiki/Presentations).


## Related Resources ##

### Flex Future ###

  * http://www.riagora.com/2011/11/flex-is-open/
  * http://blogs.adobe.com/flex/2011/11/your-questions-about-flex.html
  * http://blog.hjaelpmignu.dk/2011/11/adobe-flash-and-html5-are-we-happy/
  * http://www.adobe.com/devnet/flashplatform/articles/recent-updates.html
  * http://tv.adobe.com/watch/max-2011-develop/flash-platform-roadmap-flex-flash-builder-flash-player-air/

### Spoon Project ###

  * http://zaa.tv/2011/04/360flex-denver-2011–day-2-keynote-spoon/
  * http://tv.adobe.com/watch/max-2011-develop/open-source-flex-what-the-spoon-project-means-to-you/
  * http://www.spoon.as/core-values/

### Adobe Support ###

  * White Papers, http://www.adobe.com/devnet/flashplatform/whitepapers.html
  * Adobe roadmap for the Flash runtimes, http://www.adobe.com/devnet/flashplatform/whitepapers/roadmap.html
  * Adobe's view of Flex and its commitments to Flex in the future, http://www.adobe.com/devnet/flex/whitepapers/roadmap.html

# Code Examples #

Please check out my code examples:

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (Halo, Gumbo) and Flex 4.5 (Hero)
  * [Religion Chooser](ReligionChooser.md) with Flex 4.1 (Gumbo)

# Feedback #

Please feel free to post comments, suggestions because the document is still work in progress.