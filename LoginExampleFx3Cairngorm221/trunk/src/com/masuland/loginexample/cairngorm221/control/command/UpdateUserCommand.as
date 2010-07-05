package com.masuland.loginexample.cairngorm221.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.cairngorm221.business.AppMockDelegate;
	import com.masuland.loginexample.cairngorm221.business.IAppDelegate;
	import com.masuland.loginexample.cairngorm221.control.event.UpdateUserEvent;
	import com.masuland.loginexample.cairngorm221.model.AppModel;
	import com.masuland.loginexample.cairngorm221.state.LoginBoxState;
	import com.masuland.loginexample.cairngorm221.vo.UserVO;
	
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