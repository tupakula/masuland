package com.masuland.loginexample.spring.view.cb
{
	import com.masuland.loginexample.spring.control.event.AppEvent;
	import com.masuland.loginexample.spring.control.event.UpdateUserEvent;
	import com.masuland.loginexample.spring.vo.UserVO;
	
	import flash.events.EventDispatcher;

	[RouteEvents(events="UpdateUserEvent.EVENT_NAME, AppEvent.LOGOUT")]
	
	[Event(name="UpdateUserEvent.EVENT_NAME", type="com.masuland.loginexample.spring.control.event.UpdateUserEvent")]
	[Event(name="AppEvent.LOGOUT", type="com.masuland.loginexample.spring.control.event.AppEvent")]
	
	public class UserBoxCB extends EventDispatcher
	{
		public function updateUser(user:UserVO):void
		{
			dispatchEvent(new UpdateUserEvent(user));
		}

		public function logout():void
		{
			dispatchEvent(new AppEvent(AppEvent.LOGOUT));
		}
	}
}