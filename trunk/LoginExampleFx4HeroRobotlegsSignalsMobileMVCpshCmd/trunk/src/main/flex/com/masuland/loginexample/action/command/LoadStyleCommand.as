package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.signal.LoadStyleSignal;
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import flash.events.IEventDispatcher;
	
	import mx.core.FlexGlobals;
	import mx.events.StyleEvent;
	import mx.styles.IStyleManager2;
	import mx.styles.StyleManager;
	
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author masuland.com
	 */
	public class LoadStyleCommand extends SignalCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		[Inject]
		public var style:StyleVO;
		
		//----------------------
		// Methods
		//----------------------
		
		override public function execute():void
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
