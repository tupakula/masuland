package org.apache.flex.apps.loginexample.data
{
	import org.apache.flex.apps.loginexample.data.vo.LayoutVO;
	import org.apache.flex.apps.loginexample.data.vo.LocaleVO;
	import org.apache.flex.apps.loginexample.data.vo.SettingsVO;
	import org.apache.flex.apps.loginexample.data.vo.StyleVO;
	import org.apache.flex.apps.loginexample.data.vo.UserVO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * 
	 */
	public class AppModel
	{		
		//---------------
		// Values
		//---------------
		
		public var currentUser:UserVO;
		
		public var settings:SettingsVO;
		public var currentStyle:StyleVO;
		public var currentLayout:LayoutVO;
		public var currentLocale:LocaleVO;
		
		//---------------
		// Flags
		//---------------
		
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		public var loginBoxState:String;
		public var appStackState:String;
		public var settingsBoxState:String;
	}
}
