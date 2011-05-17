package com.masuland.religionchooser.view.component
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

	/**
	 * @author masuland.com
	 */
	public class ChoiceButton extends Button
	{
		//----------------------
		// Properties
		//----------------------
		
		[Dispatcher]
		public var dispatcher:IEventDispatcher;
		
		[Inject(source='appModel.currentLayout', bind='true')]
		[Bindable]
		public var currentLayout:LayoutVO;
		
		private var _currentLocale:LocaleVO;

		private var _choice:ChoiceVO;
		
		//----------------------
		// Constructor
		//----------------------
		
		public function ChoiceButton()
		{
			SwizManager.setUp(this);

			buttonMode = true;
			useHandCursor = true;
			mouseChildren = false;

			addEventListener(MouseEvent.CLICK, this_clickHandler);
		}

		//----------------------
		// Getter / Setter
		//----------------------
		
		public function get currentLocale():LocaleVO
		{
			return _currentLocale;
		}
		
		[Inject(source='appModel.currentLocale', bind='true')]
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
		
		public function this_clickHandler(event:MouseEvent):void
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
