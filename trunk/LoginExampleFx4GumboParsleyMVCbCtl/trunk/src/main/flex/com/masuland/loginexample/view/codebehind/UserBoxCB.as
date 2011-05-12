package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.action.event.AppEvent;
	import com.masuland.loginexample.action.event.UpdateUserEvent;
	import com.masuland.loginexample.data.vo.UserVO;

	/**
	 * @author masuland.com
	 */
	public class UserBoxCB
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
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