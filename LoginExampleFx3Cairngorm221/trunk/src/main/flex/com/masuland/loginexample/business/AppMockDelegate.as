package com.masuland.loginexample.business
{
	import com.masuland.loginexample.business.helper.MockDelegateHelper;
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	import mx.rpc.IResponder;

	/**
	 * 
	 * @author Sebastian.Mohr (masuland@gmail.com)
	 */
	public class AppMockDelegate implements IAppDelegate
	{
		private var responder:IResponder;
		
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
			layout.heigth = 320;
			layout.stateName = 'web';
			layout.styles = styles;
			layout.locales = locales;
			settings.layouts.addItem(layout);
			
			layout = new LayoutVO();
			layout.name = 'Web, 500x350';
			layout.width = 500;
			layout.heigth = 350;
			layout.stateName = 'web';
			layout.styles = styles;
			layout.locales = locales;
			settings.layouts.addItem(layout);
			
			layout = new LayoutVO();
			layout.name = 'Web, 600x400';
			layout.width = 600;
			layout.heigth = 400;
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
			layout.heigth = 420;
			layout.stateName = 'phone';
			layout.styles = styles;
			layout.locales = locales;
			settings.layouts.addItem(layout);
			
			layout = new LayoutVO();
			layout.name = 'Phone, 300x500';
			layout.width = 300;
			layout.heigth = 500;
			layout.stateName = 'phone';
			layout.styles = styles;
			layout.locales = locales;
			settings.layouts.addItem(layout);
			
			token = MockDelegateHelper.createMockResult(settings, 500, true);
			token.addResponder(responder);
		}

		/**
		 * 
		 */
		public function login(auth:AuthenticationVO):void
		{
			var token:AsyncToken;

			var user:UserVO = new UserVO();
			user.username = auth.username;
			
			token = MockDelegateHelper.createMockResult(user, 500, true);
			token.addResponder(responder);
		}

		/**
		 * 
		 */
		public function register(auth:AuthenticationVO):void
		{
			var token:AsyncToken;

			var user:UserVO = new UserVO();
			user.username = auth.username;
			user.email = auth.email;
			
			token = MockDelegateHelper.createMockResult(user, 500, true);
			token.addResponder(responder);
		}

		/**
		 * 
		 */
		public function updateUser(user:UserVO):void
		{
			var token:AsyncToken;

			token = MockDelegateHelper.createMockResult(user, 500, true);
			token.addResponder(responder);
		}
	}
}
