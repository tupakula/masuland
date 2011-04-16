package com.masuland.loginexample.view.component
{
	import com.masuland.loginexample.data.vo.LayoutVO;
	
	import spark.components.supportClasses.SkinnableComponent;

	public class AppViewCP extends SkinnableComponent
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject(source='appModel.isApplicationVisible', bind='true')]
		[Bindable]
		public var isApplicationVisible:Boolean;
	}
}