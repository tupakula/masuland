package com.masuland.religionchooser.view.component
{
	import spark.components.supportClasses.SkinnableComponent;
	
	public class AppViewCB extends SkinnableComponent
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[SkinPart(require="true")]
		public var bx_content:ContentBoxCB;
		
		[SkinPart(require="true")]
		public var bx_settings:SettingsBoxCB;
	}
}