package com.masuland.religionchooser.view.component
{
	import flash.events.IEventDispatcher;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class AppViewCB extends SkinnableComponent
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[SkinPart(require="true")]
		public var bx_content:ContentBoxCB;
		
		[SkinPart(require="true")]
		public var bx_settings:SettingsBoxCB;
	}
}