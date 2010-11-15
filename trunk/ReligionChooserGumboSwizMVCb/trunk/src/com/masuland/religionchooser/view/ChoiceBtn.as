package com.masuland.religionchooser.view
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.ChoiceVO;
	import com.masuland.religionchooser.vo.LangVO;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import org.swizframework.core.SwizManager;
	
	import spark.components.Button;

	public class ChoiceBtn extends Button
	{
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject(source="appModel.currentLayout", bind="true")]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		[Inject(source="appModel.currentLocale", bind="true")]
		[Bindable]
		public var currentLocale:LocaleVO;

		private var _choice:ChoiceVO;
		
		public function ChoiceBtn()
		{
			SwizManager.setUp(this);
			
			addEventListener(MouseEvent.CLICK, handleMouseClick);
		}

		public function get choice():ChoiceVO
		{
			return _choice;
		}

		public function set choice(value:ChoiceVO):void
		{
			_choice = value;
			
			var localeIndex:int = currentLayout.localeVO.getItemIndex(currentLocale);
			var langVO:LangVO = LangVO( _choice.langVO.getItemAt(localeIndex) );
			
			label = langVO.value;
		}
		
		public function handleMouseClick(event:MouseEvent):void
		{
			var e:AppEvent;
			
			if (_choice.questionVO)
			{
				e = new AppEvent(AppEvent.CHANGE_SELECTED_QUESTION);
				e.question = _choice.questionVO;
			}
			else
			{
				e = new AppEvent(AppEvent.SHOW_RESULT);
				e.result = _choice.resultVO;
			}
			
			dispatcher.dispatchEvent(e);
		}
	}
}