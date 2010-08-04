package com.masuland.loginexample.spring.business
{
	import com.masuland.loginexample.spring.model.AppModel;
	import com.masuland.loginexample.spring.util.MockDelegateHelper;
	import com.masuland.loginexample.spring.vo.AuthenticationVO;
	import com.masuland.loginexample.spring.vo.LayoutVO;
	import com.masuland.loginexample.spring.vo.LocaleVO;
	import com.masuland.loginexample.spring.vo.SettingsVO;
	import com.masuland.loginexample.spring.vo.StyleVO;
	import com.masuland.loginexample.spring.vo.UserVO;
	
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
		[Autowired]
		public var appModel:AppModel;
		
		/**  */
		[Autowired]
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
				
				// Locale
				
				var locales:ArrayCollection = new ArrayCollection();
				
				var locale:LocaleVO = new LocaleVO();
				locale.name = 'English';
				locale.code = 'en_US';
				locales.addItem(locale);
				
				locale = new LocaleVO();
				locale.name = 'Deutsch';
				locale.code = 'de_DE';
				locales.addItem(locale);
				
				// Web style
				
				var styles:ArrayCollection = new ArrayCollection();
				
				var style:StyleVO = new StyleVO();
				style.name = 'Web, Green';
				style.path = 'style/login_example_web_green.swf';
				styles.addItem(style);
				
				style = new StyleVO();
				style.name = 'Web, Red';
				style.path = 'style/login_example_web_red.swf';
				styles.addItem(style);
				
				// Web layout
				
				settings.layouts = new ArrayCollection();
				
				var layout:LayoutVO = new LayoutVO();
				layout.name = 'Web, 450x320';
				layout.width = 450;
				layout.height = 320;
				layout.stateName = 'web';
				layout.styles = styles;
				layout.locales = locales;
				settings.layouts.addItem(layout);
				
				layout = new LayoutVO();
				layout.name = 'Web, 500x350';
				layout.width = 500;
				layout.height = 350;
				layout.stateName = 'web';
				layout.styles = styles;
				layout.locales = locales;
				settings.layouts.addItem(layout);
				
				layout = new LayoutVO();
				layout.name = 'Web, 600x400';
				layout.width = 600;
				layout.height = 400;
				layout.stateName = 'web';
				layout.styles = styles;
				layout.locales = locales;
				settings.layouts.addItem(layout);
				
				// Phone style
				
				styles = new ArrayCollection();
				
				style = new StyleVO();
				style.name = 'Phone, Green';
				style.path = 'style/login_example_phone_green.swf';
				styles.addItem(style);
				
				style = new StyleVO();
				style.name = 'Phone, Red';
				style.path = 'style/login_example_phone_red.swf';
				styles.addItem(style);
				
				// Phone layout
				
				layout = new LayoutVO();
				layout.name = 'Phone, 280x420';
				layout.width = 280;
				layout.height = 420;
				layout.stateName = 'phone';
				layout.styles = styles;
				layout.locales = locales;
				settings.layouts.addItem(layout);
				
				layout = new LayoutVO();
				layout.name = 'Phone, 300x500';
				layout.width = 300;
				layout.height = 500;
				layout.stateName = 'phone';
				layout.styles = styles;
				layout.locales = locales;
				settings.layouts.addItem(layout);
				
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
