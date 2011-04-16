package com.masuland.loginexample.action.responder
{	
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.AppStackState;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import flash.events.Event;
	
	import mx.rpc.IResponder;
	
	import org.swizframework.Swiz;

	/**  */
	public class UpdateUserResponder implements IResponder
	{
		/**  */
		[Bindable]
		[Autowire]
		public var appModel:AppModel;
		
		/** Konstruktur */
		public function UpdateUserResponder() 
		{
			Swiz.autowire(this);
		}

		/**  */
		public function result(data:Object):void
		{
			appModel.currentUser = UserVO( data.result );
		}
		
		/**  */
		public function fault(info:Object):void
		{
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}