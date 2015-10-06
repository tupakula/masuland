# Additional Apache Flex 3 Coding Conventions #



This document proposes additional Flex 3 coding conventions to the existing Flex coding conventions provided by Adobe, see http://sourceforge.net/adobe/flexsdk/wiki/Coding%20Conventions/.

## MXML File Conventions ##

- For indentation always use tabs<br />
- When using string notation in `<mx:Script/>` tag always use single quotes, e.g. 'Hallo String'<br />
- Use a consistent MXML node order:
  1. `<mx:Metadata/>`
  1. `<mx:State/>`
  1. `<mx:Transition/>`
  1. `<mx:Script/>`
    1. Constants
    1. Properties
    1. Constructor
    1. Getter / Setter
    1. Methods
    1. Handler
  1. `<mx:Effect/>`
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
        <mx:VBox
                xmlns:mx="http://www.adobe.com/2006/mxml"  // Name spaces
                id="bx_myBox"  // Component id
                x="0" y="0"  // Layout information
                width="100%" height="100%"
                backgroundAlpha="0.5"  // Style information
                backgroundColor="#FF00FF"
                styleName="myBoxStyle"
                showEffect="{ fx_fadeIn }"  // Effects
                click="bx_myBox_clickHandler(event)"  // Events
                >
                <mx:Repeater
                        id="rp_myRepeater"  // Component Id
                        dataProvider="{ model.repeaterData }"  // Component values
                        >
                        <mx:Image
                                source="{ PersonVO( rp_myRepeater.currentItem ).profileImage }"
                                />
                </mx:Repeater>
        </mx:VBox>
        
        <mx:List
                id="li_myList"  // Component Id
                width="100%" height="100%"  // Layout information
                dataProvider="{ model.listData }"  // Component values
                columnCount="1"
                rowCount="2"
                useRollOver="false"
                variableRowHeight="true"
                horizontalScrollPolicy="off"
                verticalScrollPolicy="off"
                borderStyle="none"  // Style information
                selectionColor="#FFFFFF"
                styleName="myListStyle"
                hideEffect="{ fx_fadeOut }"  // Effects
                dragStart="li_myList_dragStartHandler(event)"  // Events
                />
```

- Dependent on the number of attributes and embedded MXML nodes inside one MXML node use the following convention:

```
        <mx:TextInput />

        <mx:TextInput
                text="{ model.selectedUser.firstname }"
                />

        <mx:TextInput>
                <mx:text>{ model.selectedUser.firstname }</mx:text>
        </mx:TextInput>

        <mx:TextInput
                width="100%"
                >
                <mx:text>{ model.selectedUser.firstname }</mx:text>
        </mx:TextInput>
```


- Use a consistent naming convention for id attributes in MXML nodes extending UIComponent:

```
        <mx:Text
                id="txt_myText"
                />
        <mx:TextInput
                id="tip_myTextInput"
                />
        <mx:TextArea
                id="ta_myTextArea"
                />
        <mx:CheckBox
                id="cb_myCheckBox"
                />
        <mx:ComboBox
                id="cbb_myComboBox"
                />
        <mx:Button
                id="btn_myButton"
                />
```

| **Prefix** | **Flex 3 SDK Component (Control)** |
|:-----------|:-----------------------------------|
| `btn_`     | Button, LinkButton                 |
| `cb_`      | CheckBox                           |
| `cp_`      | ColorPicker                        |
| `cbb_`     | ComboBox                           |
| `dg_`      | DataGrid, AdvancedDataGrid, !OLAPDataGrid |
| `dc_`      | DateChooser                        |
| `df_`      | DateField                          |
| `li_`      | List, HorizontalList, TileList     |
| `sl_`      | HSlider, VSlider                   |
| `img_`     | Image                              |
| `nst_`     | NumericStepper                     |
| `pbtn_`    | PopupButton                        |
| `pmbtn`    | PopupMenuButton                    |
| `pb_`      | ProgressBar                        |
| `rb_`      | RadioButton                        |
| `rbg_`     | RadioButtonGroup                   |
| `rte_`     | RichTextEditor                     |
| `sl_`      | SWFLoader                          |
| `ta_`      | TextArea                           |
| `txt_`     | Text, Label                        |
| `tip_`     | TextInput                          |
| `tr_`      | Tree                               |
| `vd_`      | VideoDisplay                       |
| ...        | ...                                |

| **Prefix** | **Flex 3 SDK Component (Layout)** |
|:-----------|:----------------------------------|
| `bx_`      | Box, HBox, VBox, Canvas           |
| `ctlb_`    | ControlBar, ApplicationControlBar |
| `f_`       | Form                              |
| `fh_`      | FormHeading                       |
| `gr_`      | Grid                              |
| `dbx_`     | HDividedBox, VDividedBox          |
| `rl_`      | HRule, VRule                      |
| `ml_`      | ModuleLoader                      |
| `pn_`      | Panel                             |
| `sp_`      | Spacer                            |
| `tl_`      | Tile                              |
| `tlw_`     | TileWindow                        |
| ...        | ...                               |

## Actionscript File Conventions ##

- For indentation always use tabs<br />
- When using string notation always use single quotes, e.g. 'Hallo String'<br />
- Use a consistent AS layout:
  1. Constants
  1. Properties
  1. Constructor
  1. Getter / Setter
  1. Methods
  1. Handler

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

## CSS File Conventions ##

- For indentation always use tabs<br />

```
global
{
	theme-color: #319B6B;
	color: #435544;
}

AppStack
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

...

# Feedback #

Please feel free to post comments, suggestions or feature requests because this page is still work in progress.