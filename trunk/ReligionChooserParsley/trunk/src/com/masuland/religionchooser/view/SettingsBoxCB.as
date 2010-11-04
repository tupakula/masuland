package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.ChoiceVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class SettingsBoxCB extends SkinnableComponent
	{
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(objectId="locales")]
		[Bindable]
		public var locales:ArrayCollection;
		
		[Subscribe(objectId="selectedLocale")]
		[Bindable]
		public var selectedLocale:LocaleVO;
		
		public function changeLocale(locale:LocaleVO):void
		{
			var e:AppEvent = new AppEvent(AppEvent.CHANGE_LANGUAGE);
			e.locale = locale;
			
			dispatcher(e);
		}
	}
}