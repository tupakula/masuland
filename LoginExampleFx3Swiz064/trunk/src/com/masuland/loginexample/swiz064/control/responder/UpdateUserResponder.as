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