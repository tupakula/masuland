package com.masuland.loginexample.cairngorm221.control.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.masuland.loginexample.cairngorm221.business.AppMockDelegate;
	import com.masuland.loginexample.cairngorm221.business.IAppDelegate;
	import com.masuland.loginexample.cairngorm221.control.event.RegisterEvent;
	import com.masuland.loginexample.cairngorm221.model.AppModel;
	import com.masuland.loginexample.cairngorm221.state.AppStackState;
	import com.masuland.loginexample.cairngorm221.state.LoginBoxState;
	import com.masuland.loginexample.cairngorm221.vo.UserVO;
	
	import mx.rpc.IResponder;
	
	public class RegisterCommand implements ICommand, IResponder
	{
		public function execute(event:CairngormEvent):void
		{
			var appModel:AppModel = AppModel.getInstance();
			
			appModel.loginBoxState = LoginBoxState.REGISTER_PROGRESS;

			var delegate:IAppDelegate = new AppMockDelegate(this);
			delegate.register(RegisterEvent( event ).auth);
		}
		
		public function result(data:Object):void
		{
			var appModel:AppModel = AppModel.getInstance();

			appModel.currentUser = UserVO( data.result );
			appModel.appStackState = AppStackState.USER;
			appModel.loginBoxState = LoginBoxState.HIDDEN;
		}
		
		public function fault(info:Object):void
		{
			var appModel:AppModel = AppModel.getInstance();
			
			appModel.loginBoxState = LoginBoxState.LOGIN;
		}
	}
}