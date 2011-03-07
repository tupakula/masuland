package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.control.event.UpdateUserEvent;
	import com.masuland.loginexample.vo.UserVO;
	
	import flash.events.IEventDispatcher;

	public class UserBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

		[Inject(source="appModel.currentUser", bind="true")]
		[Bindable]
		public var currentUser:UserVO;

		//----------------------
		// Methods
		//----------------------
		
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