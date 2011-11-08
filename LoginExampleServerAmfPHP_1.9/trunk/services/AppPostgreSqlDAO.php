<?php

require_once "./com/masuland/loginexample/data/dto/AuthenticationDTO.php";
require_once "./com/masuland/loginexample/data/dto/UserDTO.php";

/**
 * @author masuland.com
 */
class AppPostgreSqlDAO
{
	/**
	 * testService()
	 * 
	 * @return Boolean
	 */
	public function testService() 
	{
		return false;
	}
	
	/**
	 * getSettings()
	 * 
	 * @return SettingsDTO
	 */
	public function getSettings()
	{
		return null;
	}

	/**
	 * login()
	 * 
	 * @param auth
	 * @return UserDTO
	 */
	public function login(AuthenticationDTO $auth) 
	{
		return null;
	}
	
	/**
	 * register()
	 * 
	 * @param auth
	 * @return UserDTO
	 */
	public function register(AuthenticationDTO $auth) 
	{
		return null;
	}
	
	/**
	 * updateUser()
	 * 
	 * @param user
	 * @return UserDTO
	 */
	public function updateUser(UserDTO $user) 
	{
		return null;
	}
} 
 
?>
