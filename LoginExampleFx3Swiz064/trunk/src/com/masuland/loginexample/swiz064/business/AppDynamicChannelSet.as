package com.masuland.loginexample.swiz064.business
{
	import org.swizframework.util.DynamicChannelSet;

	
	/**  */
	public class AppDynamicChannelSet extends DynamicChannelSet
	{
		/**  */
		public function AppDynamicChannelSet(channelIds:Array=null, clusteredWithURLLoadBalancing:Boolean=false)
		{
			super(channelIds, clusteredWithURLLoadBalancing);
		}
	}
}