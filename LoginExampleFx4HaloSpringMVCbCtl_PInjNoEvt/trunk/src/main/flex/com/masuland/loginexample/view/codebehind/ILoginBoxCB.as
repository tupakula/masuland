package com.masuland.loginexample.view.codebehind
{
	import com.masuland.loginexample.data.vo.AuthenticationVO;

	[Bindable]
	public interface ILoginBoxCB
	{
		function get username():String;
		function set username(value:String):void;
		
		function get email():String;
		function set email(value:String):void;
		
		function get password():String;
		function set password(value:String):void;
		
		function get repeatPassword():String;
		function set repeatPassword(value:String):void;
		
		function ctaLoginOrRegister(auth:AuthenticationVO, loginBoxState:String):void;
		
		function gotoLogin():void;
		
		function gotoRegister():void;
	}
}