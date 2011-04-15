package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.vo.LayoutVO;
	
	import spark.components.supportClasses.SkinnableComponent;

	public class AppViewCP extends SkinnableComponent
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject(name='appModel', property='isApplicationVisible')]
		[Bindable]
		public var isApplicationVisible:Boolean;
	}
}