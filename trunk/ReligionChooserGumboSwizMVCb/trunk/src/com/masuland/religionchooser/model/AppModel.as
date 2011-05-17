package com.masuland.religionchooser.model
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
	 * The Model
	 * @author masuland.com
	 */
	public class AppModel
	{		
		//---------------
		// Values
		//---------------
		
		// Settings
		
		public var settings:SettingsVO;
		public var currentLayout:LayoutVO;
		public var currentLocale:LocaleVO;
		public var currentStyle:StyleVO;
		
		// Content
		
		public var rootQuestion:QuestionVO;
		public var selectedQuestion:QuestionVO;
		public var selectedResult:ResultVO;
		
		//---------------
		// Flags
		//---------------
		
		
		//---------------
		// States
		//---------------
		
		public var appViewState:String;
	}
}