package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.UpdateUserEvent;
	import com.masuland.loginexample.vo.UserVO;

	public class UserBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Wire(id='appModel', propertyName='currentUser')]
		[Bindable]
		public var currentUser:UserVO;
		
		//----------------------
		// Methods
		//----------------------
		
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