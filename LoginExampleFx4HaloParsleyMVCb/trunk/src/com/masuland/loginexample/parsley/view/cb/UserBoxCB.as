package com.masuland.loginexample.parsley.view.cb
{
	import com.masuland.loginexample.parsley.control.event.AppEvent;
	import com.masuland.loginexample.parsley.control.event.UpdateUserEvent;
	import com.masuland.loginexample.parsley.vo.UserVO;

	public class UserBoxCB
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Subscribe(scope="AppModel", objectId="currentUser")]
		[Bindable]
		public var currentUser:UserVO;
		
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