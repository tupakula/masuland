package com.masuland.religionchooser.view.component
{
	import com.masuland.religionchooser.action.event.AppEvent;
	import com.masuland.religionchooser.data.vo.LayoutVO;
	import com.masuland.religionchooser.data.vo.LocaleVO;
	import com.masuland.religionchooser.data.vo.QuestionVO;
	import com.masuland.religionchooser.data.vo.ResultVO;
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	[SkinState("question")]
	[SkinState("result")]
	public class ContentBoxCP extends SkinnableComponent
	{
		[Autowired(name='appModel', property='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;

		[Autowired(name='appModel', property='currentLocale')]
		[Bindable]
		public var currentLocale:LocaleVO;

		[Autowired(name='appModel', property='selectedQuestion')]
		[Bindable]
		public var selectedQuestion:QuestionVO;

		[Autowired(name='appModel', property='selectedResult')]
		[Bindable]
		public var selectedResult:ResultVO;

		[Autowired(name='appModel', property='appViewState')]
		[Bindable]
		public var appViewState:String;
		
		public function restart():void
		{
			var e:AppEvent = new AppEvent(AppEvent.RESTART);
			
			EventBus.dispatchEvent(e);
		}
	}
}