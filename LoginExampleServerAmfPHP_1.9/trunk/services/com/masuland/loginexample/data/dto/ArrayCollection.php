<?php

/**
 * @author masuland.com
 */
class ArrayCollection 
{ 
	var $_explicitType;
	var $source; 
	
	function ArrayCollection() 
	{
		$this->source = array();
		$this->_explicitType = "flex.messaging.io.ArrayCollection";
	}
}

?>
