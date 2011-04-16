package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.data.vo.LayoutVO;
	
	import spark.components.supportClasses.SkinnableComponent;

	[SkinState('web')]
	[SkinState('phone')]
	public class LayoutStackCP extends SkinnableComponent
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Inject(source='appModel.appStackState', bind='true')]
		[Bindable]
		public var appStackState:String;

		private var _currentLayout:LayoutVO;
		
		//----------------------
		// Getter / Setter
		//----------------------

		[Inject(source='appModel.currentLayout', bind='true')]
		[Bindable]
		public function get currentLayout():LayoutVO
		{
			return _currentLayout;
		}
		
		public function set currentLayout(value:LayoutVO):void
		{
			_currentLayout = value;
			
			invalidateSkinState();
		}
	
		//----------------------
		// Methods
		//----------------------
		
		override protected function getCurrentSkinState():String
		{
			if (_currentLayout != null)
			{
				return _currentLayout.stateName;
			}
			else
			{
				return '';
			}
		} 
	}
}