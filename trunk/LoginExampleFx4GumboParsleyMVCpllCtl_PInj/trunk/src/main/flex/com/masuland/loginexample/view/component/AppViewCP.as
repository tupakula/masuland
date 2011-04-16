package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.data.vo.LayoutVO;
	
	import spark.components.supportClasses.SkinnableComponent;

	public class AppViewCP extends SkinnableComponent
	{
		//----------------------
		// Properties
		//----------------------
		
		[Subscribe(scope='appModel', objectId='isApplicationVisible')]
		[Bindable]
		public var isApplicationVisible:Boolean;
	}
}