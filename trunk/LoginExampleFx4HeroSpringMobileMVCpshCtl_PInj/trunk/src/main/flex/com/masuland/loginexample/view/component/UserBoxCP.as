package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.UpdateUserEvent;
	import com.masuland.loginexample.data.vo.UserVO;
	import com.masuland.loginexample.view.skin.DatePickerSkin;
	import com.masuland.loginexample.view.skin.SettingsBoxSkin;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.automation.IAutomationObject;
	import mx.events.ResizeEvent;
	import mx.managers.PopUpManager;
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableComponent;

	/**
	 * @author masuland.com
	 */
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
		public var btn_birthday:Button;

		[SkinPart(required='true')]
		public var btn_deleteBirthday:Button;

		[SkinPart(required='true')]
		public var btn_update:Button;
		
		[SkinPart(required='false')]
		public var btn_settings:Button;
		
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var cp_settings:SettingsBoxCP;

		public var cb_datePicker:DatePickerCP;
		
		private var _currentUser:UserVO;
		private var _isCurrentUserDirty:Boolean;
		
		//----------------------
		// Getter / Setter
		//----------------------
		
		[Inject(name='appModel', property='currentUser')]
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
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			addEventListener(ResizeEvent.RESIZE, cp_resizeHandler);
		}
		
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
			if (instance == btn_birthday)
			{
				btn_birthday.addEventListener(MouseEvent.CLICK, btn_birthday_clickHandler);
			}
			if (instance == btn_deleteBirthday)
			{
				btn_deleteBirthday.addEventListener(MouseEvent.CLICK, btn_deleteBirthday_clickHandler);
			}
			if (instance == btn_settings) 
			{
				btn_settings.addEventListener(MouseEvent.CLICK, btn_settings_clickHandler);
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
			if (instance == btn_birthday)
			{
				btn_birthday.removeEventListener(MouseEvent.CLICK, btn_birthday_clickHandler);
			}
			if (instance == btn_deleteBirthday)
			{
				btn_deleteBirthday.removeEventListener(MouseEvent.CLICK, btn_deleteBirthday_clickHandler);
			}
			if (instance == btn_settings) 
			{
				btn_settings.removeEventListener(MouseEvent.CLICK, btn_settings_clickHandler);
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
					
					if (_currentUser.birthday != null)
					{
						btn_birthday.label = _currentUser.birthday.toDateString();
						btn_deleteBirthday.visible = true;
					}
					else
					{
						btn_deleteBirthday.visible = false;
					}
				}
				
				_isCurrentUserDirty = false;
			}
			
			if (_currentUser == null || _currentUser.birthday == null)
			{
				btn_birthday.label = resourceManager.getString('resources', 'cta_noDateSelected');
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function btn_logout_clickHandler(event:MouseEvent):void
		{
			EventBus.dispatchEvent(new AppEvent(AppEvent.LOGOUT));
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
			
			if (cb_datePicker != null)
			{
				_currentUser.birthday = cb_datePicker.currentDate;
			}
			
			EventBus.dispatchEvent(new UpdateUserEvent(_currentUser));
		}
		
		protected function btn_birthday_clickHandler(event:MouseEvent):void
		{
			if (cb_datePicker == null)
			{
				cb_datePicker = new DatePickerCP();
			}
			
			cb_datePicker.setStyle('skinClass', DatePickerSkin);
			cb_datePicker.currentDate = _currentUser.birthday;
			cb_datePicker.addEventListener('newDateSet', cb_datePicker_newDateSetHandler);

			PopUpManager.addPopUp(cb_datePicker, this, true);
			PopUpManager.centerPopUp(cb_datePicker);
		}
		
		protected function btn_deleteBirthday_clickHandler(event:MouseEvent):void
		{
			currentUser.birthday = null;
			
			_isCurrentUserDirty = true;
			invalidateProperties();
		}
		
		protected function cb_datePicker_newDateSetHandler(event:Event):void
		{
			_currentUser.birthday = cb_datePicker.currentDate;
			
			_isCurrentUserDirty = true;
			invalidateProperties();
		}
		
		protected function btn_settings_clickHandler(event:MouseEvent):void
		{
			cp_settings.setStyle('skinClass', SettingsBoxSkin);
			
			PopUpManager.addPopUp(cp_settings, this, true);
			PopUpManager.centerPopUp(cp_settings);
		}

		protected function cp_resizeHandler(event:ResizeEvent):void
		{
			if (cb_datePicker != null)
			{
				PopUpManager.centerPopUp(cb_datePicker);

				_isCurrentUserDirty = true;
				invalidateProperties();
			}
			
			if (cp_settings != null)
			{
				PopUpManager.centerPopUp(cp_settings);
			}
		}

		//------------------------------
		// Automation 
		//------------------------------
		
		override public function getAutomationChildren():Array 
		{
			return [btn_logout, txt_username, tip_firstname, tip_lastname, tip_email, btn_birthday, btn_update];
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
					return btn_birthday;
					
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