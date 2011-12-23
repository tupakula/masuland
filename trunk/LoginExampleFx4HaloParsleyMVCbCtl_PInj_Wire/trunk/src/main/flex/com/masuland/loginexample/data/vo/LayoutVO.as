package com.masuland.loginexample.data.vo
{
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * @author masuland.com
	 */
	public class LayoutVO
	{
		//----------------------
		// Properties
		//----------------------
		
		public var name:String;
		public var width:Number;
		public var height:Number;
		public var stateName:String;
		public var styles:ArrayCollection; // List of StyleVOs
		public var locales:ArrayCollection; // List of LocaleVOs

		//----------------------
		// Methods
		//----------------------
		
		public function toString():String
		{
			return name;
		}
	}
}