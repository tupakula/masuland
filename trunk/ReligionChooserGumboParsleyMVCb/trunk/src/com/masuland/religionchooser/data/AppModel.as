package com.masuland.religionchooser.data
{
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	import com.masuland.religionchooser.vo.SettingsVO;
	import com.masuland.religionchooser.vo.StyleVO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * @author masuland.com
	 */
	public class AppModel
	{		
		//---------------
		// Values
		//---------------
		
		// Settings
		
		[Publish(objectId='settings')]
		public var settings:SettingsVO;

		[Publish(objectId='currentLayout')]
		public var currentLayout:LayoutVO;

		[Publish(objectId='currentLocale')]
		public var currentLocale:LocaleVO;
		
		[Publish(objectId='currentStyle')]
		public var currentStyle:StyleVO;
		
		// Content
		
		[Publish(objectId='rootQuestion')]
		public var rootQuestion:QuestionVO;
		
		[Publish(objectId='selectedQuestion')]
		public var selectedQuestion:QuestionVO;
		
		[Publish(objectId='selectedResult')]
		public var selectedResult:ResultVO;
		
		[Publish(objectId='appViewState')]
		public var appViewState:String;

		//---------------
		// Flags
		//---------------
		
		
		//---------------
		// States
		//---------------
		
	}
}