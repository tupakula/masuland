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
	
	[SkinState("closed")]
	[SkinState("open")]
	[SkinState("openMore")]
	public class SettingsBoxCB extends SkinnableComponent
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

		[SkinPart(require="true")]
		public var btn_settings:ToggleButton;

		[SkinPart(require="false")]
		public var btn_moreSettings:ToggleButton;

		[Inject(source="appModel.currentLayout", bind="true")]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Inject(source="appModel.currentStyle", bind="true")]
		[Bindable]
		public var currentStyle:StyleVO;
		
		[Inject(source="appModel.currentLocale", bind="true")]
		[Bindable]
		public var currentLocale:LocaleVO;
		
		[Bindable]
		public var settingsButtonSelected:Boolean = true;

		[Bindable]
		public var moreSettingsButtonSelected:Boolean = false;
		
		override protected function getCurrentSkinState():String
		{
			if (settingsButtonSelected && moreSettingsButtonSelected)
			{
				return 'openMore';
			}
			else if (settingsButtonSelected)
			{
				return 'open';
			}
			else
			{
				return 'closed';
			}
		}
		
		public function changeStyle(style:StyleVO):void
		{
			dispatcher.dispatchEvent(new LoadStyleEvent(style));
		}
		
		public function changeLocale(locale:LocaleVO):void
		{
			dispatcher.dispatchEvent(new LoadLocaleEvent(locale));
		}
		
		public function settingsButton_clickHandler(event:MouseEvent):void
		{
			if (settingsButtonSelected)
			{
				settingsButtonSelected = false;
			}
			else
			{
				settingsButtonSelected = true;
			}
			
			invalidateSkinState();
		}
		
		public function moreSettingsButton_clickHandler(event:MouseEvent):void
		{
			if (moreSettingsButtonSelected)
			{
				moreSettingsButtonSelected = false;
			}
			else
			{
				moreSettingsButtonSelected = true;
			}
			
			invalidateSkinState();
		}
	}
}