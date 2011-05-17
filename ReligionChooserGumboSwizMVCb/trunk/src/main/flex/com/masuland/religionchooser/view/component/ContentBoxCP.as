package com.masuland.religionchooser.view.component
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import flash.events.IEventDispatcher;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	[SkinState('question')]
	[SkinState('result')]
	/**
	 * @author masuland.com
	 */
	public class ContentBoxCP extends SkinnableComponent
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;

		[Inject(source='appModel.currentLayout', bind='true')]
		[Bindable]
		public var currentLayout:LayoutVO;

		[Inject(source='appModel.currentLocale', bind='true')]
		[Bindable]
		public var currentLocale:LocaleVO;

		[Inject(source='appModel.selectedQuestion', bind='true')]
		[Bindable]
		public var selectedQuestion:QuestionVO;

		[Inject(source='appModel.selectedResult', bind='true')]
		[Bindable]
		public var selectedResult:ResultVO;

		[Inject(source='appModel.appViewState', bind='true')]
		[Bindable]
		public var appViewState:String;
		
		//----------------------
		// Methods
		//----------------------
		
		public function restart():void
		{
			var e:AppEvent = new AppEvent(AppEvent.RESTART);
			
			dispatcher.dispatchEvent(e);
		}
	}
}
