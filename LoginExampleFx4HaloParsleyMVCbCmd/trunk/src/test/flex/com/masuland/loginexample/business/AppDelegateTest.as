package com.masuland.loginexample.business
{
	import com.masuland.loginexample.AppConfig;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.flexunit.Assert;
	import org.flexunit.async.Async;
	import org.flexunit.async.TestResponder;
	import org.spicefactory.parsley.core.context.Context;
	import org.spicefactory.parsley.dsl.context.ContextBuilder;
	import org.spicefactory.parsley.flex.FlexConfig;
	
	public class AppDelegateTest 
	{
		//----------------------
		// Constants
		//----------------------

		private static const TIMEOUT:int = 5000;

		//----------------------
		// Properties
		//----------------------

		[Inject]
		public var appDelegate:IAppDelegate;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function AppDelegateTest()
		{
			super();
		}
		
		//----------------------
		// Methods
		//----------------------
		
		[BeforeClass]
		public static function setUpClass():void 
		{
		}
		
		[AfterClass]
		public static function tearDownClass():void 
		{
		}
		
		[Before]
		public function setUp():void
		{
			var contextBuilder:ContextBuilder;
			var context:Context;
			
			// Use the ContextBuilder to build your context
			contextBuilder = ContextBuilder.newBuilder();
			contextBuilder.config(FlexConfig.forClass(AppConfig));
			
			context = contextBuilder.build();
			
			// Add this test case to your context 
			// which will begin the injection process
			context.addDynamicObject(this);
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[Test(async, order=1)]
		public function getSettings():void 
		{
			var token:AsyncToken = appDelegate.getSettings();
			token.addResponder(Async.asyncResponder(this, new TestResponder(getSettings_resultHandler, global_faultHandler), TIMEOUT));
		}
		
		[Test(async, order=2)]
		public function login():void 
		{
			var auth:AuthenticationVO = new AuthenticationVO();
			auth.username = 'user';
			auth.password = 'test';
			
			var token:AsyncToken = appDelegate.login(auth);
			token.addResponder(Async.asyncResponder(this, new TestResponder(login_resultHandler, global_faultHandler), TIMEOUT));
		}
		
		[Test(async, order=3)]
		public function register():void 
		{
			var auth:AuthenticationVO = new AuthenticationVO();
			auth.username = 'user';
			auth.password = 'test';
			
			var token:AsyncToken = appDelegate.register(auth);
			token.addResponder(Async.asyncResponder(this, new TestResponder(register_resultHandler, global_faultHandler), TIMEOUT));
		}

		[Test(async, order=4)]
		public function updateUser():void 
		{
			var user:UserVO = new UserVO();
			user.username = 'user';
			user.email = 'test@test.com';
			
			var token:AsyncToken = appDelegate.updateUser(user);
			token.addResponder(Async.asyncResponder(this, new TestResponder(updateUser_resultHandler, global_faultHandler), TIMEOUT));
		}

		//----------------------
		// Handler
		//----------------------
		
		protected function getSettings_resultHandler(event:ResultEvent, passThroughData:Object):void 
		{
			Assert.assertTrue(event.result is SettingsVO);
		}
		
		protected function login_resultHandler(event:ResultEvent, passThroughData:Object):void 
		{
			Assert.assertTrue(event.result is UserVO);
		}
		
		protected function register_resultHandler(event:ResultEvent, passThroughData:Object):void 
		{
			Assert.assertTrue(event.result is UserVO);
		}

		protected function updateUser_resultHandler(event:ResultEvent, passThroughData:Object):void 
		{
			Assert.assertTrue(event.result is UserVO);
		}
		
		protected function global_faultHandler(event:FaultEvent, passThroughData:Object):void 
		{
			Assert.fail('Error in global_faultHandler: ' + event.fault.faultString);
		}
	}
}


