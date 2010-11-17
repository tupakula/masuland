package com.masuland.religionchooser.view.component
{
	import com.masuland.religionchooser.event.AppEvent;
	import com.masuland.religionchooser.vo.ChoiceVO;
	import com.masuland.religionchooser.vo.LangVO;
	import com.masuland.religionchooser.vo.LayoutVO;
	import com.masuland.religionchooser.vo.LocaleVO;
	
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import org.springextensions.actionscript.core.event.EventBus;
	
	import spark.components.Button;

	public class ChoiceBtn extends Button
	{
		[Autowired(name='appModel', property='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		private var _currentLocale:LocaleVO;

		private var _choice:ChoiceVO;
		
		public function ChoiceBtn()
		{
			buttonMode = true;
			useHandCursor = true;
			mouseChildren = false;

			addEventListener(MouseEvent.CLICK, handleMouseClick);
		}

		public function get currentLocale():LocaleVO
		{
			return _currentLocale;
		}
		
		[Autowired(name='appModel', property='currentLocale')]
		[Bindable]
		public function set currentLocale(value:LocaleVO):void
		{
			_currentLocale = value;
			
			updateChoiceLabel();
		}
		
		public function get choice():ChoiceVO
		{
			return _choice;
		}

		public function set choice(value:ChoiceVO):void
		{
			_choice = value;
			
			updateChoiceLabel();
		}
		
		protected function updateChoiceLabel():void
		{
			if (_choice && currentLayout && currentLocale)
			{
				var localeIndex:int = currentLayout.localeVO.getItemIndex(currentLocale);
				var langVO:LangVO = LangVO( _choice.langVO.getItemAt(localeIndex) );
				
				label = langVO.value;
			}
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
			
			EventBus.dispatchEvent(e);
		}
	}
}