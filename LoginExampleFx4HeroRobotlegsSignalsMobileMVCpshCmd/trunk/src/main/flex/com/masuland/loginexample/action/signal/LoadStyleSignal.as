package com.masuland.loginexample.action.signal
{	
	import com.masuland.loginexample.data.vo.StyleVO;
	
	import org.osflash.signals.Signal;

	/**
	 * @author masuland.com
	 */
	public class LoadStyleSignal extends Signal
	{	
		public function LoadStyleSignal()
		{
			super(StyleVO);
		}
	}
}
