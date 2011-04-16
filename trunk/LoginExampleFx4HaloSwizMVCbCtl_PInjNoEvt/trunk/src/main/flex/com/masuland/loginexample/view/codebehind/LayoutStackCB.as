package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.data.vo.LayoutVO;

	public class LayoutStackCB implements ILayoutStackCB
	{
		//----------------------
		// Properties
		//----------------------
		
		private var _appStackState:String;

		private var _currentLayout:LayoutVO;

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
		}

		[Inject(source='appModel.currentLayout', bind='true')]
		[Bindable]
		public function get currentLayout():LayoutVO
		{
			return _currentLayout;
		}

		public function set currentLayout(value:LayoutVO):void
		{
			_currentLayout = value;
		}
	}
}