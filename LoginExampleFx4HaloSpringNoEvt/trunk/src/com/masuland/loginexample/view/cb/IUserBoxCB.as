package com.masuland.loginexample.view.cb
{
	import com.masuland.loginexample.vo.UserVO;

	[Bindable]
	public interface IUserBoxCB
	{
		function get currentUser():UserVO;
		function set currentUser(value:UserVO):void;
		
		function updateUser(user:UserVO):void;
		
		function logout():void;
	}
}