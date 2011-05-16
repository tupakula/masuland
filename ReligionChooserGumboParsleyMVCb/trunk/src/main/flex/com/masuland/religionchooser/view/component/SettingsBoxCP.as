package com.masuland.religionchooser.view.component
{
	import com.masuland.religionchooser.action.event.LoadLocaleEvent;
	import com.masuland.religionchooser.action.event.LoadStyleEvent;
	import com.masuland.religionchooser.data.vo.LayoutVO;
	import com.masuland.religionchooser.data.vo.LocaleVO;
	import com.masuland.religionchooser.data.vo.StyleVO;
	
	import flash.events.MouseEvent;
	
	import spark.components.ToggleButton;
	import spark.components.supportClasses.SkinnableComponent;
	
	[SkinState('closed')]
	[SkinState('open')]
	[SkinState('openMore')]
	/**
	 * @author masuland.com
	 */
	public class SettingsBoxCP extends SkinnableComponent
	{
		//----------------------
		// Skin Parts
		//----------------------
		
		[SkinPart(require='true')]
		public var btn_settings:ToggleButton;
		
		[SkinPart(require='false')]
		public var btn_moreSettings:ToggleButton;

		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope='appModel', objectId='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Subscribe(scope='appModel', objectId='currentStyle')]
		[Bindable]
		public var currentStyle:StyleVO;
		
		[Subscribe(scope='appModel', objectId='currentLocale')]
		[Bindable]
		public var currentLocale:LocaleVO;
		
		[Bindable]
		public var settingsButtonSelected:Boolean = true;

		[Bindable]
		public var moreSettingsButtonSelected:Boolean = false;

		//----------------------
		// Skin Parts
		//----------------------
		
		public function SettingsBoxCP()
		{
			addEventListener(Event.ADDED_TO_STAGE, function():void
			{
				dispatchEvent(new Event('configureIOC', true));
			});
		}

		//----------------------
		// Skin Parts
		//----------------------
		
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
			dispatcher(new LoadStyleEvent(style));
		}
		
		public function changeLocale(locale:LocaleVO):void
		{
			dispatcher(new LoadLocaleEvent(locale));
		}
		
		//----------------------
		// Skin Parts
		//----------------------
		
		public function btn_settings_clickHandler(event:MouseEvent):void
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
		
		public function btn_moreSettings_clickHandler(event:MouseEvent):void
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
