**Please note:** The letter "C" means "Code Behind" in Flex 3 applications and "Component" in Flex 4 applications.

# C-Push (Cpsh) Nanoarchitecture #

#### UIComponent (Flex 3) / Skin (Flex 4) with C-Push ####

```
	<s:DropDownList
		id="ddl_style"
		minWidth="130"
		width="100%"
		requireSelection="true"
		/>
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboParsleyMVCpshCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/view/skin/SettingsBoxSkin.mxml)._

#### Code Behind (Flex 3) / Component (Flex 4) with C-Push ####

```
	[SkinPart(required='true')]
	public var ddl_style:DropDownList;

	[MessageDispatcher]
	public var dispatcher:Function;

	override protected function partAdded(partName:String, instance:Object):void 
	{
		super.partAdded(partName, instance);
		
		if (instance == ddl_style) 
		{
			ddl_style.addEventListener(IndexChangeEvent.CHANGE, ddl_style_changeHandler);
		}
	}

	override protected function partRemoved(partName:String, instance:Object):void 
	{
		super.partRemoved(partName, instance);
		
		if (instance == ddl_style) 
		{
			ddl_style.removeEventListener(IndexChangeEvent.CHANGE, ddl_style_changeHandler);
		}
	}

	override protected function commitProperties():void
	{
		super.commitProperties();
		
		if (_isCurrentLayoutDirty)
		{
			ddl_style.dataProvider = _currentLayout.styles;
			
			_isCurrentLayoutDirty = false;
		}
		
		if (_isCurrentStyleDirty)
		{
			ddl_style.selectedItem = _currentStyle;
			_isCurrentStyleDirty = false;
		}
	}

	protected function ddl_style_changeHandler(event:IndexChangeEvent):void
	{
		dispatcher(new LoadStyleEvent(ddl_style.selectedItem as StyleVO));
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4GumboParsleyMVCpshCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/view/component/SettingsBoxCP.as)._

## Code Examples Implementing Cpsh ##

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)
  * [Religion Chooser](ReligionChooser.md) with Flex 4.1 (Spark)

...

## More Nanoarchitectures ##

  * ["View - Code Behind / Component" (VCb / VCp)](NanoarchitectureVCb.md)
  * ["C-Pull" (Cpll)](NanoarchitectureCpll.md)
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