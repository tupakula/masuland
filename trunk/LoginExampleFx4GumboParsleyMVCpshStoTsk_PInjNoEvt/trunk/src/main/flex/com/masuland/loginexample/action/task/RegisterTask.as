package com.masuland.loginexample.action.task
{
	import com.adobe.cairngorm.task.Task;
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	/**
	 * @author masuland.com
	 */
	public class RegisterTask extends Task
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		public var auth:AuthenticationVO;
		
		//----------------------
		// Methods
		//----------------------
		
		override protected function performTask():void
		{
			if (auth == null)
			{
				fault('Error in RegisterTask: No AuthenticationVO found to perform the Task');
			}
			else
			{
				appModel.loginBoxState = LoginBoxState.REGISTER_PROGRESS;
				
				var token:AsyncToken = appDelegate.register(auth);
				token.addResponder(new Responder(register_resultHandler, register_faultHandler));
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function register_resultHandler(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		protected function register_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}