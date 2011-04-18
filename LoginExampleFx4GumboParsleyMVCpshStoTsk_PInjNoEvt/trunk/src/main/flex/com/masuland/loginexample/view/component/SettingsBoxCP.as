package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.action.IAppStories;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.SettingsBoxState;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import flash.events.MouseEvent;
	
	import mx.automation.IAutomationObject;
	
	import spark.components.Button;
	import spark.components.DropDownList;
	import spark.components.supportClasses.SkinnableComponent;
	import spark.events.IndexChangeEvent;

	[SkinState('closed')]
	[SkinState('open')]
	public class SettingsBoxCP extends SkinnableComponent
	{
		//----------------------
		// Skin Parts
		//----------------------
		
		[SkinPart(required='true')]
		public var btn_settings:Button;

		[SkinPart(required='true')]
		public var ddl_layout:DropDownList;

		[SkinPart(required='true')]
		public var ddl_style:DropDownList;

		[SkinPart(required='true')]
		public var ddl_locale:DropDownList;
		
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		[Bindable]
		public var appModel:AppModel;

		[Inject]
		public var appStories:IAppStories;

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
		
		[Subscribe(scope='appModel', objectId='settingsBoxState')]
		[Bindable]
		public function get settingsBoxState():String
		{
			return _settingsBoxState;
		}
		
		public function set settingsBoxState(value:String):void
		{
			_settingsBoxState = value;
			
			invalidateSkinState();
		}

		[Subscribe(scope='appModel', objectId='settings')]
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
		
		[Subscribe(scope='appModel', objectId='currentLayout')]
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
		}
		
		[Subscribe(scope='appModel', objectId='currentStyle')]
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
		
		[Subscribe(scope='appModel', objectId='currentLocale')]
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
			
			if (instance == btn_settings) 
			{
				btn_settings.addEventListener(MouseEvent.CLICK, btn_settings_clickHandler);
			}
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
		}
		
		override protected function partRemoved(partName:String, instance:Object):void 
		{
			super.partRemoved(partName, instance);
			
			if (instance == btn_settings) 
			{
				btn_settings.removeEventListener(MouseEvent.CLICK, btn_settings_clickHandler);
			}
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
		}

		override protected function getCurrentSkinState():String
		{
			return _settingsBoxState;
		} 
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (_isSettingsDirty)
			{
				ddl_layout.dataProvider = _settings.layouts;
				_isSettingsDirty = false;
			}
			
			if (_isCurrentLayoutDirty)
			{
				ddl_layout.selectedItem = _currentLayout;
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
			appStories.loadLayout(ddl_layout.selectedItem as LayoutVO);
		}
		
		protected function ddl_style_changeHandler(event:IndexChangeEvent):void
		{
			appStories.loadStyle(ddl_style.selectedItem as StyleVO);
		}
		
		protected function ddl_locale_changeHandler(event:IndexChangeEvent):void
		{
			appStories.loadLocale(ddl_locale.selectedItem as LocaleVO);
		}
		
		//------------------------------
		// Automation
		//------------------------------
		
		override public function getAutomationChildren():Array 
		{
			return [btn_settings, ddl_layout, ddl_style, ddl_locale];
		}
		
		override public function getAutomationChildAt(index:int):IAutomationObject 
		{
			switch (index)
			{
				case 0:
					return btn_settings;
					
				case 1:
					return ddl_layout;
					
				case 2:
					return ddl_style;
					
				default:
					return ddl_locale;
			}
		}
		
		override public function get numAutomationChildren():int 
		{
			return 4;
		}
	}
}