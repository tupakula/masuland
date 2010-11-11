package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.ChoiceVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class AppViewCB extends SkinnableComponent
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[SkinPart(require="true")]
		public var bx_settings:SettingsBoxCB;
	}
}