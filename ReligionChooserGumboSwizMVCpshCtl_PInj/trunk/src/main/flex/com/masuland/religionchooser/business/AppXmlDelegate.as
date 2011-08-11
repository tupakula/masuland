package com.masuland.religionchooser.business
{
	import com.masuland.religionchooser.service.contentxml.ContentXmlService;
	import com.masuland.religionchooser.service.settingsxml.SettingsXmlService;
	
	import mx.rpc.AsyncToken;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
 
	/**
	 * @author masuland.com
	 */
	public class AppXmlDelegate implements IAppDelegate
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var settingsXmlService:SettingsXmlService;

		[Inject]
		public var contentXmlService:ContentXmlService;

		//----------------------
		// Methods
		//----------------------

		public function getSettings(resultHandler:Function, faultHandler:Function):AsyncToken
		{
			settingsXmlService.addEventListener(ResultEvent.RESULT, resultHandler, false, 0, true);
			settingsXmlService.addEventListener(FaultEvent.FAULT, faultHandler, false, 0, true);
			
			return settingsXmlService.getData();
		}
		
		public function getContent(resultHandler:Function, faultHandler:Function):AsyncToken
		{
			contentXmlService.addEventListener(ResultEvent.RESULT, resultHandler, false, 0, true);
			contentXmlService.addEventListener(FaultEvent.FAULT, faultHandler, false, 0, true);
			
			return contentXmlService.getData();
		}
	}
}
