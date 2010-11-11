package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.ChoiceVO;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class ContentBoxCB extends SkinnableComponent
	{
		[SkinState("question")]
		[SkinState("result")]
		
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
		
		public function restart():void
		{
			var e:AppEvent = new AppEvent(AppEvent.RESTART);
			
			dispatcher(e);
		}
	}
}