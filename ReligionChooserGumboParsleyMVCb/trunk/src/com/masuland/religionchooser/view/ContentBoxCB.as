package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	[SkinState("question")]
	[SkinState("result")]
	public class ContentBoxCB extends SkinnableComponent
	{
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(objectId="currentLayout")]
		[Bindable]
		public var currentLayout:LayoutVO;

		[Subscribe(objectId="currentLocale")]
		[Bindable]
		public var currentLocale:LocaleVO;

		[Subscribe(objectId="selectedQuestion")]
		[Bindable]
		public var selectedQuestion:QuestionVO;

		[Subscribe(objectId="selectedResult")]
		[Bindable]
		public var selectedResult:ResultVO;

		[Subscribe(objectId="appViewState")]
		[Bindable]
		public var appViewState:String;
		
		public function ContentBoxCB()
		{
			addEventListener(Event.ADDED_TO_STAGE, function():void
			{
				dispatchEvent(new Event('configureIOC', true));
			});
		}
		
		public function restart():void
		{
			var e:AppEvent = new AppEvent(AppEvent.RESTART);
			
			dispatcher(e);
		}
	}
}