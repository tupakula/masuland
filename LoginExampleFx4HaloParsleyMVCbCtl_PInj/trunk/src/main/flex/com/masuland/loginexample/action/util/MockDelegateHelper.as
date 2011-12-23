package com.masuland.loginexample.action.util 
{
	import flash.utils.setTimeout;
	
	import mx.core.mx_internal;
	import mx.managers.CursorManager;
	import mx.rpc.AsyncToken;
	import mx.rpc.events.ResultEvent;
	
	use namespace mx_internal;
	
	/**
	 * @author masuland.com
	 */
	public class MockDelegateHelper
	{
		//----------------------
		// Methods
		//----------------------
		
		public static function createMockResult(result:Object, delay:Number=0, showBusyCursor:Boolean=false):AsyncToken
		{
			if (showBusyCursor)
			{
				CursorManager.setBusyCursor();
			}

			var token:AsyncToken = new AsyncToken(null);
			setTimeout(applyResult, delay, token, result, showBusyCursor);
			
			return token;
		}
		
		private static function applyResult(token:AsyncToken, result:Object, showBusyCursor:Boolean=false):void
		{
			token.setResult(result);
			var event:ResultEvent = new ResultEvent(ResultEvent.RESULT, false, true, result, token);
			token.applyResult(event);
			
			if (showBusyCursor)
			{
				CursorManager.removeBusyCursor();
			}
		}
	}
}