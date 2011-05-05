package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	
	import mx.events.ResizeEvent;
	
	import spark.components.supportClasses.SkinnableComponent;

	[SkinState('portrait')]
	[SkinState('landscape')]
	public class LayoutStackCP extends SkinnableComponent
	{
		//----------------------
		// Properties
		//----------------------

		private var _settings:SettingsVO;
		private var _currentLayout:LayoutVO;
		private var _isCurrentLayoutSizeDirty:Boolean;
		
		public var dispatcher:Function;

		//----------------------
		// Getter / Setter
		//----------------------
		
		[Bindable]
		public function get settings():SettingsVO
		{
			return _settings;
		}
		
		public function set settings(value:SettingsVO):void
		{
			_settings = value;
		}

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
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			addEventListener(ResizeEvent.RESIZE, cp_resizeHandler);
		}
		
		override protected function getCurrentSkinState():String
		{
			if (_currentLayout != null)
			{
				return _currentLayout.stateName;
			}
			else
			{
				return super.getCurrentSkinState();
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
		
		//----------------------
		// Handler
		//----------------------
		
		protected function cp_resizeHandler(event:ResizeEvent):void
		{
			if (_currentLayout != null)
			{
				if (width < height)
				{
					dispatcher(new LoadLayoutEvent(_settings.layouts.getItemAt(0) as LayoutVO, false));
				}
				else
				{
					dispatcher(new LoadLayoutEvent(_settings.layouts.getItemAt(1) as LayoutVO, false));
				}
				
				invalidateSkinState();
			}
		}
	}
}