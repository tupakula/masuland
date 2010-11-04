package com.masuland.religionchooser.vo
{
	[Bindable]
	/**
	 * 
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class LocaleVO
	{
		public var name:String;
		public var code:String;
		public var index:int;
		
		public function LocaleVO() {}
		
		public function toString() : String
		{
			return name;
		}
	}
}