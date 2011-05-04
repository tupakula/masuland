package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.data.AppModel;
	
	import flash.events.Event;
	
	import mx.automation.IAutomationObject;
	import mx.binding.utils.ChangeWatcher;
	
	import spark.components.Group;
	import spark.components.supportClasses.SkinnableComponent;

	public class AppViewCP extends SkinnableComponent
	{
		//----------------------
		// Skin Parts
		//----------------------
		
		[SkinPart(required='true')]
		public var cp_layout:LayoutStackCP;
		
		[SkinPart(required='false')]
		public var cp_settings:SettingsBoxCP;
		
		[SkinPart(required='false')]
		public var bx_header:Group;
		
		//----------------------
		// Properties
		//----------------------
		
		private var _isApplicationVisible:Boolean;
		private var _isApplicationVisibleDirty:Boolean;

		[Inject]
		public var appModel:AppModel;

		//----------------------
		// Methods
		//----------------------

		[PostConstruct]
		public function postConstruct():void
		{
			ChangeWatcher.watch(appModel, 'isApplicationVisible', isApplicationVisible_changeHandler);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			_isApplicationVisibleDirty = true;
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (_isApplicationVisibleDirty)
			{
				skin.visible = _isApplicationVisible;
				_isApplicationVisibleDirty = false;
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function isApplicationVisible_changeHandler(event:Event):void
		{
			_isApplicationVisible = appModel.isApplicationVisible;
			_isApplicationVisibleDirty = true;
			
			invalidateProperties();
		}
		
		//------------------------------
		// Automation
		//------------------------------
		
		override public function getAutomationChildren():Array 
		{
			return [cp_layout, cp_settings, bx_header];
		}
		
		override public function getAutomationChildAt(index:int):IAutomationObject 
		{
			switch (index)
			{
				case 0:
					return cp_layout;
					
				case 1:
					return cp_settings;
					
				default:
					return bx_header;
			}
		}
		
		override public function get numAutomationChildren():int 
		{
			return 3;
		}
	}
}