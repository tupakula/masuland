package org.apache.flex.apps.loginexample.view.component
{
	import spark.components.supportClasses.SkinnableComponent;

	[SkinState('login')]
	[SkinState('user')]
	/**
	 * 
	 */
	public class AppStackCP extends SkinnableComponent
	{
		//----------------------
		// Properties
		//----------------------

		private var _appStackState:String;

		//----------------------
		// Getter / Setter
		//----------------------
		
		[Inject(source='appModel.appStackState', bind='true')]
		[Bindable]
		public function get appStackState():String
		{
			return _appStackState;
		}

		public function set appStackState(value:String):void
		{
			_appStackState = value;
			
			invalidateSkinState();
		}

		//----------------------
		// Methods
		//----------------------
		
		override protected function getCurrentSkinState():String
		{
			return _appStackState;
		} 
	}
}