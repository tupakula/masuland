package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.action.IAppStories;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import flash.events.MouseEvent;
	
	import mx.automation.IAutomationObject;
	import mx.controls.DateField;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;

	public class UserBoxCP extends SkinnableComponent
	{
		//----------------------
		// Skin Parts
		//----------------------
		
		[SkinPart(required='true')]
		public var btn_logout:Button;
		
		[SkinPart(required='true')]
		public var txt_username:Label;
		
		[SkinPart(required='true')]
		public var tip_firstname:TextInput;
		
		[SkinPart(required='true')]
		public var tip_lastname:TextInput;
		
		[SkinPart(required='true')]
		public var tip_email:TextInput;
		
		[SkinPart(required='true')]
		public var df_birthday:DateField;
		
		[SkinPart(required='true')]
		public var btn_update:Button;
		
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appStories:IAppStories;
		
		private var _currentUser:UserVO;
		private var _isCurrentUserDirty:Boolean;
		
		//----------------------
		// Getter / Setter
		//----------------------
		
		[Subscribe(scope='appModel', objectId='currentUser')]
		[Bindable]
		public function get currentUser():UserVO
		{
			return _currentUser;
		}
		
		public function set currentUser(value:UserVO):void
		{
			_currentUser = value;
			
			_isCurrentUserDirty = true;
			invalidateProperties();
		}
		
		//----------------------
		// Methods
		//----------------------
		
		override protected function partAdded(partName:String, instance:Object):void 
		{
			super.partAdded(partName, instance);
			
			if (instance == btn_logout) 
			{
				btn_logout.addEventListener(MouseEvent.CLICK, btn_logout_clickHandler);
			}
			if (instance == btn_update) 
			{
				btn_update.addEventListener(MouseEvent.CLICK, btn_update_clickHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void 
		{
			super.partRemoved(partName, instance);
			
			if (instance == btn_logout) 
			{
				btn_logout.removeEventListener(MouseEvent.CLICK, btn_logout_clickHandler);
			}
			if (instance == btn_update) 
			{
				btn_update.removeEventListener(MouseEvent.CLICK, btn_update_clickHandler);
			}
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (_isCurrentUserDirty)
			{
				if (_currentUser != null)
				{
					txt_username.text = _currentUser.username;
					tip_firstname.text = _currentUser.firstname;
					tip_lastname.text = _currentUser.lastname;
					tip_email.text = _currentUser.email;
					df_birthday.selectedDate = _currentUser.birthday;
				}
				
				_isCurrentUserDirty = false;
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function btn_logout_clickHandler(event:MouseEvent):void
		{
			appStories.logout();
		}
		
		protected function btn_update_clickHandler(event:MouseEvent):void
		{
			if (_currentUser == null)
			{
				_currentUser = new UserVO();
			}
			
			// Set user values
			_currentUser.username = txt_username.text;
			_currentUser.firstname = tip_firstname.text;
			_currentUser.lastname = tip_lastname.text;
			_currentUser.email = tip_email.text;
			_currentUser.birthday = df_birthday.selectedDate;
			
			appStories.updateUser(_currentUser);
		}
		
		//------------------------------
		// Automation 
		//------------------------------
		
		override public function getAutomationChildren():Array 
		{
			return [btn_logout, txt_username, tip_firstname, tip_lastname, tip_email, df_birthday, btn_update];
		}
		
		override public function getAutomationChildAt(index:int):IAutomationObject 
		{
			switch (index)
			{
				case 0:
					return btn_logout;
					
				case 1:
					return txt_username;
					
				case 2:
					return tip_firstname;
					
				case 3:
					return tip_lastname;
					
				case 4:
					return tip_email;
					
				case 5:
					return df_birthday;
					
				default:
					return btn_update;
			}
		}
		
		override public function get numAutomationChildren():int 
		{
			return 7;
		}
	}
}