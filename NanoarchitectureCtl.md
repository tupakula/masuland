# "Controller" (Ctl) Nanoarchitecture #

**Definition:** The controller keeps a collection of commands.

#### "Controller" (Ctl) Nanoarchitecture with Parsley ####
```
	public class AppController
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		//----------------------
		// Methods
		//----------------------
		
		[Init]
		public function init():void
		{
			dispatcher(new AppEvent(AppEvent.INIT_APP));
		}

		[MessageHandler(selector='AppEvent.INIT_APP')]
		public function initializeClient(event:AppEvent):void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			dispatcher(new AppEvent(AppEvent.GET_SETTINGS));
		}
		
		[MessageHandler(selector='AppEvent.GET_SETTINGS')]
		public function getSettings(event:AppEvent):void
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(new Responder(getSettings_resultHandler, getSettings_faultHandler));
		}
		
		// [...]
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroParsleyMobileMVCpshCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/action/AppController.as)._

#### "Controller" (Ctl) Nanoarchitecture with Spring ####
```
	public class AppController extends EventDispatcher
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		//----------------------
		// Methods
		//----------------------
		
		[EventHandler(name='AppEvent.INIT_APP')]
		public function initApp(event:AppEvent):void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			dispatchEvent(new AppEvent(AppEvent.GET_SETTINGS));
		}
		
		[EventHandler(name='AppEvent.GET_SETTINGS')]
		public function getSettings(event:AppEvent):void
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(new Responder(getSettings_resultHandler, getSettings_faultHandler));
		}
		
		// [...]
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSpringMobileMVCpshCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/action/AppController.as)._

#### "Controller" (Ctl) Nanoarchitecture with Swiz ####
```
	public class AppController
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var serviceHelper:ServiceHelper;
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		//----------------------
		// Methods
		//----------------------
		
		[EventHandler(event='mx.events.FlexEvent.APPLICATION_COMPLETE')]
		public function initApp():void
		{
			appModel.appStackState = AppStackState.LOGIN;
			appModel.loginBoxState = LoginBoxState.LOGIN;
			appModel.settingsBoxState = SettingsBoxState.OPEN;
			
			// get settings
			dispatcher.dispatchEvent(new AppEvent(AppEvent.GET_SETTINGS));
		}
		
		[EventHandler(event='AppEvent.GET_SETTINGS')]
		public function getSettings():void
		{
			serviceHelper.executeServiceCall(
				appDelegate.getSettings(),
				getSettings_resultHandler,
				getSettings_faultHandler);
		}
		
		// [...]
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroSwizMobileMVCpshCtl_PInj/trunk/src/main/flex/com/masuland/loginexample/action/AppController.as)._

## Code Examples Implementing the "Controller" (Ctl) Nanoarchitecture ##

  * [Login Example](LoginExample.md) written in Flex 3 and Flex 4.1 (MX, Spark) and Flex 4.5 (Spark)

...

## More Nanoarchitectures ##

  * ["View - Code Behind / Component" (VCb / VCp)](NanoarchitectureVCb.md)
  * ["C-Pull" (Cpll)](NanoarchitectureCpll.md)
  * ["C-Push" (Cpsh)](NanoarchitectureCpsh.md)
  * ["No Event" (NoEvt)](NanoarchitectureNoEvt.md)
  * ["Property Injection" (PInj)](NanoarchitecturePInj.md)
  * ["Model" (M)](NanoarchitectureM.md)
  * ["Command" (Cmd)](NanoarchitectureCmd.md)

...

## Frequently Asked Questions (FAQs) ##

#### What's a Nanoarchitecture? ####
Please read this page about [Nanoarchitectures](Nanoarchitecture.md).

...

## Feedback ##

Please feel free to post comments, suggestions or feature requests because this page is still work in progress.