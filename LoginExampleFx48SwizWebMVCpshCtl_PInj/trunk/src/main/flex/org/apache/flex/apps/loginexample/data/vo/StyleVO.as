package org.apache.flex.apps.loginexample.data.vo
{
	[RemoteClass(alias='org.apache.flex.apps.loginexample.data.dto.StyleDTO')]
	[Bindable]
	/**
	 * 
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