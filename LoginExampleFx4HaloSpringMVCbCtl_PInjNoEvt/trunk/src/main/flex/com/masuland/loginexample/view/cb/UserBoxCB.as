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
		
		[Inject(name='appModel', property='currentUser')]
		[Bindable]
		public var currentUser:UserVO;
		
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