package com.masuland.loginexample.domain.vo
{
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * 
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class LayoutVO
	{
		public var name:String;
		public var width:Number;
		public var height:Number;
		public var stateName:String;
		public var styles:ArrayCollection; // List of StyleVOs
		public var locales:ArrayCollection; // List of LocaleVOs
		
		public function LayoutVO() {}

		public function toString() : String
		{
			return name;
		}
	}
}