# "Model" (M) Nanoarchitecture #

#### "Model" (M) Nanoarchitecture with Cairngorm 2.2.2 ####
```
	[Bindable]
	public class AppModel 
	{
		//---------------
		// Values
		//---------------
		
		public var currentUser:UserVO;
		
		public var settings:SettingsVO;
		public var currentStyle:StyleVO;
		public var currentLayout:LayoutVO;
		public var currentLocale:LocaleVO;
		
		//---------------
		// Flags
		//---------------
		
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		public var loginBoxState:String;
		public var appStackState:String;
		public var settingsBoxState:String;

		//----------------------------------------------------------------------------------------
		//----------------------------------------------------------------------------------------
		
		private static var model:AppModel;
		
		// Constructor should be private but 
		// current AS3.0 does not allow it yet (?)...
		public function AppModel() 
		{	
		    if ( model != null )
		    {
				throw new Error('AppModel: Only one AppModel instance should be instantiated');	
		    }
		}

	        public static function getInstance() : AppModel 
		{
			if (model == null)
				model = new AppModel();

			return model;
		}
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx3Cairngorm222/trunk/src/main/flex/com/masuland/loginexample/data/AppModel.as)._

#### "Model" (M) Nanoarchitecture with Parsley and "Property Injection" (PInj) Nanoarchitecture ####
```
	[Bindable]
	public class AppModel
	{		
		//---------------
		// Values
		//---------------
		
		[Publish(scope='appModel', objectId='currentUser')]
		public var currentUser:UserVO;
		
		[Publish(scope='appModel', objectId='settings')]
		public var settings:SettingsVO;

		[Publish(scope='appModel', objectId='currentStyle')]
		public var currentStyle:StyleVO;
		
		[Publish(scope='appModel', objectId='currentLayout')]
		public var currentLayout:LayoutVO;
		
		[Publish(scope='appModel', objectId='currentLocale')]
		public var currentLocale:LocaleVO;
		
		//---------------
		// Flags
		//---------------
		
		[Publish(scope='appModel', objectId='isApplicationVisible')]
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		[Publish(scope='appModel', objectId='loginBoxState')]
		public var loginBoxState:String;
		
		[Publish(scope='appModel', objectId='appStackState')]
		public var appStackState:String;
		
		[Publish(scope='appModel', objectId='settingsBoxState')]
		public var settingsBoxState:String;
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroParsleyWebMVCpshCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/data/AppModel.as)._

#### "Model" (M) Nanoarchitecture (remaining cases) ####
```
	[Bindable]
	public class AppModel
	{		
		//---------------
		// Values
		//---------------
		
		public var currentUser:UserVO;
		
		public var settings:SettingsVO;
		public var currentStyle:StyleVO;
		public var currentLayout:LayoutVO;
		public var currentLocale:LocaleVO;
		
		//---------------
		// Flags
		//---------------
		
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		public var loginBoxState:String;
		public var appStackState:String;
		public var settingsBoxState:String;
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroMateMobileMVCpshCmd_PInj/trunk/src/main/flex/com/masuland/loginexample/data/AppModel.as)._

## Code Examples Implementing the "Model" (M) Nanoarchitecture ##

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)
  * [Religion Chooser](ReligionChooser.md) with Flex 4.1 (Spark)

...

## More Nanoarchitectures ##

  * ["View - Code Behind / Component" (VCb / VCp)](NanoarchitectureVCb.md)
  * ["C-Pull" (Cpll)](NanoarchitectureCpll.md)
  * ["C-Push" (Cpsh)](NanoarchitectureCpsh.md)
  * ["No Event" (NoEvt)](NanoarchitectureNoEvt.md)
  * ["Property Injection" (PInj)](NanoarchitecturePInj.md)
  * ["Controller" (Ctl)](NanoarchitectureCtl.md)
  * ["Command" (Cmd)](NanoarchitectureCmd.md)

...

## Frequently Asked Questions (FAQs) ##

#### What's a Nanoarchitecture? ####
Please read this page about [Nanoarchitectures](Nanoarchitecture.md).

...

## Feedback ##

Please feel free to post comments, suggestions or feature requests because this page is still work in progress.