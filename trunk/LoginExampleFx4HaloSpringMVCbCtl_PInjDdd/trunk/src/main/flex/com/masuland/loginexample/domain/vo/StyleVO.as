package com.masuland.loginexample.domain.vo
{
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