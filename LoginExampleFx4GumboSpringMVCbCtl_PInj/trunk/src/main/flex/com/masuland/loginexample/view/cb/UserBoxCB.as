package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.control.event.UpdateUserEvent;
	import com.masuland.loginexample.vo.UserVO;
	
	import flash.events.EventDispatcher;
	
	import org.springextensions.actionscript.core.event.EventBus;

	public class UserBoxCB extends EventDispatcher
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject(name='appModel', property='currentUser')]
		[Bindable]
		public var currentUser:UserVO;
		
		//----------------------
		// Methods
		//----------------------
		
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