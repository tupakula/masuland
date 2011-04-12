package com.masuland.loginexample
{
	import com.masuland.loginexample.infrastructure.business.AppDelegateTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class AppTestSuite 
	{
		public var t1:AppDelegateTest;

		/**
		 * Default constructor
		 */
		public function AppTestSuite() {
			super();
		}
	}
}

