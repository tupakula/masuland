package com.masuland.loginexample.cairngorm221.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.cairngorm221.control.event.LoadLocaleEvent;
	import com.masuland.loginexample.cairngorm221.model.AppModel;
	import com.masuland.loginexample.cairngorm221.state.AppStackState;
	import com.masuland.loginexample.cairngorm221.state.LoginBoxState;
	
	import flash.events.IEventDispatcher;
	
	import mx.core.Application;
	import mx.events.ResourceEvent;
	import mx.resources.ResourceManager;
	
	public class LoadLocaleCommand implements ICommand
	{
		public function execute(event:CairngormEvent):void
		{
			var appModel:AppModel = AppModel.getInstance();
			appModel.currentLocale = LoadLocaleEvent( event ).locale;
			
			ResourceManager.getInstance().localeChain = [ appModel.currentLocale.code ];
			ResourceManager.getInstance().update();
			
			// TODO ... Resource update bug
			
			var oldLoginBoxState:String = appModel.loginBoxState;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
			appModel.loginBoxState = oldLoginBoxState;

			var oldAppStackState:String = appModel.appStackState;
			appModel.appStackState = AppStackState.HIDDEN;
			appModel.appStackState = oldAppStackState;

/*			var resourceModuleURL:String;
			var eventDispatcher:IEventDispatcher;
			
			if (appModel.currentLocale != null)
			{
				resourceModuleURL = "AppResources_" + appModel.currentLocale.code + ".swf";
				eventDispatcher = ResourceManager.getInstance().loadResourceModule(resourceModuleURL);
				
				if (eventDispatcher != null)
				{
					eventDispatcher.addEventListener(ResourceEvent.COMPLETE, onLoadLocaleComplete);
					eventDispatcher.addEventListener(ResourceEvent.ERROR, onLoadLocaleError);
				}
			}
*/		}

		/**
		 * 
		 */
		private function onLoadLocaleComplete(event:ResourceEvent):void
		{	    	
			var appModel:AppModel = AppModel.getInstance();
			ResourceManager.getInstance().localeChain = [ appModel.currentLocale.code ];
		}
		
		/**
		 * 
		 */
		private function onLoadLocaleError(event:ResourceEvent):void
		{	    	
		}
	}
}