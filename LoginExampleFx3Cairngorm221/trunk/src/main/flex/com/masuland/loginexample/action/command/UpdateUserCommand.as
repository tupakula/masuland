package com.masuland.loginexample.action.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.business.AppMockDelegate;
	import com.masuland.loginexample.business.IAppDelegate;
	import com.masuland.loginexample.action.event.UpdateUserEvent;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.state.LoginBoxState;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.rpc.IResponder;
	
	public class UpdateUserCommand implements ICommand, IResponder
	{
		public function execute(event:CairngormEvent):void
		{
			var delegate:IAppDelegate = new AppMockDelegate(this);
			delegate.updateUser( UpdateUserEvent( event ).user );
		}
		
		public function result(data:Object):void
		{
			var appModel:AppModel = AppModel.getInstance();
			
			appModel.currentUser = UserVO( data.result );
		}
		
		public function fault(info:Object):void
		{
			var appModel:AppModel = AppModel.getInstance();
			
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}