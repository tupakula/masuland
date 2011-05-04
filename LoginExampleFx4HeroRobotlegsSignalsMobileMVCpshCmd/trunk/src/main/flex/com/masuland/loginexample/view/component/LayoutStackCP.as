package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.action.signal.LoadLayoutSignal;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	
	import flash.events.Event;
	
	import mx.binding.utils.ChangeWatcher;
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
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var loadLayoutSignal:LoadLayoutSignal;

		//----------------------
		// Methods
		//----------------------
		
		[PostConstruct]
		public function postConstruct():void
		{
			ChangeWatcher.watch(appModel, 'settings', settings_changeHandler);
			ChangeWatcher.watch(appModel, 'currentLayout', currentLayout_changeHandler);
		}
		
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
		
		protected function settings_changeHandler(event:Event):void
		{
			_settings = appModel.settings;
		}
		
		protected function currentLayout_changeHandler(event:Event):void
		{
			_currentLayout = appModel.currentLayout;
			_isCurrentLayoutSizeDirty = true;
			
			invalidateSize();
			invalidateSkinState();
		}
		
		protected function cp_resizeHandler(event:ResizeEvent):void
		{
			if (_currentLayout != null)
			{
				if (width < height)
				{
					loadLayoutSignal.dispatch(_settings.layouts.getItemAt(0) as LayoutVO, false);
				}
				else
				{
					loadLayoutSignal.dispatch(_settings.layouts.getItemAt(1) as LayoutVO, false);
				}
				
				invalidateSkinState();
			}
		}
	}
}