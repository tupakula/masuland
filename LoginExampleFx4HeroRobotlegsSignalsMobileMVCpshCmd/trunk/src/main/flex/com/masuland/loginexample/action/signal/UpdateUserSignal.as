package com.masuland.loginexample.action.signal
{	
	import com.masuland.loginexample.data.vo.UserVO;
	
	import org.osflash.signals.Signal;

	/**  */
	public class UpdateUserSignal extends Signal
	{	
		/**  */
		public function UpdateUserSignal()
		{
			super(UserVO);
		}
	}
}