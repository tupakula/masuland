package com.masuland.loginexample.data.vo
{
	[RemoteClass(alias='com.masuland.loginexample.data.dto.LocaleDTO')]
	[Bindable]
	/**
	 * @author masuland.com
	 */
	public class LocaleVO
	{
		//----------------------
		// Properties
		//----------------------
		
		public var name:String;
		public var code:String;
		
		//----------------------
		// Methods
		//----------------------
		
		public function toString():String
		{
			return name;
		}
	}
}