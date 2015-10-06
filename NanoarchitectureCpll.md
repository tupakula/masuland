**Please note:** The letter "C" means "Code Behind" in Flex 3 applications and "Component" in Flex 4 applications.

# C-Pull (Cpll) Nanoarchitecture #

#### UIComponent (Flex 3) / Skin (Flex 4) with C-Pull ####

```
	<s:DropDownList
		id="cb_style"
		minWidth="130"
		width="100%"
		dataProvider="{ hostComponent.appModel.currentLayout.styles }"
		selectedItem="{ hostComponent.appModel.currentStyle }"
		requireSelection="true"
		change="hostComponent.loadStyle(StyleVO( cb_style.selectedItem ))"
		/>
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboParsleyMVCpllCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/view/skin/SettingsBoxSkin.mxml)._

#### Code Behind (Flex 3) / Component (Flex 4) with C-Pull ####

```
	[Inject]
	[Bindable]
	public var appModel:AppModel;

	[MessageDispatcher]
	public var dispatcher:Function;

	public function loadStyle(style:StyleVO):void
	{
		dispatcher(new LoadStyleEvent(style));
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboParsleyMVCpllCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/view/component/SettingsBoxCP.as)._

## Code Examples Implementing Cpll ##

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)

...

## More Nanoarchitectures ##

  * ["View - Code Behind / Component" (VCb / VCp)](NanoarchitectureVCb.md)
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