package com.masuland.religionchooser.view.component
{
	import spark.components.supportClasses.SkinnableComponent;
	
	/**
	 * @author masuland.com
	 */
	public class AppViewCP extends SkinnableComponent
	{
		//----------------------
		// Skin Parts
		//----------------------
		
		[SkinPart(require='true')]
		public var bx_content:ContentBoxCP;
		
		[SkinPart(require='true')]
		public var bx_settings:SettingsBoxCP;
		
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope='appModel', objectId='isApplicationVisible')]
		[Bindable]
		public var isApplicationVisible:Boolean;
	}
}
