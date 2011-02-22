package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.IAppController;
	import com.masuland.loginexample.vo.UserVO;

	public class UserBoxCB implements IUserBoxCB
	{
		[Inject]
		public var appController:IAppController;
		
		[Subscribe(scope="AppModel", objectId="currentUser")]
		[Bindable]
		public var currentUser:UserVO;
		
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