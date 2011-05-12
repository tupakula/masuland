package com.masuland.loginexample.action.task
{
	import com.adobe.cairngorm.task.Task;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import flash.events.IEventDispatcher;
	
	import mx.core.FlexGlobals;
	import mx.events.StyleEvent;
	import mx.styles.IStyleManager2;
	import mx.styles.StyleManager;

	/**
	 * @author masuland.com
	 */
	public class LoadStyleTask extends Task
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		public var style:StyleVO;
		
		//----------------------
		// Methods
		//----------------------
		
		override protected function performTask():void
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
		// Properties
		//----------------------
		
		/**
		 * 
		 */
		private function loadStyle_completeHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;

			complete();
		}
		
		/**
		 * 
		 */
		private function loadStyle_errorHandler(event:StyleEvent):void
		{
			appModel.isApplicationVisible = true;
			
			fault('Error loading Style');
		}
	}
}