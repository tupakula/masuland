package com.masuland.loginexample.data.vo
{
	[RemoteClass(alias='com.masuland.loginexample.data.dto.StyleDTO')]
	[Bindable]
	/**
	 * @author masuland.com
	 */
	public class StyleVO
	{
		//----------------------
		// Properties
		//----------------------
		
		public var name:String;
		public var path:String;
		
		//----------------------
		// Methods
		//----------------------
		
		public function toString():String
		{
			return name;
		}
	}
}