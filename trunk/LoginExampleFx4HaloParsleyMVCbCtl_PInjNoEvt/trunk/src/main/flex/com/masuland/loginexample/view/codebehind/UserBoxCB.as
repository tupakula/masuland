package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.IAppController;
	import com.masuland.loginexample.data.vo.UserVO;

	public class UserBoxCB implements IUserBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appController:IAppController;
		
		[Subscribe(scope='appModel', objectId='currentUser')]
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