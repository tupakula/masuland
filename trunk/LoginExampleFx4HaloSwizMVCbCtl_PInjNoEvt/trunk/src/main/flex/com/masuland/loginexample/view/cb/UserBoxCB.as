package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.IAppController;
	import com.masuland.loginexample.vo.UserVO;

	public class UserBoxCB implements IUserBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appController:IAppController;

		private var _currentUser:UserVO;

		//----------------------
		// Getter / Setter
		//----------------------
		
		[Inject(source='appModel.currentUser', bind='true')]
		[Bindable]
		public function get currentUser():UserVO
		{
			return _currentUser;
		}

		public function set currentUser(value:UserVO):void
		{
			_currentUser = value;
		}

		//----------------------
		// Methods
		//----------------------
		
		public function updateUser(user:UserVO):void
		{
			appController.updateUser(user);
		}

		public function logout():void
		{
			appController.logout();
		}
	}
}