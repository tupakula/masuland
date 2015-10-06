# "Property Injection" (PInj) Nanoarchitecture #

#### Observing Properties of injected objects with the ChangeWatcher ####

The following example is from a Robotlegs / Signals project

```
	[Inject]
	public var appModel:AppModel;

	public function postConstruct():void
	{
		ChangeWatcher.watch(appModel, 'settings', settings_changeHandler);
	}

	protected function settings_changeHandler(event:Event):void
	{
		_settings = appModel.settings;
			
		_isSettingsDirty = true;
		invalidateProperties();
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroRobotlegsSignalsMobileMVCpshCmd/trunk/src/main/flex/com/masuland/loginexample/view/component/SettingsBoxCP.as)._

#### "Property Injection" (PInj) with Parsley ####
```
	[Subscribe(scope='appModel', objectId='settings')]
	[Bindable]
	public function get settings():SettingsVO
	{
		return _settings;
	}
		
	public function set settings(value:SettingsVO):void
	{
		_settings = value;
		
		_isSettingsDirty = true;
		invalidateProperties();
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroParsleyMobileMVCpshCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/view/component/SettingsBoxCP.as)._

#### "Property Injection" (PInj) with Spring ####
```
	[Inject(name='appModel', property='settings')]
	[Bindable]
	public function get settings():SettingsVO
	{
		return _settings;
	}
		
	public function set settings(value:SettingsVO):void
	{
		_settings = value;
		
		_isSettingsDirty = true;
		invalidateProperties();
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSpringMobileMVCpshCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/view/component/SettingsBoxCP.as)._

#### "Property Injection" (PInj) with Swiz ####
```
	[Inject(source='appModel.settings', bind='true')]
	[Bindable]
	public function get settings():SettingsVO
	{
		return _settings;
	}
	
	public function set settings(value:SettingsVO):void
	{
		_settings = value;
		
		_isSettingsDirty = true;
		invalidateProperties();
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSwizMobileMVCpshCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/view/component/SettingsBoxCP.as)._

## Code Examples Implementing PInj ##

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)
  * [Religion Chooser](ReligionChooser.md) with Flex 4.1 (Spark)

...

## More Nanoarchitectures ##

  * ["View - Code Behind / Component" (VCb / VCp)](NanoarchitectureVCb.md)
  * ["C-Pull" (Cpll)](NanoarchitectureCpll.md)
  * ["C-Push" (Cpsh)](NanoarchitectureCpsh.md)
  * ["No Event" (NoEvt)](NanoarchitectureNoEvt.md)
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