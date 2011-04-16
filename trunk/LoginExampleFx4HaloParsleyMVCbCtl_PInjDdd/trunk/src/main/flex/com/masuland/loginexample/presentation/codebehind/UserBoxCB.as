package com.masuland.loginexample.presentation.codebehind
{
	import com.masuland.loginexample.application.event.AppEvent;
	import com.masuland.loginexample.application.event.UpdateUserEvent;
	import com.masuland.loginexample.domain.vo.UserVO;

	public class UserBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Subscribe(scope='appModel', objectId='currentUser')]
		[Bindable]
		public var currentUser:UserVO;
		
		//----------------------
		// Methods
		//----------------------
		
		public function updateUser(user:UserVO):void
		{
			dispatcher(new UpdateUserEvent(user));
		}

		public function logout():void
		{
			dispatcher(new AppEvent(AppEvent.LOGOUT));
		}
	}
}