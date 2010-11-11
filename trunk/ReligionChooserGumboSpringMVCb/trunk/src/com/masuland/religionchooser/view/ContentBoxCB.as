package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class ContentBoxCB extends SkinnableComponent
	{
		[SkinState("question")]
		[SkinState("result")]

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