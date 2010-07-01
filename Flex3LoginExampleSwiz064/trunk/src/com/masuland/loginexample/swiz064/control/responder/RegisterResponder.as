package com.masuland.loginexample.swiz064.control.responder
{	
	import com.masuland.loginexample.swiz064.model.AppModel;
	import com.masuland.loginexample.swiz064.state.AppStackState;
	import com.masuland.loginexample.swiz064.state.LoginBoxState;
	import com.masuland.loginexample.swiz064.vo.UserVO;
	
	import flash.events.Event;
	
	import mx.rpc.IResponder;
	
	import org.swizframework.Swiz;

	/**  */
	public class RegisterResponder implements IResponder
	{
		/**  */
		[Bindable]
		[Autowire]
		public var appModel:AppModel;
		
		public var nextEvent:Event;
		
		
		/** Konstruktur */
		public function RegisterResponder(nextEvent:Event = null) 
		{
			Swiz.autowire(this);
			
			this.nextEvent = nextEvent;
		}

		/**  */
		public function result(data:Object):void
		{
			appModel.currentUser = UserVO( data.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		/**  */
		public function fault(info:Object):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}