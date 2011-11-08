<?php

require_once "./com/masuland/loginexample/data/dto/ArrayCollection.php";
require_once "./com/masuland/loginexample/data/dto/SettingsDTO.php";
require_once "./com/masuland/loginexample/data/dto/LayoutDTO.php";
require_once "./com/masuland/loginexample/data/dto/LocaleDTO.php";
require_once "./com/masuland/loginexample/data/dto/StyleDTO.php";
require_once "./com/masuland/loginexample/data/dto/AuthenticationDTO.php";
require_once "./com/masuland/loginexample/data/dto/UserDTO.php";

/**
 * @author masuland.com
 */
class AppMockDAO
{
	/**
	 * testService()
	 * 
	 * @return Boolean
	 */
	public function testService() 
	{
		return true;
	}
	
	/**
	 * getSettings()
	 * 
	 * @return SettingsDTO
	 */
	function getSettings()
	{
		$settings = new SettingsDTO();
		
		// Locale
		
		$locales = new ArrayCollection();
		
		$locale = new LocaleDTO();
		$locale->name = "English";
		$locale->code = "en_US";
		array_push($locales->source, $locale);
		
		$locale = new LocaleDTO();
		$locale->name = "Deutsch";
		$locale->code = "de_DE";
		array_push($locales->source, $locale);
				
		// Web style
		
		$styles = new ArrayCollection();
		
		$style = new StyleDTO();
		$style->name = "Web, Green";
		$style->path = "style/login_example_web_green.swf";
		array_push($styles->source, $style);
		
		$style = new StyleDTO();
		$style->name = "Web, Red";
		$style->path = "style/login_example_web_red.swf";
		array_push($styles->source, $style);
		
		// Web layout
		
		$settings->layouts = new ArrayCollection();
		
		$layout = new LayoutDTO();
		$layout->name = "Web, 450x320";
		$layout->width = 450;
		$layout->height = 320;
		$layout->stateName = "web";
		$layout->styles = $styles;
		$layout->locales = $locales;
		array_push($settings->layouts->source, $layout);
		
		$layout = new LayoutDTO();
		$layout->name = "Web, 500x350";
		$layout->width = 500;
		$layout->height = 350;
		$layout->stateName = "web";
		$layout->styles = $styles;
		$layout->locales = $locales;
		array_push($settings->layouts->source, $layout);
				
		$layout = new LayoutDTO();
		$layout->name = "Web, 600x400";
		$layout->width = 600;
		$layout->height = 400;
		$layout->stateName = "web";
		$layout->styles = $styles;
		$layout->locales = $locales;
		array_push($settings->layouts->source, $layout);
				
		// Phone style
		
		$styles = new ArrayCollection();
		
		$style = new StyleDTO();
		$style->name = "Phone, Green";
		$style->path = "style/login_example_phone_green.swf";
		array_push($styles->source, $style);
		
		$style = new StyleDTO();
		$style->name = "Phone, Red";
		$style->path = "style/login_example_phone_red.swf";
		array_push($styles->source, $style);
		
		// Phone layout
		
		$layout = new LayoutDTO();
		$layout->name = "Phone, 280x420";
		$layout->width = 280;
		$layout->height = 420;
		$layout->stateName = "phone";
		$layout->styles = $styles;
		$layout->locales = $locales;
		array_push($settings->layouts->source, $layout);
				
		$layout = new LayoutDTO();
		$layout->name = "Phone, 300x500";
		$layout->width = 300;
		$layout->height = 500;
		$layout->stateName = "phone";
		$layout->styles = $styles;
		$layout->locales = $locales;
		array_push($settings->layouts->source, $layout);
					
		return $settings;
	}

	/**
	 * login()
	 * 
	 * @param auth
	 * @return UserDTO
	 */
	public function login(AuthenticationDTO $auth) 
	{
		$user = new UserDTO();
		$user->username = $auth->username;
		
		return $user;
	}
	
	/**
	 * register()
	 * 
	 * @param auth
	 * @return UserDTO
	 */
	public function register(AuthenticationDTO $auth) 
	{
		$user = new UserDTO();
		$user->username = $auth->username;
		$user->email = $auth->email;
		
		return $user;
	}
	
	/**
	 * updateUser()
	 * 
	 * @param user
	 * @return UserDTO
	 */
	public function updateUser(UserDTO $user) 
	{
		return $user;
	}
}

?>
