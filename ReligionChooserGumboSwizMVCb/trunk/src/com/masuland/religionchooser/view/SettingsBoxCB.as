package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.LoadLocaleEvent;
	import com.masuland.religionchooser.event.LoadStyleEvent;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.StyleVO;
	
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import spark.components.ToggleButton;
	import spark.components.supportClasses.SkinnableComponent;
	
	public class SettingsBoxCB extends SkinnableComponent
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[SkinPart(require="true")]
		public var btn_settings:ToggleButton;

		[Inject(source="appModel.currentLayout", bind="true")]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Inject(source="appModel.currentStyle", bind="true")]
		[Bindable]
		public var currentStyle:StyleVO;
		
		[Inject(source="appModel.currentLocale", bind="true")]
		[Bindable]
		public var currentLocale:LocaleVO;
		
		public function SettingsBoxCB()
		{
			btn_settings = new ToggleButton();
			btn_settings.addEventListener(MouseEvent.CLICK, button_clickHandler);
		}
		
		public function changeStyle(style:StyleVO):void
		{
			dispatcher.dispatchEvent(new LoadStyleEvent(style));
		}
		
		public function changeLocale(locale:LocaleVO):void
		{
			dispatcher.dispatchEvent(new LoadLocaleEvent(locale));
		}
		
		protected function button_clickHandler(event:MouseEvent):void
		{				
			const state:String = currentState;
			
			if (state == 'open') 
			{
				currentState = 'closed';
				btn_settings.selected = false;
			}
			
			if (state == 'closed') 
			{
				currentState = 'open';
				btn_settings.selected = true;
			}
		}
	}
}