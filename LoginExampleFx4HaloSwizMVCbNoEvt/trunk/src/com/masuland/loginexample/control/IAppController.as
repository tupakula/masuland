package com.masuland.loginexample.control
{
	import com.masuland.loginexample.vo.AuthenticationVO;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.StyleVO;
	import com.masuland.loginexample.vo.UserVO;

	public interface IAppController
	{
		function getSettings():void;
		
		function login(auth:AuthenticationVO):void;
		
		function logout():void;
		
		function register(auth:AuthenticationVO):void;
		
		function updateUser(user:UserVO):void;
		
		function gotoLogin():void;
		
		function gotoRegister():void;
		
		function loadLocales(locale:LocaleVO):void;
		
		function loadStyle(style:StyleVO):void;
		
		function loadLayout(layout:LayoutVO):void;
	}
}