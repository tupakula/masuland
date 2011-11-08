<?php

require_once("Zend/Amf/Server.php");
require_once("AppMockDAO.php");

$server = new Zend_Amf_Server();

// Adding our class to Zend AMF Server
$server->setClass("AppMockDAO");

// Mapping the ActionScript VO to the PHP VO
$server->setClassMap("flex.messaging.io.ArrayCollection", "com.masuland.loginexample.data.dto.ArrayCollection");
$server->setClassMap("com.masuland.loginexample.data.vo.SettingsVO", "com.masuland.loginexample.data.dto.SettingsDTO");
$server->setClassMap("com.masuland.loginexample.data.vo.LayoutVO", "com.masuland.loginexample.data.dto.LayoutDTO");
$server->setClassMap("com.masuland.loginexample.data.vo.LocaleVO", "com.masuland.loginexample.data.dto.LocaleDTO");
$server->setClassMap("com.masuland.loginexample.data.vo.StyleVO", "com.masuland.loginexample.data.dto.StyleDTO");
$server->setClassMap("com.masuland.loginexample.data.vo.AuthenticationVO", "com.masuland.loginexample.data.dto.AuthenticationDTO");
$server->setClassMap("com.masuland.loginexample.data.vo.UserVO", "com.masuland.loginexample.data.dto.UserDTO");

echo($server->handle());

?>
