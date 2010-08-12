package com.masuland.loginexample.swiz10.view.cb
{
	import com.masuland.loginexample.swiz10.control.event.AppEvent;
	import com.masuland.loginexample.swiz10.control.event.UpdateUserEvent;
	import com.masuland.loginexample.swiz10.vo.UserVO;
	
	import flash.events.IEventDispatcher;

	public class UserBoxCB
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		public function updateUser(user:UserVO):void
		{
			dispatcher.dispatchEvent(new UpdateUserEvent(user));
		}

		public function logout():void
		{
			dispatcher.dispatchEvent(new AppEvent(AppEvent.LOGOUT));
		}
	}
}