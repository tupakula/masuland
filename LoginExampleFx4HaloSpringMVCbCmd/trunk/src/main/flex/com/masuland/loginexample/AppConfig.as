package com.masuland.loginexample
{
	import com.masuland.loginexample.business.AppMockDelegate;
	import com.masuland.loginexample.action.command.GetSettingsCommand;
	import com.masuland.loginexample.action.command.GotoLoginCommand;
	import com.masuland.loginexample.action.command.GotoRegisterCommand;
	import com.masuland.loginexample.action.command.InitAppCommand;
	import com.masuland.loginexample.action.command.LoadLayoutCommand;
	import com.masuland.loginexample.action.command.LoadLocaleCommand;
	import com.masuland.loginexample.action.command.LoadStyleCommand;
	import com.masuland.loginexample.action.command.LoginCommand;
	import com.masuland.loginexample.action.command.LogoutCommand;
	import com.masuland.loginexample.action.command.RegisterCommand;
	import com.masuland.loginexample.action.command.UpdateUserCommand;
	import com.masuland.loginexample.action.event.AppEvent;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.core.IMXMLObject;
	import mx.events.FlexEvent;
	
	import org.springextensions.actionscript.context.support.FlexXMLApplicationContext;
	import org.springextensions.actionscript.core.event.EventBus;
	import org.springextensions.actionscript.ioc.factory.config.EventHandlerMetadataProcessor;
	import org.springextensions.actionscript.ioc.factory.config.RouteEventsMetaDataProcessor;
	import org.springextensions.actionscript.stage.DefaultAutowiringStageProcessor;
	
	import spark.components.Application;
	
//	[RouteEvents(events='AppEvent.INIT_APP')]
//	[Event(name='AppEvent.INIT_APP',type='com.masuland.loginexample.control.event.AppEvent')]
	public class AppConfig extends EventDispatcher implements IMXMLObject
	{
		//----------------------
		// Properties
		//----------------------
		
//		[Embed(source='application-config.xml', mimeType ='application/octet-stream')]
//		public var contextConfig:Class;
		
		public var applicationContext:FlexXMLApplicationContext;
		
		// Force inclusion of classes not referenced elsewhere in the code
		{
			InitAppCommand,
			GetSettingsCommand,
			LoadLayoutCommand,
			LoadStyleCommand,
			LoadLocaleCommand,
			
			GotoLoginCommand,
			GotoRegisterCommand,
			LoginCommand,
			RegisterCommand,
			UpdateUserCommand,
			LogoutCommand,

			AppMockDelegate, 
			EventHandlerMetadataProcessor, 
			DefaultAutowiringStageProcessor, 
			RouteEventsMetaDataProcessor
		}
		
		//----------------------
		// Methods
		//----------------------
		
		public function initialized(document:Object, id:String):void
		{
			applicationContext = new FlexXMLApplicationContext();
			
			// Embed
//			applicationContext.addEmbeddedConfig(contextConfig);
//			dispatchEvent(new AppEvent(AppEvent.INIT_APP));
			
			// Load
			(FlexGlobals.topLevelApplication as Application).addEventListener(FlexEvent.INITIALIZE, loadContext);
		}
		
		public function loadContext(event:FlexEvent) : void
		{
			applicationContext.addConfigLocation('application-config.xml');
			applicationContext.addEventListener(Event.COMPLETE, loadContext_completeHandler);
			applicationContext.addEventListener(IOErrorEvent.IO_ERROR, loadContext_ioErrorHandler);
			applicationContext.load();
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function loadContext_completeHandler(event:Event):void 
		{
			EventBus.dispatchEvent(new AppEvent(AppEvent.INIT_APP));
		}
		
		protected function loadContext_ioErrorHandler(event:IOErrorEvent):void 
		{
			Alert.show('An error occurred when loading the xml for the application context: "' + event.text + '"', 'Error Loading Application Context');
		}
	}
}