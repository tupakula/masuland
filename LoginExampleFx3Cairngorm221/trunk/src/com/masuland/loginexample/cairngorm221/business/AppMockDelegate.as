package com.masuland.loginexample.cairngorm221.business
{
	import com.adobe.cairngorm.business.ServiceLocator;
	import com.masuland.loginexample.cairngorm221.model.AppModel;
	import com.masuland.loginexample.cairngorm221.vo.AuthenticationVO;
	import com.masuland.loginexample.cairngorm221.vo.LayoutVO;
	import com.masuland.loginexample.cairngorm221.vo.LocaleVO;
	import com.masuland.loginexample.cairngorm221.vo.SettingsVO;
	import com.masuland.loginexample.cairngorm221.vo.StyleVO;
	import com.masuland.loginexample.cairngorm221.vo.UserVO;
	import com.masuland.loginexample.cairngorm221.util.MockDelegateHelper;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.RemoteObject;

	/**
	 * 
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class AppMockDelegate implements IAppDelegate
	{
		private var service:RemoteObject = ServiceLocator.getInstance().getRemoteObject(AppServices.APP_SERVICE);
		private var responder:IResponder;
		private var appModel:AppModel = AppModel.getInstance();
		
		public function AppMockDelegate(responder:IResponder)
		{
			this.responder = responder;
		}
		
		/**
		 * 
		 */
		public function getSettings():void
		{
			var token:AsyncToken;
			
			if (appModel.isMockData)
			{
				var settings:SettingsVO = new SettingsVO();
				settings.styles = new ArrayCollection();
				
				var style:StyleVO = new StyleVO();
				style.name = 'Green';
				style.path = 'style/login_example_green.swf';
				settings.styles.addItem(style);
				
				style = new StyleVO();
				style.name = 'Red';
				style.path = 'style/login_example_red.swf';
				settings.styles.addItem(style);

				settings.layouts = new ArrayCollection();
				
				var layout:LayoutVO = new LayoutVO();
				layout.name = '400x300';
				layout.width = 400;
				layout.heigth = 300;
				settings.layouts.addItem(layout);

				layout = new LayoutVO();
				layout.name = '500x350';
				layout.width = 500;
				layout.heigth = 350;
				settings.layouts.addItem(layout);

				layout = new LayoutVO();
				layout.name = '600x400';
				layout.width = 600;
				layout.heigth = 400;
				settings.layouts.addItem(layout);
				
				settings.locales = new ArrayCollection();
				
				var locale:LocaleVO = new LocaleVO();
				locale.name = 'English';
				locale.code = 'en_US';
				settings.locales.addItem(locale);

				locale = new LocaleVO();
				locale.name = 'Deutsch';
				locale.code = 'de_DE';
				settings.locales.addItem(locale);

				token = MockDelegateHelper.createMockResult(settings, 500, true);
			}
			else
			{
				token = service.getSettings();
			}

			token.addResponder(responder);
		}

		/**
		 * 
		 */
		public function login(auth:AuthenticationVO):void
		{
			var token:AsyncToken;

			if (appModel.isMockData)
			{
				var user:UserVO = new UserVO();
				user.username = auth.username;
				
				token = MockDelegateHelper.createMockResult(user, 500, true);
			}
			else
			{
				token = service.login(auth);
			}

			token.addResponder(responder);
		}

		/**
		 * 
		 */
		public function register(auth:AuthenticationVO):void
		{
			var token:AsyncToken;

			if (appModel.isMockData)
			{
				var user:UserVO = new UserVO();
				user.username = auth.username;
				user.email = auth.email;
				
				token = MockDelegateHelper.createMockResult(user, 500, true);
			}
			else
			{
				token = service.register(auth);
			}

			token.addResponder(responder);
		}

		/**
		 * 
		 */
		public function updateUser(user:UserVO):void
		{
			var token:AsyncToken;

			if (appModel.isMockData)
			{
				token = MockDelegateHelper.createMockResult(user, 500, true);
			}
			else
			{
				token = service.updateUser(user);
			}

			token.addResponder(responder);
		}
	}
}
