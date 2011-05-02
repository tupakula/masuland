package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.signal.LogoutSignal;
	import com.masuland.loginexample.action.signal.UpdateUserSignal;
	import com.masuland.loginexample.data.vo.UserVO;

	public class UserBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var updateUserSignal:UpdateUserSignal;
		
		[Inject]
		public var logoutSignal:LogoutSignal;
		
		//----------------------
		// Methods
		//----------------------
		
		public function updateUser(user:UserVO):void
		{
			updateUserSignal.dispatch(user);
		}

		public function logout():void
		{
			logoutSignal.dispatch();
		}
	}
}