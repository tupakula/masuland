# Migration from Flex 3 to Flex 4 #




## Preface ##

The following migration guide consists of 4 steps to migrate your Flex 3 project into a Flex 4 project. This migration guide assumes that you have already set up a MVC structure in your Flex 3 project, which might look similar to this diagram:

![http://masuland.googlecode.com/files/Flex3AppWithNanoarchitecturesMVCtlDS.png](http://masuland.googlecode.com/files/Flex3AppWithNanoarchitecturesMVCtlDS.png)


## Step 1: Switch your Flex 3 SDK to the Flex 4 SDK ##

Switch the Flex 3 SDK to the Flex 4 SDK with "Flex 3 backward compatibility" mode switched on. In Flash Builder this can be done like this: "Project Properties > Flex Compiler > Use Flex 3 compatibility mode".

![http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCtlDS.png](http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCtlDS.png)

Check out this example: [Flex 4.1 (MX) Login Example with MVCtlDS](LoginExample#Flex_4.1_(MX)_with_MVCtlDS.md)


## Step 2: Create Code Behind classes for each MXML file ##

For every MXML file create a Code Behind class. They will be needed in Step 4.

![http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCtlDS.png](http://masuland.googlecode.com/files/Flex4MxAppWithNanoarchitecturesMVCbCtlDS.png)

Check out this example: [Flex 4.1 (MX) Login Example with MVCbCtlDS](LoginExample#Flex_4.1_(MX)_with_MVCbCtlDS.md)


## Step 3: Replace your Flex 3 (MX) components with Flex 4 (Spark) components ##

Replace every Flex 3 (MX) component with Flex 4 (Spark) components. When you have finished this step, the "Flex 3 backward compatibility" mode can be switched off again.

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCbCtlDS.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCbCtlDS.png)

Check out this example: [Flex 4.1 (Spark) Login Example with MVCbCtlDS](LoginExample#Flex_4.1_(Spark)_with_MVCbCtlDS.md)


## Step 4: Extend your Code Behind classes from SkinnableComponent or SkinnableContainer ##

Every Code Behind class extends from SkinnableComponent or SkinnableContainer.

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png)

Check out this example: [Flex 4.1 (Spark) Login Example with MVCpshCtlDS\_PInj](LoginExample#Flex_4.1_(Spark)_with_MVCpshCtlDS_PInj.md)

# Further Readings #

  * Mihai Corlan & Alin Achim: [Upgrading Flex 3 to Flex 4 Techguide](http://www.adobe.com/devnet/flex/articles/upgrading-flex3-to-flex4-techguide.html) ([PDF Version](http://wwwimages.adobe.com/www.adobe.com/content/dam/Adobe/en/devnet/flex/pdfs/upgrading-flex3-to-flex4-techguide.pdf))
  * Renaun Erickson: [Converting Flex 3 Microphone application to Flex 4](http://renaun.com/blog/2010/04/converting-flex-3-microphone-application-to-flex-4-part-1/)

...

# Code Examples #

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)

...

# Feedback #

Please feel free to post comments or suggestions because this page is still work in progress.