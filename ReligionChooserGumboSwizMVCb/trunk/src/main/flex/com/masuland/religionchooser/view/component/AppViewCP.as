package com.masuland.religionchooser.view.component
{
	import flash.events.IEventDispatcher;
	
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
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject(source='appModel.isApplicationVisible', bind='true')]
		[Bindable]
		public var isApplicationVisible:Boolean;
	}
}
