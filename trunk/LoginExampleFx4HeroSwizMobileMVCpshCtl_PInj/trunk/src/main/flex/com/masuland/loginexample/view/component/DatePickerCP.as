package com.masuland.loginexample.view.component
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.managers.PopUpManager;
	
	import spark.components.Button;
	import spark.components.Label;
	import spark.components.supportClasses.SkinnableComponent;

	[Event(name='newDateSet', type='flash.events.Event')]
	public class DatePickerCP extends SkinnableComponent
	{
		//----------------------
		// Skin Parts
		//----------------------
		
		[SkinPart(required='true')]
		public var txt_dateSummary:Label;

		[SkinPart(required='true')]
		public var txt_day:Label;

		[SkinPart(required='true')]
		public var txt_month:Label;

		[SkinPart(required='true')]
		public var txt_year:Label;

		[SkinPart(required='true')]
		public var btn_increaseDay:Button;
		
		[SkinPart(required='true')]
		public var btn_increaseMonth:Button;
		
		[SkinPart(required='true')]
		public var btn_increaseYear:Button;
		
		[SkinPart(required='true')]
		public var btn_decreaseDay:Button;
		
		[SkinPart(required='true')]
		public var btn_decreaseMonth:Button;
		
		[SkinPart(required='true')]
		public var btn_decreaseYear:Button;
		
		[SkinPart(required='true')]
		public var btn_set:Button;

		[SkinPart(required='true')]
		public var btn_cancel:Button;

		//----------------------
		// Properties
		//----------------------
		
		private var _currentDate:Date;
		private var _tempDate:Date;
		private var _isCurrentDateDirty:Boolean;
		
		//----------------------
		// Getter / Setter
		//----------------------

		public function get currentDate():Date
		{
			return _currentDate;
		}

		public function set currentDate(value:Date):void
		{
			if (value != null)
			{
				_currentDate = value;
				_tempDate = new Date(_currentDate.fullYear, _currentDate.month, _currentDate.date);
				
				_isCurrentDateDirty = true;
				invalidateProperties();
			}
		}
		
		//----------------------
		// Methods
		//----------------------
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			var date:Date = new Date();
			
			// Set to 20 years back
			date.fullYear -= 20;
			
			currentDate = date;
		}
		
		override protected function partAdded(partName:String, instance:Object):void 
		{
			super.partAdded(partName, instance);
			
			if (instance == btn_increaseDay) 
			{
				btn_increaseDay.addEventListener(MouseEvent.CLICK, btn_increaseDay_clickHandler);
			}
			if (instance == btn_increaseMonth) 
			{
				btn_increaseMonth.addEventListener(MouseEvent.CLICK, btn_increaseMonth_clickHandler);
			}
			if (instance == btn_increaseYear) 
			{
				btn_increaseYear.addEventListener(MouseEvent.CLICK, btn_increaseYear_clickHandler);
			}
			if (instance == btn_decreaseDay) 
			{
				btn_decreaseDay.addEventListener(MouseEvent.CLICK, btn_decreaseDay_clickHandler);
			}
			if (instance == btn_decreaseMonth) 
			{
				btn_decreaseMonth.addEventListener(MouseEvent.CLICK, btn_decreaseMonth_clickHandler);
			}
			if (instance == btn_decreaseYear) 
			{
				btn_decreaseYear.addEventListener(MouseEvent.CLICK, btn_decreaseYear_clickHandler);
			}
			if (instance == btn_set) 
			{
				btn_set.addEventListener(MouseEvent.CLICK, btn_set_clickHandler);
			}
			if (instance == btn_cancel) 
			{
				btn_cancel.addEventListener(MouseEvent.CLICK, btn_cancel_clickHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void 
		{
			super.partRemoved(partName, instance);
			
			if (instance == btn_increaseDay) 
			{
				btn_increaseDay.removeEventListener(MouseEvent.CLICK, btn_increaseDay_clickHandler);
			}
			if (instance == btn_increaseMonth) 
			{
				btn_increaseMonth.removeEventListener(MouseEvent.CLICK, btn_increaseMonth_clickHandler);
			}
			if (instance == btn_increaseYear) 
			{
				btn_increaseYear.removeEventListener(MouseEvent.CLICK, btn_increaseYear_clickHandler);
			}
			if (instance == btn_decreaseDay) 
			{
				btn_decreaseDay.removeEventListener(MouseEvent.CLICK, btn_decreaseDay_clickHandler);
			}
			if (instance == btn_decreaseMonth) 
			{
				btn_decreaseMonth.removeEventListener(MouseEvent.CLICK, btn_decreaseMonth_clickHandler);
			}
			if (instance == btn_decreaseYear) 
			{
				btn_decreaseYear.removeEventListener(MouseEvent.CLICK, btn_decreaseYear_clickHandler);
			}
			if (instance == btn_set) 
			{
				btn_set.removeEventListener(MouseEvent.CLICK, btn_set_clickHandler);
			}
			if (instance == btn_cancel) 
			{
				btn_cancel.removeEventListener(MouseEvent.CLICK, btn_cancel_clickHandler);
			}
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if (_isCurrentDateDirty)
			{
				txt_dateSummary.text = _tempDate.toDateString();
				txt_day.text = _tempDate.getDate().toString();
				txt_month.text = (_tempDate.getMonth() + 1).toString();
				txt_year.text = _tempDate.getFullYear().toString();
				
				_isCurrentDateDirty = false;
			}
		}
		
		//----------------------
		// Handler
		//----------------------
		
		protected function btn_increaseDay_clickHandler(event:MouseEvent):void
		{
			_tempDate.setDate(_tempDate.getDate() + 1);
			
			_isCurrentDateDirty = true;
			invalidateProperties();
		}
		
		protected function btn_increaseMonth_clickHandler(event:MouseEvent):void
		{
			_tempDate.setMonth(_tempDate.getMonth() + 1);
			
			_isCurrentDateDirty = true;
			invalidateProperties();
		}
		
		protected function btn_increaseYear_clickHandler(event:MouseEvent):void
		{
			_tempDate.setFullYear(_tempDate.getFullYear() + 1);
			
			_isCurrentDateDirty = true;
			invalidateProperties();
		}
		
		protected function btn_decreaseDay_clickHandler(event:MouseEvent):void
		{
			_tempDate.setDate(_tempDate.getDate() - 1);
			
			_isCurrentDateDirty = true;
			invalidateProperties();
		}
		
		protected function btn_decreaseMonth_clickHandler(event:MouseEvent):void
		{
			_tempDate.setMonth(_tempDate.getMonth() - 1);
			
			_isCurrentDateDirty = true;
			invalidateProperties();
		}
		
		protected function btn_decreaseYear_clickHandler(event:MouseEvent):void
		{
			_tempDate.setFullYear(_tempDate.getFullYear() - 1);
			
			_isCurrentDateDirty = true;
			invalidateProperties();
		}
		
		protected function btn_set_clickHandler(event:MouseEvent):void
		{
			_currentDate.setDate(_tempDate.date);
			_currentDate.setMonth(_tempDate.month);
			_currentDate.setFullYear(_tempDate.fullYear);
			
			PopUpManager.removePopUp(this);
			dispatchEvent(new Event('newDateSet'));
		}
		
		protected function btn_cancel_clickHandler(event:MouseEvent):void
		{
			PopUpManager.removePopUp(this);
		}
	}
}