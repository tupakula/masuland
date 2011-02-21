package com.masuland.loginexample.control.responder
{	
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.state.AppStackState;
	import com.masuland.loginexample.state.LoginBoxState;
	import com.masuland.loginexample.vo.UserVO;
	
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