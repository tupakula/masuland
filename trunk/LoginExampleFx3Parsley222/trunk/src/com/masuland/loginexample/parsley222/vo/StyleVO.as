package com.masuland.loginexample.parsley222.vo
{
	[Bindable]
	/**
	 * 
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class StyleVO
	{
		public var name:String;
		public var path:String;
		
		public function StyleVO() {}
		
		public function toString() : String
		{
			return name;
		}
	}
}