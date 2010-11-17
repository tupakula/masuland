package com.masuland.religionchooser.view.component
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.ChoiceVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class AppViewCB extends SkinnableComponent
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[SkinPart(require="true")]
		public var bx_content:ContentBoxCB;
		
		[SkinPart(require="true")]
		public var bx_settings:SettingsBoxCB;
	}
}