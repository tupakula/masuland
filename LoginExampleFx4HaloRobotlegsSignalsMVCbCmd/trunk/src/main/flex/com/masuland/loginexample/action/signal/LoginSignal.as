package com.masuland.loginexample.action.signal
{	
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	
	import org.osflash.signals.Signal;

	/**  */
	public class LoginSignal extends Signal
	{	
		/**  */
		public function LoginSignal()
		{
			super(AuthenticationVO);
		}
	}
}