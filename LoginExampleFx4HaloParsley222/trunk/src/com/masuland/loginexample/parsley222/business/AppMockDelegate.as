package com.masuland.loginexample.parsley222.business
{
	import com.masuland.loginexample.parsley222.model.AppModel;
	import com.masuland.loginexample.parsley222.util.MockDelegateHelper;
	import com.masuland.loginexample.parsley222.vo.AuthenticationVO;
	import com.masuland.loginexample.parsley222.vo.LayoutVO;
	import com.masuland.loginexample.parsley222.vo.LocaleVO;
	import com.masuland.loginexample.parsley222.vo.SettingsVO;
	import com.masuland.loginexample.parsley222.vo.StyleVO;
	import com.masuland.loginexample.parsley222.vo.UserVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	/**
	 * 
	 * @author masu
	 */
	public class AppMockDelegate implements IAppDelegate
	{
		/**  */
		[Inject]
		public var appModel:AppModel;
		
		/**  */
		[Inject]
		public var appRemoteObject:RemoteObject;

		/**
		 * 
		 */
		public function AppMockDelegate() {}
 
		/**
		 * 
		 */
		public function getSettings():AsyncToken
		{
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
				
				return MockDelegateHelper.createMockResult(settings, 500, true);
			}
			else
			{
				return appRemoteObject.getStyles.send();
			}
		}

		/**
		 * 
		 */
		public function login(auth:AuthenticationVO):AsyncToken
		{
			if (appModel.isMockData)
			{
				var user:UserVO = new UserVO();
				user.username = auth.username;
				
				return MockDelegateHelper.createMockResult(user, 500, true);
			}
			else
			{
				return appRemoteObject.login.send(auth);
			}
		}

		/**
		 * 
		 */
		public function register(auth:AuthenticationVO):AsyncToken
		{
			if (appModel.isMockData)
			{
				var user:UserVO = new UserVO();
				user.username = auth.username;
				user.email = auth.email;
				
				return MockDelegateHelper.createMockResult(user, 500, true);
			}
			else
			{
				return appRemoteObject.register.send(auth);
			}
		}

		/**
		 * 
		 */
		public function updateUser(user:UserVO):AsyncToken
		{
			if (appModel.isMockData)
			{
				return MockDelegateHelper.createMockResult(user, 500, true);
			}
			else
			{
				return appRemoteObject.updateUser.send(user);
			}
		}
	}
}
