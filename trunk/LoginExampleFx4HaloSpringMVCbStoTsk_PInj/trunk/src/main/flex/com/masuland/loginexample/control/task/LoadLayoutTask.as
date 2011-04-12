package com.masuland.loginexample.control.task
{
	import com.adobe.cairngorm.task.Task;
	import com.masuland.loginexample.model.AppModel;
	import com.masuland.loginexample.vo.LayoutVO;
	import com.masuland.loginexample.vo.LocaleVO;
	import com.masuland.loginexample.vo.StyleVO;

	public class LoadLayoutTask extends Task
	{
		//----------------------
		// Properties
		//----------------------
		
		[Inject]
		public var appModel:AppModel;
		
		public var layout:LayoutVO;
		
		//----------------------
		// Methods
		//----------------------
		
		override protected function performTask():void
		{
			if (layout == null)
			{
				fault('Error in LoadLayoutTask: No LayoutVO found to perform the Task');
			}
			else
			{
				appModel.currentLayout = layout;
				
				appModel.currentStyle = StyleVO( appModel.currentLayout.styles.getItemAt(0) );
				appModel.currentLocale = LocaleVO( appModel.currentLayout.locales.getItemAt(0) );
				
				complete();
			}
		}
	}
}