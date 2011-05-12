package com.masuland.loginexample.business
{
	import mx.rpc.remoting.mxml.RemoteObject;

	/**
	 * @author masuland.com
	 */
	public dynamic class AppRemoteObject extends RemoteObject
	{
		//----------------------
		// Constructor
		//----------------------
		
		public function AppRemoteObject(destination:String=null)
		{
			super(destination);
		}
	}
}