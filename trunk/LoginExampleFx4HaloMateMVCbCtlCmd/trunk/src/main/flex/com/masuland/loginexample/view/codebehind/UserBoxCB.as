package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.UpdateUserEvent;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import flash.events.IEventDispatcher;

	public class UserBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		private var dispatcher:IEventDispatcher;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function UserBoxCB(dispatcher:IEventDispatcher)
		{
			this.dispatcher = dispatcher;
		}
		
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