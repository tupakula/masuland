package com.masuland.religionchooser.event
{
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import flash.events.Event;

	public class AppEvent extends Event
	{
		public static const INIT_APP:String = 'AppEvent.INIT_APP';
		public static const GET_SETTINGS:String = 'AppEvent.GET_SETTINGS';
		public static const GET_CONTENT:String = 'AppEvent.GET_CONTENT';
		public static const CHANGE_SELECTED_QUESTION:String = 'AppEvent.CHANGE_SELECTED_QUESTION';
		public static const SHOW_RESULT:String = 'AppEvent.SHOW_RESULT';
		public static const RESTART:String = 'AppEvent.RESTART';
		public static const CHANGE_LANGUAGE:String = 'AppEvent.CHANGE_LANGUAGE';
		
		public var locale:LocaleVO;
		public var question:QuestionVO;
		public var result:ResultVO;
		
		/**  */
		public function AppEvent(type:String, bubbles:Boolean=true, cancelable:Boolean=true)
		{
			super(type, bubbles, cancelable);
		}
	}
}