package org.apache.flex.apps.loginexample.data.vo
{
	[RemoteClass(alias='org.apache.flex.apps.loginexample.data.dto.LocaleDTO')]
	[Bindable]
	/**
	 * 
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