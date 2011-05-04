package com.masuland.loginexample.action.signal
{	
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
	import org.osflash.signals.Signal;

	/**  */
	public class RegisterSignal extends Signal
	{	
		/**  */
		public function RegisterSignal()
		{
			super(AuthenticationVO);
		}
	}
}