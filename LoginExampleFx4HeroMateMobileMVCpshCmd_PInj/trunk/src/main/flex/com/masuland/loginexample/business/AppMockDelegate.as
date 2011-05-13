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
	
	/**
	 * @author masuland.com
	 */
	public class AppMockDelegate implements IAppDelegate
	{
		//----------------------
		// Methods
		//----------------------
		
		public function getSettings():AsyncToken
		{
			var settings:SettingsVO = new SettingsVO();
			settings.layouts = new ArrayCollection();
			
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
			
			// Phone style
			
			var styles:ArrayCollection = new ArrayCollection();
			
			var style:StyleVO = new StyleVO();
			style.name = 'Green';
			style.path = 'style/style_green.swf';
			styles.addItem(style);
			
			style = new StyleVO();
			style.name = 'Red';
			style.path = 'style/style_red.swf';
			styles.addItem(style);
			
			// Phone layout
			
			var layout:LayoutVO = new LayoutVO();
			layout.name = 'Portrait';
			layout.stateName = 'portrait';
			layout.styles = styles;
			layout.locales = locales;
			settings.layouts.addItem(layout);
			
			layout = new LayoutVO();
			layout.name = 'Landscape';
			layout.stateName = 'landscape';
			layout.styles = styles;
			layout.locales = locales;
			settings.layouts.addItem(layout);
			
			return MockDelegateHelper.createMockResult(settings, 500, true);
		}

		public function login(auth:AuthenticationVO):AsyncToken
		{
			var user:UserVO = new UserVO();
			user.username = auth.username;
			
			return MockDelegateHelper.createMockResult(user, 500, true);
		}

		public function register(auth:AuthenticationVO):AsyncToken
		{
			var user:UserVO = new UserVO();
			user.username = auth.username;
			user.email = auth.email;
			
			return MockDelegateHelper.createMockResult(user, 500, true);
		}

		public function updateUser(user:UserVO):AsyncToken
		{
			return MockDelegateHelper.createMockResult(user.clone(), 500, true);
		}
	}
}
