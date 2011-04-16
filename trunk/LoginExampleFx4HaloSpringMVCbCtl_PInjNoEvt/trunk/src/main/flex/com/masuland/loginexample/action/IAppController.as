package com.masuland.loginexample.action
{
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	import com.masuland.loginexample.data.vo.UserVO;

	public interface IAppController
	{
		function initApp():void;
		
		function getSettings():void;
		
		function login(auth:AuthenticationVO):void;
		
		function logout():void;
		
		function register(auth:AuthenticationVO):void;
		
		function updateUser(user:UserVO):void;
		
		function gotoLogin():void;
		
		function gotoRegister():void;
		
		function loadLocale(locale:LocaleVO):void;
		
		function loadStyle(style:StyleVO):void;
		
		function loadLayout(layout:LayoutVO):void;
	}
}