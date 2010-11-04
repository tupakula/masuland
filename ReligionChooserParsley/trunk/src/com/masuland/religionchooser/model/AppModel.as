package com.masuland.religionchooser.model
{
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * The Model
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class AppModel
	{		
		//---------------
		// Values
		//---------------
		
		[Publish(objectId="locales")]
		public var locales:ArrayCollection;
		
		[Publish(objectId="selectedLocale")]
		public var selectedLocale:LocaleVO;
		
		[Publish(objectId="rootQuestion")]
		public var rootQuestion:QuestionVO;
		
		[Publish(objectId="selectedQuestion")]
		public var selectedQuestion:QuestionVO;
		
		[Publish(objectId="selectedResult")]
		public var selectedResult:ResultVO;
		
		[Publish(objectId="appViewState")]
		public var appViewState:String;

		//---------------
		// Flags
		//---------------
		
		
		//---------------
		// States
		//---------------
		
	}
}