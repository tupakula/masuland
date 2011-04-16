package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.action.event.LoadLocaleEvent;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import flash.events.EventDispatcher;

	[RouteEvents(events='LoadStyleEvent.EVENT_NAME, LoadLocaleEvent.EVENT_NAME')]
	[Event(name='LoadStyleEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoadStyleEvent')]
	[Event(name='LoadLocaleEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.LoadLocaleEvent')]
	public class LoadLayoutCommand extends EventDispatcher
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		//----------------------
		// Methods
		//----------------------
		
		/**
		 * 
		 */
		[EventHandler(name='LoadLayoutEvent.EVENT_NAME')]
		public function loadLayout(event:LoadLayoutEvent):void 
		{
			appModel.currentLayout = event.layout;
			
			// load style
			dispatchEvent(new LoadStyleEvent(StyleVO( appModel.currentLayout.styles.getItemAt(0) )));
			
			// load locales
			dispatchEvent(new LoadLocaleEvent(LocaleVO( appModel.currentLayout.locales.getItemAt(0) )));
		}
	}
}