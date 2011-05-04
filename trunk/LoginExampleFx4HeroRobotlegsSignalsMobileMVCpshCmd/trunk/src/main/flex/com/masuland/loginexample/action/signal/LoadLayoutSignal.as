package com.masuland.loginexample.action.signal
{	
	import com.masuland.loginexample.data.vo.LayoutVO;
	
	import org.osflash.signals.Signal;

	/**  */
	public class LoadLayoutSignal extends Signal
	{	
		/**  */
		public function LoadLayoutSignal()
		{
			super(LayoutVO, Boolean);
		}
	}
}