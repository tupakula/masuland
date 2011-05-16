package com.masuland.religionchooser.view.component
{
	import spark.components.supportClasses.SkinnableComponent;
	
	public class AppViewCP extends SkinnableComponent
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[SkinPart(require="true")]
		public var bx_content:ContentBoxCP;
		
		[SkinPart(require="true")]
		public var bx_settings:SettingsBoxCP;
	}
}