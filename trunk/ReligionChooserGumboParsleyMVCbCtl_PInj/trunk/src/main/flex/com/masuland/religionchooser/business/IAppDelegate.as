package com.masuland.religionchooser.business
{
	import mx.rpc.AsyncToken;
 
	public interface IAppDelegate
	{
		/**
		 * getSettings()
		 * 
		 * @return SettingsVO
		 */
		function getSettings(resultHandler:Function, faultHandler:Function):AsyncToken;
		
		/**
		 * getContent()
		 * 
		 * @return QuestionVO
		 */
		function getContent(resultHandler:Function, faultHandler:Function):AsyncToken;
	}
}
