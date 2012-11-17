package org.apache.flex.apps.loginexample.view.component
{
	import org.apache.flex.apps.loginexample.data.vo.LayoutVO;
	
	import mx.automation.IAutomationObject;
	
	import spark.components.Group;
	import spark.components.supportClasses.SkinnableComponent;

	/**
	 * 
	 */
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
		
		//----------------------
		// Getter / Setter
		//----------------------
		
		[Subscribe(scope='appModel', objectId='isApplicationVisible')]
		[Bindable]
		public function get isApplicationVisible():Boolean
		{
			return _isApplicationVisible;
		}
		
		public function set isApplicationVisible(value:Boolean):void
		{
			_isApplicationVisible = value;
			_isApplicationVisibleDirty = true;
			
			invalidateProperties();
		}
		
		//----------------------
		// Methods
		//----------------------
		
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