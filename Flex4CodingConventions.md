# Additional Apache Flex 4 Coding Conventions #



This document proposes additional Flex 4 coding conventions to the existing Flex coding conventions provided by Adobe, see http://sourceforge.net/adobe/flexsdk/wiki/Coding%20Conventions/.

## MXML File Conventions ##

- For indentation always use tabs<br />
- When using string notation in `<fx:Script/>` tag always use single quotes, e.g. 'Hallo String'<br />
- Use a consistent MXML node order:
  1. `<fx:Metadata/>`
  1. `<s:State/>`
  1. `<s:Transition/>`
  1. `<fx:Script/>`
    1. Constants
    1. Properties
    1. Constructor
    1. Getter / Setter
    1. Methods
    1. Handler
  1. `<fx:Declarations/>`
  1. `<mx:UIComponent/>`

- Use a consistent attribute order inside MXML nodes:
  1. Name spaces
  1. Component Id
  1. Layout information
  1. Component values
  1. Style information
  1. Effects
  1. Events

```
	<s:BorderContainer
		xmlns:fx="http://ns.adobe.com/mxml/2009"  // Name spaces
		xmlns:s="library://ns.adobe.com/flex/spark"
		id="bx_myContainer"  // Component id
		x="0" y="0"  // Layout information
		width="100%" height="100%"
		backgroundAlpha="0.5"  // Style information
		backgroundColor="#FF00FF"
		styleName="myBoxStyle"
		showEffect="{ fx_fadeIn }"  // Effects
		click="bx_myContainer_clickHandler(event)"  // Events
		>
		<s:layout>
			<s:VerticalLayout />
		</s:layout>
		<s:DataGroup
			id="dg_myDataGroup"  // Component Id
			dataProvider="{ model.repeaterData }"  // Component values
			>
			<s:itemRenderer>
				<fx:Component>
					<s:ItemRenderer>
						<s:Image
							source="{ PersonVO( data ).profileImage }"
							/>
					</s:ItemRenderer>
				</fx:Component>
			</s:itemRenderer>
		</s:DataGroup>
	</s:BorderContainer>
	
	<s:List
		id="li_myList"  // Component Id
		width="100%" height="100%"  // Layout information
		dataProvider="{ model.listData }"  // Component values
		horizontalScrollPolicy="off"
		verticalScrollPolicy="off"
		selectionColor="#FFFFFF"  // Style information
		styleName="myListStyle"
		hideEffect="{ fx_fadeOut }"  // Effects
		dragStart="li_myList_dragStartHandler(event)"  // Events
		>
		<s:layout>
			<s:TileLayout
				requestedColumnCount="1"
				requestedRowCount="1"
				verticalGap="5"
				/>
		</s:layout>
	</s:List>
```

- Dependent on the number of attributes and embedded MXML nodes inside one MXML node use the following convention:

```
        <s:TextInput />

        <s:TextInput
                text="{ model.selectedUser.firstname }"
                />

        <s:TextInput>
                <s:text>{ model.selectedUser.firstname }</s:text>
        </s:TextInput>

        <s:TextInput
                width="100%"
                >
                <s:text>{ model.selectedUser.firstname }</s:text>
        </s:TextInput>
```


- Use a consistent naming convention for id attributes in MXML nodes extending UIComponent:

```
        <s:RichText
                id="txt_myRichText"
                />
        <s:TextInput
                id="tip_myTextInput"
                />
        <s:TextArea
                id="ta_myTextArea"
                />
        <s:CheckBox
                id="cb_myCheckBox"
                />
        <s:ComboBox
                id="cbb_myComboBox"
                />
        <s:Button
                id="btn_myButton"
                />
```

| **Prefix** | **Flex 4 SDK Component (Control)** |
|:-----------|:-----------------------------------|
| `btn_`     | Button                             |
| `cb_`      | CheckBox                           |
| `cbb_`     | ComboBox                           |
| `li_`      | List                               |
| `sl_`      | HSlider, VSlider                   |
| `img_`     | Image                              |
| `pb_`      | ProgressBar                        |
| `rb_`      | RadioButton                        |
| `rbg_`     | RadioButtonGroup                   |
| `sl_`      | SWFLoader                          |
| `ta_`      | TextArea                           |
| `txt_`     | Label, RichText, RichEditableText  |
| `tip_`     | TextInput                          |
| `vd_`      | VideoDisplay                       |
| ...        | ...                                |

| **Prefix** | **Flex 4 SDK Component (Layout)** |
|:-----------|:----------------------------------|
| `bx_`      | Group, HGroup, VGroup             |
| `f_`       | Form                              |
| `fh_`      | FormHeading                       |
| `fi_`      | FormItem                          |
| `ml_`      | ModuleLoader                      |
| `pn_`      | Panel                             |
| ...        | ...                               |

## Actionscript File Conventions ##

- For indentation always use tabs<br />
- When using string notation always use single quotes, e.g. 'Hallo String'<br />
- Use a consistent AS layout:
  1. Skin Parts
  1. Constants
  1. Properties
  1. Constructor
  1. Getter / Setter
  1. Methods
  1. Handler

Example for Value Object:

```
package com.masuland.loginexample.vo
{
	[Bindable]
	/**
	 * A single user
	 */
	public class UserVO
	{
		//----------------------
		// Properties
		//----------------------

		public var username:String;
		public var firstname:String;
		public var lastname:String;
		public var email:String;
		public var birthday:Date;

		//----------------------
		// Constructor
		//----------------------
		
		public function UserVO()
		{
			super();
		}

		//----------------------
		// Methods
		//----------------------

		public function toString():String
		{
			return firstname + ' ' + lastname;
		}
	}
}
```

Example for SkinnableComponent:

```
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
```

## CSS File Conventions ##

- For indentation always use tabs<br />

```
@namespace s "library://ns.adobe.com/flex/spark";
@namespace mx "library://ns.adobe.com/flex/mx";
@namespace view "com.masuland.loginexample.view.*";

s|global
{
	theme-color: #319B6B;
	color: #435544;
}

view|AppStack
{
	backgroundAlpha: 0.7;
	
	borderStyle: solid;
	borderThickness: 1;
	borderColor: #319B6B;
	backgroundColor: #DCECDC;
	
	cornerRadius: 10;
	
	dropShadowColor: #000000;
	dropShadowEnabled: true;
	shadowDirection: top;
	shadow-distance: 0;
}

.appTitle
{
	text-align: center;
	font-weight: bold;
	font-size: 15;
}
```

# Code Examples #

Code Examples which implement these Coding Conventions:

  * [Login Example](LoginExample.md) with Flex 3 and Flex 4 (Halo, Gumbo, Hero)
  * [Religion Chooser](ReligionChooser.md) with Flex 4 (Gumbo)

...

# Feedback #

Please feel free to post comments, suggestions or feature requests because this page is still work in progress.