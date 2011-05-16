package com.masuland.religionchooser.view.component
{
	import com.masuland.religionchooser.action.event.AppEvent;
	import com.masuland.religionchooser.data.vo.ChoiceVO;
	import com.masuland.religionchooser.data.vo.LangVO;
	import com.masuland.religionchooser.data.vo.LayoutVO;
	import com.masuland.religionchooser.data.vo.LocaleVO;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import spark.components.Button;

	/**
	 * @author masuland.com
	 */
	public class ChoiceButton extends Button
	{
		//----------------------
		// Properties
		//----------------------
		
		[MessageDispatcher]
		public var dispatcher:Function;
		
		[Subscribe(scope='appModel', objectId='currentLayout')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		private var _currentLocale:LocaleVO;

		private var _choice:ChoiceVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function ChoiceButton()
		{
			addEventListener(Event.ADDED_TO_STAGE, function():void
			{
				dispatchEvent(new Event('configureIOC', true));
			});

			buttonMode = true;
			useHandCursor = true;
			mouseChildren = false;

			addEventListener(MouseEvent.CLICK, this_mouseClickHandler);
		}

		//----------------------
		// Getter / Setter
		//----------------------
		
		[Subscribe(scope='appModel', objectId='currentLocale')]
		[Bindable]
		public function get currentLocale():LocaleVO
		{
			return _currentLocale;
		}
		
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
		
		//----------------------
		// Methods
		//----------------------
		
		protected function updateChoiceLabel():void
		{
			if (_choice && currentLayout && currentLocale)
			{
				var localeIndex:int = currentLayout.localeVO.getItemIndex(currentLocale);
				var langVO:LangVO = LangVO( _choice.langVO.getItemAt(localeIndex) );
				
				label = langVO.value;
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function this_mouseClickHandler(event:MouseEvent):void
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
			
			dispatcher(e);
		}
	}
}
