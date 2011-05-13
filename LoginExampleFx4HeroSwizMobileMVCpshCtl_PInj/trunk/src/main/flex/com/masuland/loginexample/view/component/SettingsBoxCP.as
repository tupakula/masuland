package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.action.event.LoadLayoutEvent;
	import com.masuland.loginexample.action.event.LoadLocaleEvent;
	import com.masuland.loginexample.action.event.LoadStyleEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.SettingsBoxState;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import mx.automation.IAutomationObject;
	import mx.events.ResizeEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.Button;
	import spark.components.DropDownList;
	import spark.components.List;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.events.IndexChangeEvent;

	[SkinState('portrait')]
	[SkinState('landscape')]
	/**
	 * @author masuland.com
	 */
	public class SettingsBoxCP extends SkinnableComponent
	{
		//----------------------
		// Skin Parts
		//----------------------
		
		[SkinPart(required='false')]
		public var ddl_layout:List;

		[SkinPart(required='true')]
		public var ddl_style:List;

		[SkinPart(required='true')]
		public var ddl_locale:List;
		
		[SkinPart(required='true')]
		public var btn_close:Button;
		
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		[Bindable]
		public var appModel:AppModel;
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

		private var _settingsBoxState:String;
		private var _settings:SettingsVO;
		private var _currentLayout:LayoutVO;
		private var _currentStyle:StyleVO;
		private var _currentLocale:LocaleVO;
		
		private var _isSettingsDirty:Boolean;
		private var _isCurrentLayoutDirty:Boolean;
		private var _isCurrentStyleDirty:Boolean;
		private var _isCurrentLocaleDirty:Boolean;
		
		//----------------------
		// Getter / Setter
		//----------------------
		
		[Inject(source='appModel.settingsBoxState', bind='true')]
		[Bindable]
		public function get settingsBoxState():String
		{
			return _settingsBoxState;
		}
		
		public function set settingsBoxState(value:String):void
		{
			_settingsBoxState = value;
		}

		[Inject(source='appModel.settings', bind='true')]
		[Bindable]
		public function get settings():SettingsVO
		{
			return _settings;
		}
		
		public function set settings(value:SettingsVO):void
		{
			_settings = value;
			
			_isSettingsDirty = true;
			invalidateProperties();
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
			
			_isCurrentLayoutDirty = true;
			invalidateProperties();
			invalidateSkinState();
		}
		
		[Inject(source='appModel.currentStyle', bind='true')]
		[Bindable]
		public function get currentStyle():StyleVO
		{
			return _currentStyle;
		}
		
		public function set currentStyle(value:StyleVO):void
		{
			_currentStyle = value;
			
			_isCurrentStyleDirty = true;
			invalidateProperties();
		}
		
		[Inject(source='appModel.currentLocale', bind='true')]
		[Bindable]
		public function get currentLocale():LocaleVO
		{
			return _currentLocale;
		}
		
		public function set currentLocale(value:LocaleVO):void
		{
			_currentLocale = value;
			
			_isCurrentLocaleDirty = true;
			invalidateProperties();
		}

		//----------------------
		// Methods
		//----------------------
		
		override protected function partAdded(partName:String, instance:Object):void 
		{
			super.partAdded(partName, instance);
			
			if (instance == ddl_layout) 
			{
				ddl_layout.addEventListener(IndexChangeEvent.CHANGE, ddl_layout_changeHandler);
			}
			if (instance == ddl_style) 
			{
				ddl_style.addEventListener(IndexChangeEvent.CHANGE, ddl_style_changeHandler);
			}
			if (instance == ddl_locale) 
			{
				ddl_locale.addEventListener(IndexChangeEvent.CHANGE, ddl_locale_changeHandler);
			}
			if (instance == btn_close) 
			{
				btn_close.addEventListener(MouseEvent.CLICK, btn_close_clickHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void 
		{
			super.partRemoved(partName, instance);
			
			if (instance == ddl_layout) 
			{
				ddl_layout.removeEventListener(IndexChangeEvent.CHANGE, ddl_layout_changeHandler);
			}
			if (instance == ddl_style) 
			{
				ddl_style.removeEventListener(IndexChangeEvent.CHANGE, ddl_style_changeHandler);
			}
			if (instance == ddl_locale) 
			{
				ddl_locale.removeEventListener(IndexChangeEvent.CHANGE, ddl_locale_changeHandler);
			}
			if (instance == btn_close) 
			{
				btn_close.removeEventListener(MouseEvent.CLICK, btn_close_clickHandler);
			}
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
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (_isSettingsDirty)
			{
//				ddl_layout.dataProvider = _settings.layouts;
				_isSettingsDirty = false;
			}
			
			if (_isCurrentLayoutDirty)
			{
//				ddl_layout.selectedItem = _currentLayout;
				ddl_style.dataProvider = _currentLayout.styles;
				ddl_locale.dataProvider = _currentLayout.locales;
				
				_isCurrentLayoutDirty = false;
			}
			
			if (_isCurrentStyleDirty)
			{
				ddl_style.selectedItem = _currentStyle;
				_isCurrentStyleDirty = false;
			}
			
			if (_isCurrentLocaleDirty)
			{
				ddl_locale.selectedItem = _currentLocale;
				_isCurrentLocaleDirty = false;
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function btn_settings_clickHandler(event:MouseEvent):void
		{
			if (appModel.settingsBoxState == SettingsBoxState.CLOSED)
			{
				appModel.settingsBoxState = SettingsBoxState.OPEN;
			}
			else
			{
				appModel.settingsBoxState = SettingsBoxState.CLOSED;
			}
		}

		protected function ddl_layout_changeHandler(event:IndexChangeEvent):void
		{
			dispatcher.dispatchEvent(new LoadLayoutEvent(ddl_layout.selectedItem as LayoutVO));
		}
		
		protected function ddl_style_changeHandler(event:IndexChangeEvent):void
		{
			dispatcher.dispatchEvent(new LoadStyleEvent(ddl_style.selectedItem as StyleVO));
		}
		
		protected function ddl_locale_changeHandler(event:IndexChangeEvent):void
		{
			dispatcher.dispatchEvent(new LoadLocaleEvent(ddl_locale.selectedItem as LocaleVO));
		}
		
		protected function btn_close_clickHandler(event:MouseEvent):void
		{
			PopUpManager.removePopUp(this);
		}
		
		//------------------------------
		// Automation
		//------------------------------
		
		override public function getAutomationChildren():Array 
		{
			return [ddl_layout, ddl_style, ddl_locale];
		}
		
		override public function getAutomationChildAt(index:int):IAutomationObject 
		{
			switch (index)
			{
				case 0:
					return ddl_layout;
					
				case 1:
					return ddl_style;
					
				default:
					return ddl_locale;
			}
		}
		
		override public function get numAutomationChildren():int 
		{
			return 3;
		}
	}
}