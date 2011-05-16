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
		
		[Publish(scope='appModel', objectId='settings')]
		public var settings:SettingsVO;

		[Publish(scope='appModel', objectId='currentLayout')]
		public var currentLayout:LayoutVO;

		[Publish(scope='appModel', objectId='currentLocale')]
		public var currentLocale:LocaleVO;
		
		[Publish(scope='appModel', objectId='currentStyle')]
		public var currentStyle:StyleVO;
		
		// Content
		
		[Publish(scope='appModel', objectId='rootQuestion')]
		public var rootQuestion:QuestionVO;
		
		[Publish(scope='appModel', objectId='selectedQuestion')]
		public var selectedQuestion:QuestionVO;
		
		[Publish(scope='appModel', objectId='selectedResult')]
		public var selectedResult:ResultVO;

		//---------------
		// Flags
		//---------------
		
		[Publish(scope='appModel', objectId='isApplicationVisible')]
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		[Publish(scope='appModel', objectId='appViewState')]
		public var appViewState:String;
	}
}
