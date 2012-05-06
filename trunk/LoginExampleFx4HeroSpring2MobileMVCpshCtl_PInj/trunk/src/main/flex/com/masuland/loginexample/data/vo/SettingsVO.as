package com.masuland.loginexample.data.vo
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias='com.masuland.loginexample.data.dto.SettingsDTO')]
	[Bindable]
	/**
	 * @author masuland.com
	 */
	public class SettingsVO
	{
		//----------------------
		// Properties
		//----------------------
		
		public var layouts:ArrayCollection;
	}
}