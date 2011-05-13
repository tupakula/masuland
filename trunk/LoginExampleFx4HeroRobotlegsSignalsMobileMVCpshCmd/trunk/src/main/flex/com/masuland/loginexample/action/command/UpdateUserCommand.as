package com.masuland.loginexample.action.command
{
	import com.masuland.loginexample.action.signal.UpdateUserSignal;
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import org.robotlegs.mvcs.SignalCommand;

	/**
	 * @author masuland.com
	 */
	public class UpdateUserCommand extends SignalCommand
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		[Inject]
		public var appDelegate:IAppDelegate;
		
		[Inject]
		public var user:UserVO;
		
		//----------------------
		// Methods
		//----------------------
		
		override public function execute():void
		{
			var token:AsyncToken = appDelegate.updateUser(user);
			token.addResponder(new Responder(updateUser_resultHandler, updateUser_faultHandler));
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
