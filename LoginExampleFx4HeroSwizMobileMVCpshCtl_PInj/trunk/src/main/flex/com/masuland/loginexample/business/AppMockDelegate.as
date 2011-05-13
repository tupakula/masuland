package com.masuland.loginexample.business
{
	import com.masuland.loginexample.data.vo.AuthenticationVO;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.SettingsVO;
	import com.masuland.loginexample.data.vo.StyleVO;
	import com.masuland.loginexample.data.vo.UserVO;
	
	import mx.collections.ArrayCollection;
	import mx.rpc.AsyncToken;
	
	import org.swizframework.utils.services.MockDelegateHelper;
	
	/**
	 * @author masuland.com
	 */
	public class AppMockDelegate implements IAppDelegate
	{
		//----------------------
		// Properties
		//----------------------
		
		protected var _helper:MockDelegateHelper = new MockDelegateHelper(); 
		
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
			
			return _helper.createMockResult(settings, 500);
		}
		
		public function login(auth:AuthenticationVO):AsyncToken
		{
			var user:UserVO = new UserVO();
			user.username = auth.username;
			
			return _helper.createMockResult(user, 500);
		}
		
		public function register(auth:AuthenticationVO):AsyncToken
		{
			var user:UserVO = new UserVO();
			user.username = auth.username;
			user.email = auth.email;
			
			return _helper.createMockResult(user, 500);
		}
		
		public function updateUser(user:UserVO):AsyncToken
		{
			return _helper.createMockResult(user.clone(), 500);
		}
	}
}
