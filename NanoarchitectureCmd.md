# "Command" (Cmd) Nanoarchitecture #

#### "Command" (Cmd) Nanoarchitecture with Cairngorm 2.2.2 ####
```
	public class GetSettingsCommand implements ICommand, IResponder
	{
		//----------------------
		// Methods
		//----------------------
		
		public function execute(event:CairngormEvent):void
		{
			var delegate:IAppDelegate = new AppMockDelegate(this);
			delegate.getSettings();
		}
		
		public function result(data:Object):void
		{
			var appModel:AppModel = AppModel.getInstance();
			
			appModel.settings = SettingsVO( data.result );
			
			// Load layout
			new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )).dispatch();
		}

		public function fault(info:Object):void
		{
			Alert.show('fault: ' + event.fault);
		}
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx3Cairngorm222/trunk/src/main/flex/com/masuland/loginexample/action/command/GetSettingsCommand.as)._

#### "Command" (Cmd) Nanoarchitecture with Mate ####
```
	public class GetSettingsCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		public var appModel:AppModel;
		
		private var dispatcher:IEventDispatcher;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function GetSettingsCommand(dispatcher:IEventDispatcher)
		{
			this.dispatcher = dispatcher;
		}
		
		//----------------------
		// Handler
		//----------------------
		
		public function getSettings_resultHandler(settings:SettingsVO):void
		{
			appModel.settings = settings;
			
			// Load layout
			dispatcher.dispatchEvent(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		public function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show('getSettings_faultHandler: ' + event.fault);
		}
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroMateMobileMVCpshCmd_PInj/trunk/src/main/flex/com/masuland/loginexample/action/command/GetSettingsCommand.as)._

#### "Command" (Cmd) Nanoarchitecture with Parsley ####
```
	public class GetSettingsCommand
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
		
		[MessageHandler(selector='AppEvent.GET_SETTINGS')]
		public function getSettings(event:AppEvent):void
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(new Responder(getSettings_resultHandler, getSettings_faultHandler));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function getSettings_resultHandler(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			dispatcher(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		protected function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show('getSettings_faultHandler: ' + event.fault);
		}
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloParsleyMVCbCmd/trunk/src/main/flex/com/masuland/loginexample/action/command/GetSettingsCommand.as)._

#### "Command" (Cmd) Nanoarchitecture with Robotlegs / Signals ####
```
	public class GetSettingsCommand extends SignalCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		[Inject]
		public var loadLayoutSignal:LoadLayoutSignal;
		
		//----------------------
		// Methods
		//----------------------
		
		override public function execute():void
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(new Responder(getSettings_resultHandler, getSettings_faultHandler));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function getSettings_resultHandler(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			loadLayoutSignal.dispatch(LayoutVO( appModel.settings.layouts.getItemAt(0) ), true);
		}
		
		protected function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show('getSettings_faultHandler: ' + event.fault);
		}
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HeroRobotlegsSignalsMobileMVCpshCmd/trunk/src/main/flex/com/masuland/loginexample/action/command/GetSettingsCommand.as)._

#### "Command" (Cmd) Nanoarchitecture with Spring ####
```
	public class GetSettingsCommand extends EventDispatcher
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
		
		[EventHandler(name='AppEvent.GET_SETTINGS')]
		public function getSettings(event:AppEvent):void
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(new Responder(getSettings_resultHandler, getSettings_faultHandler));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function getSettings_resultHandler(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			dispatchEvent(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		protected function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show('getSettings_faultHandler: ' + event.fault);
		}
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSpringMVCbCmd/trunk/src/main/flex/com/masuland/loginexample/action/command/GetSettingsCommand.as)._

#### "Command" (Cmd) Nanoarchitecture with Swiz ####
```
	public class GetSettingsCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		//----------------------
		// Methods
		//----------------------
		
		[EventHandler(event='AppEvent.GET_SETTINGS')]
		public function getSettings(event:AppEvent):void
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(new Responder(getSettings_resultHandler, getSettings_faultHandler));
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function getSettings_resultHandler(event:ResultEvent):void
		{
			appModel.settings = SettingsVO( event.result );
			
			// load layout
			dispatcher.dispatchEvent(new LoadLayoutEvent(LayoutVO( appModel.settings.layouts.getItemAt(0) )));
		}
		
		protected function getSettings_faultHandler(event:FaultEvent):void
		{
			Alert.show('getSettings_fault: ' + event.fault);
		}
	}
```
_Complete source available in the  [svn repo](http://masuland.googlecode.com/svn/trunk/LoginExampleFx4HaloSwizMVCbCmd/trunk/src/main/flex/com/masuland/loginexample/action/command/GetSettingsCommand.as)._

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
  * ["Controller" (Ctl)](NanoarchitectureCtl.md)

...

## Frequently Asked Questions (FAQs) ##

#### What's a Nanoarchitecture? ####
Please read this page about [Nanoarchitectures](Nanoarchitecture.md).

...

## Feedback ##

Please feel free to post comments, suggestions or feature requests because this page is still work in progress.