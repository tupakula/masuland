package com.masuland.religionchooser.view.component
{
	import spark.components.supportClasses.SkinnableComponent;
	
	public class AppViewCB extends SkinnableComponent
	{
		[SkinPart(require="true")]
		public var bx_content:ContentBoxCB;
		
		[SkinPart(require="true")]
		public var bx_settings:SettingsBoxCB;
	}
}