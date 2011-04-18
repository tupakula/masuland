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

		private var _currentLayout:LayoutVO;
		private var _isCurrentLayoutSizeDirty:Boolean;
		
		//----------------------
		// Getter / Setter
		//----------------------

		[Subscribe(scope='appModel', objectId='currentLayout')]
		[Bindable]
		public function get currentLayout():LayoutVO
		{
			return _currentLayout;
		}
		
		public function set currentLayout(value:LayoutVO):void
		{
			_currentLayout = value;
			_isCurrentLayoutSizeDirty = true;
			
			invalidateSize();
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
		
		override protected function measure():void
		{
			super.measure();
			
			if (_isCurrentLayoutSizeDirty)
			{
				// TODO resize effect
				skin.width = _currentLayout.width;
				skin.height = _currentLayout.height;
				_isCurrentLayoutSizeDirty = false;
			}
		}
	}
}