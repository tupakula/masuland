package com.masuland.loginexample.action.signal
{	
	import com.masuland.loginexample.data.vo.LocaleVO;
	
	import org.osflash.signals.Signal;

	/**
	 * @author masuland.com
	 */
	public class LoadLocaleSignal extends Signal
	{	
		public function LoadLocaleSignal()
		{
			super(LocaleVO);
		}
	}
}
