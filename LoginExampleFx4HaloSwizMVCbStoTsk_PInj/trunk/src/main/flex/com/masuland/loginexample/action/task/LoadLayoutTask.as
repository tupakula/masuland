package com.masuland.loginexample.action.task
{
	import com.adobe.cairngorm.task.Task;
	import com.masuland.loginexample.data.AppModel;
	import com.masuland.loginexample.data.vo.LayoutVO;
	import com.masuland.loginexample.data.vo.LocaleVO;
	import com.masuland.loginexample.data.vo.StyleVO;

	/**
	 * @author masuland.com
	 */
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
