package com.masuland.loginexample.action.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.data.AppModel;
	
	import flash.events.IEventDispatcher;
	
	import mx.events.StyleEvent;
	import mx.styles.StyleManager;
	
	public class LoadStyleCommand implements ICommand
	{
		public function execute(event:CairngormEvent):void
		{
			var appModel:AppModel = AppModel.getInstance();
			var myEvent:IEventDispatcher;
			
			if (appModel != null)
			{
				if (appModel.currentStyle != null)
				{
					StyleManager.unloadStyleDeclarations(appModel.currentStyle.path, false);
				}
				
				appModel.currentStyle = LoadStyleEvent( event ).style;
				
				myEvent = StyleManager.loadStyleDeclarations(appModel.currentStyle.path, true);
				myEvent.addEventListener(StyleEvent.COMPLETE, onLoadStyleComplete);
				myEvent.addEventListener(StyleEvent.ERROR, onLoadStyleError);
			}
		}
		
		/**
		 * 
		 */
		private function onLoadStyleComplete(event:StyleEvent):void
		{
			var appModel:AppModel = AppModel.getInstance();
			
			appModel.isApplicationVisible = true;
		}
		
		/**
		 * 
		 */
		private function onLoadStyleError(event:StyleEvent):void
		{
			var appModel:AppModel = AppModel.getInstance();
			
			appModel.isApplicationVisible = true;
		}
	}
}