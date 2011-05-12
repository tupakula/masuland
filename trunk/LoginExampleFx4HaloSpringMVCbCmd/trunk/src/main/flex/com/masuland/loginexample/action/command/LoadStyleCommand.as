package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.data.AppModel;
	
	import flash.events.IEventDispatcher;
	
	import mx.core.FlexGlobals;
	import mx.events.StyleEvent;
	import mx.styles.IStyleManager2;
	import mx.styles.StyleManager;

	/**
	 * @author masuland.com
	 */
	public class LoadStyleCommand
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
		
		[EventHandler(name='LoadStyleEvent.EVENT_NAME')]
		public function loadStyle(event:LoadStyleEvent):void 
		{
			var myEvent:IEventDispatcher;
			var myStyleManager:IStyleManager2 = StyleManager.getStyleManager(FlexGlobals.topLevelApplication.moduleFactory);
			
			if (appModel != null)
			{
				if (appModel.currentStyle != null)
				{
					myStyleManager.unloadStyleDeclarations(appModel.currentStyle.path, false);
				}
				
				appModel.currentStyle = event.style;
				
				myEvent = myStyleManager.loadStyleDeclarations(event.style.path, true);
				myEvent.addEventListener(StyleEvent.COMPLETE, loadStyle_completeHandler);
				myEvent.addEventListener(StyleEvent.ERROR, loadStyle_errorHandler);
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function loadStyle_completeHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
		
		protected function loadStyle_errorHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
	}
}
