package com.masuland.loginexample.parsley222.view.cb
{
	import com.masuland.loginexample.parsley222.control.event.AppEvent;
	import com.masuland.loginexample.parsley222.control.event.UpdateUserEvent;
	import com.masuland.loginexample.parsley222.vo.UserVO;

	public class UserBoxCB
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
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