package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.data.AppModel;
	
	import flash.events.Event;
	
	import mx.binding.utils.ChangeWatcher;
	
	import spark.components.supportClasses.SkinnableComponent;

	[SkinState('login')]
	[SkinState('user')]
	public class AppStackCP extends SkinnableComponent
	{
		//----------------------
		// Properties
		//----------------------

		private var _appStackState:String;
		
		[Inject]
		public var appModel:AppModel;

		//----------------------
		// Methods
		//----------------------
		
		[PostConstruct]
		public function postConstruct():void
		{
			ChangeWatcher.watch(appModel, 'appStackState', appStackState_changeHandler);
		}
		
		override protected function getCurrentSkinState():String
		{
			return _appStackState;
		} 
		
		//----------------------
		// Handler
		//----------------------
		
		protected function appStackState_changeHandler(event:Event):void
		{
			_appStackState = appModel.appStackState;
			
			invalidateSkinState();
		}
	}
}