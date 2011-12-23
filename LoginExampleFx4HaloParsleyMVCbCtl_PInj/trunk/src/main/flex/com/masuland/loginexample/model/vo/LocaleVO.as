package com.masuland.loginexample.model.vo
{
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