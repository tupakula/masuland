package com.masuland.loginexample
{
	import com.masuland.loginexample.action.AppController;
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.business.AppMockDelegate;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	
	import mx.core.FlexGlobals;
	import mx.core.IMXMLObject;
	import mx.events.FlexEvent;
	
	import org.as3commons.eventbus.singleton.StaticEventBus;
	import org.springextensions.actionscript.context.impl.xml.XMLApplicationContext;
	import org.springextensions.actionscript.eventbus.process.EventHandlerMetadataProcessor;
	import org.springextensions.actionscript.eventbus.process.RouteEventsMetaDataProcessor;
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
		
		public var applicationContext:XMLApplicationContext;
		
		// Force inclusion of classes not referenced elsewhere in the code
		{
			AppController, 
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
//			FlashStageObjectProcessorRegistry.getInstance().stage = (FlexGlobals.topLevelApplication as Application).stage;
			applicationContext = new XMLApplicationContext();
			
			// Embed
//			applicationContext.addEmbeddedConfig(contextConfig);
//			dispatchEvent(new AppEvent(AppEvent.INIT_APP));
			
			// Load
			(FlexGlobals.topLevelApplication as Application).addEventListener(FlexEvent.INITIALIZE, loadContext);
		}
		
		public function loadContext(event:FlexEvent) : void
		{
			applicationContext.addLocation('application-config.xml');
			applicationContext.addEventListener(Event.COMPLETE, loadContext_completeHandler);
			applicationContext.addEventListener(IOErrorEvent.IO_ERROR, loadContext_ioErrorHandler);
			applicationContext.load();
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function loadContext_completeHandler(event:Event):void 
		{
			StaticEventBus.dispatchEvent(new AppEvent(AppEvent.INIT_APP));
		}
		
		protected function loadContext_ioErrorHandler(event:IOErrorEvent):void 
		{
//			Alert.show('An error occurred when loading the xml for the application context: "' + event.text + '"', 'Error Loading Application Context');
		}
	}
}