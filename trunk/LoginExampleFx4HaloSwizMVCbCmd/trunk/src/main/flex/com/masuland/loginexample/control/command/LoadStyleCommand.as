package com.masuland.loginexample.control.command
{
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.control.event.LoadStyleEvent;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.vo.StyleVO;
	
	import flash.events.IEventDispatcher;
	
	import mx.core.FlexGlobals;
	import mx.events.StyleEvent;
	import mx.styles.IStyleManager2;
	import mx.styles.StyleManager;

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
		
		/**
		 * 
		 */
		[EventHandler(event='LoadStyleEvent.EVENT_NAME', properties='style')]
		public function loadStyle(style:StyleVO):void 
		{
			var myEvent:IEventDispatcher;
			var myStyleManager:IStyleManager2 = StyleManager.getStyleManager(FlexGlobals.topLevelApplication.moduleFactory);
			
			if (appModel != null)
			{
				if (appModel.currentStyle != null)
				{
					myStyleManager.unloadStyleDeclarations(appModel.currentStyle.path, false);
				}
				
				appModel.currentStyle = style;
				
				myEvent = myStyleManager.loadStyleDeclarations(style.path, true);
				myEvent.addEventListener(StyleEvent.COMPLETE, loadStyle_completeHandler);
				myEvent.addEventListener(StyleEvent.ERROR, loadStyle_errorHandler);
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		/**
		 * 
		 */
		protected function loadStyle_completeHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
		
		/**
		 * 
		 */
		protected function loadStyle_errorHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
		}
	}
}