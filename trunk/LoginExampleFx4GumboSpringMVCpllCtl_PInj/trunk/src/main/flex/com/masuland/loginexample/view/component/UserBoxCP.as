package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.control.event.AppEvent;
	import com.masuland.loginexample.control.event.UpdateUserEvent;
	import com.masuland.loginexample.vo.UserVO;
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	import spark.components.supportClasses.SkinnableComponent;

	public class UserBoxCP extends SkinnableComponent
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject(name='appModel', property='currentUser')]
		[Bindable]
		public var currentUser:UserVO;
		
		//----------------------
		// Methods
		//----------------------
		
		public function updateUser(user:UserVO):void
		{
			EventBus.dispatchEvent(new UpdateUserEvent(user));
		}
		
		public function logout():void
		{
			EventBus.dispatchEvent(new AppEvent(AppEvent.LOGOUT));
		}
	}
}