package com.masuland.loginexample.spring.view.cb
{
	import com.masuland.loginexample.spring.control.event.AppEvent;
	import com.masuland.loginexample.spring.control.event.UpdateUserEvent;
	import com.masuland.loginexample.spring.vo.UserVO;
	
	import flash.events.EventDispatcher;
	
	import org.springextensions.actionscript.core.event.EventBus;

	public class UserBoxCB extends EventDispatcher
	{
		[Autowired(name='appModel', property='currentUser')]
		[Bindable]
		public var currentUser:UserVO;
		
		public function updateUser(user:UserVO):void
		{
			EventBus.dispatchEvent(new UpdateUserEvent(user));
		}

		public function logout():void
		{
			EventBus.dispatchEvent(new AppEvent(AppEvent.LOGOUT));
		}
	}
}