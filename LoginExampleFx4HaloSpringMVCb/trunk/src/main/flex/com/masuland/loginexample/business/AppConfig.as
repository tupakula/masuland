package com.masuland.loginexample.business
{
	import com.masuland.loginexample.control.AppController;
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.view.AppView;
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.IMXMLObject;
	import mx.events.FlexEvent;
	
	import org.springextensions.actionscript.context.support.FlexXMLApplicationContext;
	import org.springextensions.actionscript.core.event.EventBus;
	import org.springextensions.actionscript.ioc.factory.config.EventHandlerMetaDataPostProcessor;
	import org.springextensions.actionscript.ioc.factory.config.RouteEventsMetaDataPostProcessor;
	import org.springextensions.actionscript.stage.DefaultAutowiringStageProcessor;

	public class AppConfig extends EventDispatcher implements IMXMLObject
	{
		// Force inclusion of classes not referenced elsewhere in the code
		{
			AppController,AppMockDelegate,EventHandlerMetaDataPostProcessor,DefaultAutowiringStageProcessor,RouteEventsMetaDataPostProcessor;
		}
		
		public var applicationContext:FlexXMLApplicationContext;
		private var component:Application;
		
		public function initialized(document:Object, id:String) : void
		{
			component = document as Application;
			
			if (component)
			{
				component.addEventListener(FlexEvent.APPLICATION_COMPLETE, createContext);
			}
			else
			{
				throw new Error("The config should be included in the Application class.");
			}
		}
			
		private function createContext(event:FlexEvent) : void
		{
			applicationContext = new FlexXMLApplicationContext();
			applicationContext.addConfigLocation("application-config.xml");
			applicationContext.addEventListener(Event.COMPLETE, applicationContext_completeHandler);
			applicationContext.addEventListener(IOErrorEvent.IO_ERROR, applicationContext_ioErrorHandler);
			applicationContext.load();
		}
		
		private function applicationContext_completeHandler(event:Event) : void 
		{
			EventBus.dispatchEvent(new AppEvent(AppEvent.INITIALIZE_CLIENT));
		}
		
		private function applicationContext_ioErrorHandler(event:IOErrorEvent) : void 
		{
			Alert.show("An error occurred when loading the xml for the application context: '" + event.text + "'", "Error Loading Application Context");
		}
	}
}