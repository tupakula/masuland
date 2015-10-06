# Thermo MK2 for Apache Flex #



## Introduction ##

This proposed Design Tool (code named Thermo MK2) should be seen as a hybrid of [Flash Catalyst CS5.5](http://www.adobe.com/devnet/flashcatalyst/articles/introducing-flashcatalyst-cs55.html) (codenamed Adobe Thermo in 2007), the "Design View" of [Flash Builder 4.6](http://www.adobe.com/products/flash-builder.html) and the [Eclipse](http://www.eclipse.org) IDE.

Things you can do with Thermo MK2 so far:
  * Switching Perspectives (see top-right) ... more information about Perspectives see [Eclipse](http://www.eclipse.org).
  * Switching between Source- and Design-Mode (see text editor in the middle) ... more information about the "Design View" see [Flash Builder 4.6](http://www.adobe.com/products/flash-builder.html).

Things that Thermo MK2 should do:
  * Thermo MK2 should detect SkinParts and SkinStates of SkinnableComponents.
  * Thermo MK2 should be able to draw graphics in a [FXG 2.0](http://sourceforge.net/adobe/flexsdk/wiki/FXG%202.0%20Specification/) compliant way.
  * Thermo MK2 should be able to import FXG files, Photoshop and Illustrator files.
  * Thermo MK2 should be able to communicate via a certain API with Flash Builder 4.7 or other IDEs.
  * Thermo MK2 should be able to visually manage and edit CSS files.
  * Thermo MK2 should be able to visually link SkinnableComponents with their Skins within CSS files.
  * Thermo MK2 should be clever about screen sizes (compare with [Adobe Edge Reflow](http://html.adobe.com/edge/reflow/)).

The Data-Centric features inside Thermo MK2 are not necessarily needed because other IDEs would be more appropriate for that.

## Screenshot of Thermo MK2 ##

[![](http://masuland.googlecode.com/files/ThermoMK2ScreenshotWeb.png)](https://dl.dropboxusercontent.com/u/352808/code/ProposalThermoMK2/index.html)

## Thermo MK2 Client with Flex 4.5 (Spark & MX) ##

([Thermo MK2 Live-App](https://dl.dropboxusercontent.com/u/352808/code/ProposalThermoMK2/index.html)) ([Thermo MK2 Sourcecode](https://dl.dropboxusercontent.com/u/352808/code/ProposalThermoMK2/srcview/index.html))

The Thermo MK2 coding convention follows an [Application Development Procedure](http://code.google.com/p/masuland/wiki/ApplicationDevelopmentProcedure) and a set of Architectual Patterns - hereby called [Nanoarchitectures](Nanoarchitecture.md). The used Nanoarchitectures can be summarized as follows: MVCpshCtlDS\_PInj (see diagram below). Thermo MK2 uses the latest version of the [Parsley 3.0](http://www.spicefactory.org/parsley/) Microarchitecture.

![http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png](http://masuland.googlecode.com/files/Flex4SparkAppWithNanoarchitecturesMVCpshCtlDS_PInj.png)

### Used Nanoarchitectures ###

More details about the used Nanoarchitectures can be found here:

  * ["View - Component" (VCp)](NanoarchitectureVCb.md)
  * ["C-Push" (Cpsh)](NanoarchitectureCpsh.md)
  * ["Property Injection" (PInj)](NanoarchitecturePInj.md)
  * ["Model" (M)](NanoarchitectureM.md)
  * ["Controller" (Ctl)](NanoarchitectureCtl.md)
  * "Delegate" (D)
  * "Service" (S)

# More Code Examples #

  * [LoginExample](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)
  * [ReligionChooser](ReligionChooser.md) written in Flex 4.1 (Spark)

# Feedback #

Please feel free to post comments, suggestions or feature requests because Thermo MK2 is still work in progress and under consideration on the [Apache Flex-Dev Mailinglist](http://incubator.apache.org/flex/mailing-lists.html).