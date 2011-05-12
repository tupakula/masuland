package com.masuland.loginexample.business
{
	import org.swizframework.util.DynamicChannelSet;

	/**
	 * @author masuland.com
	 */
	public class AppDynamicChannelSet extends DynamicChannelSet
	{
		//----------------------
		// Constructor
		//----------------------
		
		public function AppDynamicChannelSet(channelIds:Array=null, clusteredWithURLLoadBalancing:Boolean=false)
		{
			super(channelIds, clusteredWithURLLoadBalancing);
		}
	}
}