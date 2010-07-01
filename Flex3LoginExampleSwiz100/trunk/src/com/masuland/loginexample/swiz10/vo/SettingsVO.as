package com.masuland.loginexample.swiz10.vo
{
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * 
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class SettingsVO
	{
		public var layouts:ArrayCollection;
		public var styles:ArrayCollection;
		public var locales:ArrayCollection;
		
		public function SettingsVO() {}
	}
}