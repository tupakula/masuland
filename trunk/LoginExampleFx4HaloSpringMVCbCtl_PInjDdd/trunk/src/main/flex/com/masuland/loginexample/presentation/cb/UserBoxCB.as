package com.masuland.loginexample.presentation.cb
{
	import com.masuland.loginexample.application.event.AppEvent;
	import com.masuland.loginexample.application.event.UpdateUserEvent;
	import com.masuland.loginexample.domain.vo.UserVO;
	
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