package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.ChoiceVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	import com.masuland.religionchooser.vo.QuestionVO;
	import com.masuland.religionchooser.vo.ResultVO;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class ChoiceRendererCB extends SkinnableComponent
	{
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Subscribe(objectId="selectedLocale")]
		[Bindable]
		public var selectedLocale:LocaleVO;
		
		public function showNext(choice:ChoiceVO):void
		{
			var e:AppEvent;
			
			if (choice.questionVO)
			{
				e = new AppEvent(AppEvent.CHANGE_SELECTED_QUESTION);
				e.question = choice.questionVO;
			}
			else
			{
				e = new AppEvent(AppEvent.SHOW_RESULT);
				e.result = choice.resultVO;
			}
			
			dispatcher(e);
		}
	}
}