package org.apache.flex.apps.loginexample.data.vo
{
	import mx.collections.ArrayCollection;

	[RemoteClass(alias='org.apache.flex.apps.loginexample.data.dto.SettingsDTO')]
	[Bindable]
	/**
	 * 
	 */
	public class SettingsVO
	{
		//----------------------
		// Properties
		//----------------------
		
		public var layouts:ArrayCollection;
	}
}