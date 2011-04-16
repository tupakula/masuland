package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.UpdateUserEvent;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import flash.events.EventDispatcher;

	[RouteEvents(events='UpdateUserEvent.EVENT_NAME, AppEvent.LOGOUT')]
	
	[Event(name='UpdateUserEvent.EVENT_NAME', type='com.masuland.loginexample.control.event.UpdateUserEvent')]
	[Event(name='AppEvent.LOGOUT', type='com.masuland.loginexample.control.event.AppEvent')]
	
	public class UserBoxCB extends EventDispatcher
	{
		//----------------------
		// Methods
		//----------------------
		
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