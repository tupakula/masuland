package com.masuland.loginexample.cairngorm221.model
{
	import com.masuland.loginexample.cairngorm221.vo.LayoutVO;
	import com.masuland.loginexample.cairngorm221.vo.LocaleVO;
	import com.masuland.loginexample.cairngorm221.vo.SettingsVO;
	import com.masuland.loginexample.cairngorm221.vo.StyleVO;
	import com.masuland.loginexample.cairngorm221.vo.UserVO;
	
	import mx.collections.ArrayCollection;

    [Bindable]
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
		
		public var isMockData:Boolean = true;
		public var isApplicationVisible:Boolean;
		
		//---------------
		// States
		//---------------
		
		public var loginBoxState:String;
		public var appStackState:String;

		//----------------------------------------------------------------------------------------
		//----------------------------------------------------------------------------------------
		
		private static var model:AppModel;
		
		// Constructor should be private but 
		// current AS3.0 does not allow it yet (?)...
		public function AppModel() 
		{	
		    if ( model != null )
		    {
				throw new Error("AppModel: Only one AppModel instance should be instantiated");	
		    }
		}

        public static function getInstance() : AppModel 
        {
           if (model == null)
               model = new AppModel();

           return model;
        }
	}
}
