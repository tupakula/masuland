package com.masuland.religionchooser.view.component
{
	import com.masuland.religionchooser.action.event.AppEvent;
	import com.masuland.religionchooser.data.vo.LayoutVO;
	import com.masuland.religionchooser.data.vo.LocaleVO;
	import com.masuland.religionchooser.data.vo.QuestionVO;
	import com.masuland.religionchooser.data.vo.ResultVO;
	
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
		
		[MessageDispatcher]
		public var dispatcher:Function;

		[Subscribe(scope='appModel', objectId='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;

		[Subscribe(scope='appModel', objectId='currentLocale')]
		[Bindable]
		public var currentLocale:LocaleVO;

		[Subscribe(scope='appModel', objectId='selectedQuestion')]
		[Bindable]
		public var selectedQuestion:QuestionVO;

		[Subscribe(scope='appModel', objectId='selectedResult')]
		[Bindable]
		public var selectedResult:ResultVO;

		[Subscribe(scope='appModel', objectId='appViewState')]
		[Bindable]
		public var appViewState:String;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function ContentBoxCP()
		{
			addEventListener(Event.ADDED_TO_STAGE, function():void
			{
				dispatchEvent(new Event('configureIOC', true));
			});
		}
		
		//----------------------
		// Methods
		//----------------------
		
		public function restart():void
		{
			var e:AppEvent = new AppEvent(AppEvent.RESTART);
			
			dispatcher(e);
		}
	}
}
