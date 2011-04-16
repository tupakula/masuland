package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.data.vo.UserVO;

	[Bindable]
	public interface IUserBoxCB
	{
		function get currentUser():UserVO;
		function set currentUser(value:UserVO):void;
		
		function updateUser(user:UserVO):void;
		
		function logout():void;
	}
}