package com.masuland.loginexample.action.task
{
	import com.adobe.cairngorm.task.Task;
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;

	/**
	 * @author masuland.com
	 */
	public class UpdateUserTask extends Task
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		public var user:UserVO;
		
		//----------------------
		// Methods
		//----------------------
		
		override protected function performTask():void
		{
			if (user == null)
			{
				fault('Error in UpdateUserTask: No UserVO found to perform the Task');
			}
			else
			{
				var token:AsyncToken = appDelegate.updateUser(user);
				token.addResponder(new Responder(updateUser_resultHandler, updateUser_faultHandler));
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function updateUser_resultHandler(event:ResultEvent):void
		{
			appModel.currentUser = UserVO( event.result );
		}
		
		protected function updateUser_faultHandler(event:FaultEvent):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}