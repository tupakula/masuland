
/**
 * This is a generated class and is not intended for modification.  
 */
package com.masuland.religionchooser.data.vo
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.masuland.religionchooser.data.vo.LocaleVO;
import com.masuland.religionchooser.data.vo.StyleVO;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _LayoutVOEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("name", "width", "height", "stateName", "styleVO", "localeVO");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("name", "width", "height", "stateName", "styleVO", "localeVO");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("name", "width", "height", "stateName", "styleVO", "localeVO");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("name", "width", "height", "stateName", "styleVO", "localeVO");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array("styleVO", "localeVO");
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "LayoutVO";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _nameIsValid:Boolean;
    model_internal var _nameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _nameIsValidCacheInitialized:Boolean = false;
    model_internal var _nameValidationFailureMessages:Array;
    
    model_internal var _widthIsValid:Boolean;
    model_internal var _widthValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _widthIsValidCacheInitialized:Boolean = false;
    model_internal var _widthValidationFailureMessages:Array;
    
    model_internal var _heightIsValid:Boolean;
    model_internal var _heightValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _heightIsValidCacheInitialized:Boolean = false;
    model_internal var _heightValidationFailureMessages:Array;
    
    model_internal var _stateNameIsValid:Boolean;
    model_internal var _stateNameValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _stateNameIsValidCacheInitialized:Boolean = false;
    model_internal var _stateNameValidationFailureMessages:Array;
    
    model_internal var _styleVOIsValid:Boolean;
    model_internal var _styleVOValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _styleVOIsValidCacheInitialized:Boolean = false;
    model_internal var _styleVOValidationFailureMessages:Array;
    
    model_internal var _localeVOIsValid:Boolean;
    model_internal var _localeVOValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _localeVOIsValidCacheInitialized:Boolean = false;
    model_internal var _localeVOValidationFailureMessages:Array;

    model_internal var _instance:_Super_LayoutVO;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _LayoutVOEntityMetadata(value : _Super_LayoutVO)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["name"] = new Array();
            model_internal::dependentsOnMap["width"] = new Array();
            model_internal::dependentsOnMap["height"] = new Array();
            model_internal::dependentsOnMap["stateName"] = new Array();
            model_internal::dependentsOnMap["styleVO"] = new Array();
            model_internal::dependentsOnMap["localeVO"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
            model_internal::collectionBaseMap["styleVO"] = "com.masuland.religionchooser.data.vo.StyleVO";
            model_internal::collectionBaseMap["localeVO"] = "com.masuland.religionchooser.data.vo.LocaleVO";
        }

        model_internal::_instance = value;
        model_internal::_nameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForName);
        model_internal::_nameValidator.required = true;
        model_internal::_nameValidator.requiredFieldError = "name is required";
        //model_internal::_nameValidator.source = model_internal::_instance;
        //model_internal::_nameValidator.property = "name";
        model_internal::_widthValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForWidth);
        model_internal::_widthValidator.required = true;
        model_internal::_widthValidator.requiredFieldError = "width is required";
        //model_internal::_widthValidator.source = model_internal::_instance;
        //model_internal::_widthValidator.property = "width";
        model_internal::_heightValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForHeight);
        model_internal::_heightValidator.required = true;
        model_internal::_heightValidator.requiredFieldError = "height is required";
        //model_internal::_heightValidator.source = model_internal::_instance;
        //model_internal::_heightValidator.property = "height";
        model_internal::_stateNameValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForStateName);
        model_internal::_stateNameValidator.required = true;
        model_internal::_stateNameValidator.requiredFieldError = "stateName is required";
        //model_internal::_stateNameValidator.source = model_internal::_instance;
        //model_internal::_stateNameValidator.property = "stateName";
        model_internal::_styleVOValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForStyleVO);
        model_internal::_styleVOValidator.required = true;
        model_internal::_styleVOValidator.requiredFieldError = "styleVO is required";
        //model_internal::_styleVOValidator.source = model_internal::_instance;
        //model_internal::_styleVOValidator.property = "styleVO";
        model_internal::_localeVOValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLocaleVO);
        model_internal::_localeVOValidator.required = true;
        model_internal::_localeVOValidator.requiredFieldError = "localeVO is required";
        //model_internal::_localeVOValidator.source = model_internal::_instance;
        //model_internal::_localeVOValidator.property = "localeVO";
    }

    override public function getEntityName():String
    {
        return model_internal::entityName;
    }

    override public function getProperties():Array
    {
        return model_internal::allProperties;
    }

    override public function getAssociationProperties():Array
    {
        return model_internal::allAssociationProperties;
    }

    override public function getRequiredProperties():Array
    {
         return model_internal::allRequiredProperties;   
    }

    override public function getDataProperties():Array
    {
        return model_internal::dataProperties;
    }

    override public function getGuardedProperties():Array
    {
        return model_internal::guardedProperties;
    }

    override public function getUnguardedProperties():Array
    {
        return model_internal::allAlwaysAvailableProperties;
    }

    override public function getDependants(propertyName:String):Array
    {
       if (model_internal::dataProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a data property of entity LayoutVO");  
            
       return model_internal::dependentsOnMap[propertyName] as Array;  
    }

    override public function getDependedOnServices():Array
    {
        return model_internal::dependedOnServices;
    }

    override public function getCollectionProperties():Array
    {
        return model_internal::collectionProperties;
    }

    override public function getCollectionBase(propertyName:String):String
    {
        if (model_internal::collectionProperties.indexOf(propertyName) == -1)
            throw new Error(propertyName + " is not a collection property of entity LayoutVO");  

        return model_internal::collectionBaseMap[propertyName];
    }

    override public function getAvailableProperties():com.adobe.fiber.valueobjects.IPropertyIterator
    {
        return new com.adobe.fiber.valueobjects.AvailablePropertyIterator(this);
    }

    override public function getValue(propertyName:String):*
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity LayoutVO");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity LayoutVO");
        }

        model_internal::_instance[propertyName] = value;
    }

    override public function getMappedByProperty(associationProperty:String):String
    {
        switch(associationProperty)
        {
            default:
            {
                return null;
            }
        }
    }

    override public function getPropertyLength(propertyName:String):int
    {
        switch(propertyName)
        {
            default:
            {
                return 0;
            }
        }
    }

    override public function isAvailable(propertyName:String):Boolean
    {
        if (model_internal::allProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " does not exist for entity LayoutVO");
        }

        if (model_internal::allAlwaysAvailableProperties.indexOf(propertyName) != -1)
        {
            return true;
        }

        switch(propertyName)
        {
            default:
            {
                return true;
            }
        }
    }

    override public function getIdentityMap():Object
    {
        var returnMap:Object = new Object();

        return returnMap;
    }

    [Bindable(event="propertyChange")]
    override public function get invalidConstraints():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_invalidConstraints;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_invalidConstraints;        
        }
    }

    [Bindable(event="propertyChange")]
    override public function get validationFailureMessages():Array
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_validationFailureMessages;
        }
    }

    override public function getDependantInvalidConstraints(propertyName:String):Array
    {
        var dependants:Array = getDependants(propertyName);
        if (dependants.length == 0)
        {
            return emptyArray;
        }

        var currentlyInvalid:Array = invalidConstraints;
        if (currentlyInvalid.length == 0)
        {
            return emptyArray;
        }

        var filterFunc:Function = function(element:*, index:int, arr:Array):Boolean
        {
            return dependants.indexOf(element) > -1;
        }

        return currentlyInvalid.filter(filterFunc);
    }

    /**
     * isValid
     */
    [Bindable(event="propertyChange")] 
    public function get isValid() : Boolean
    {
        if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
        {
            return model_internal::_instance.model_internal::_isValid;
        }
        else
        {
            // recalculate isValid
            model_internal::_instance.model_internal::_isValid = model_internal::_instance.model_internal::calculateIsValid();
            return model_internal::_instance.model_internal::_isValid;
        }
    }

    [Bindable(event="propertyChange")]
    public function get isNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isWidthAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isHeightAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isStateNameAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isStyleVOAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isLocaleVOAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnName():void
    {
        if (model_internal::_nameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfName = null;
            model_internal::calculateNameIsValid();
        }
    }
    public function invalidateDependentOnWidth():void
    {
        if (model_internal::_widthIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfWidth = null;
            model_internal::calculateWidthIsValid();
        }
    }
    public function invalidateDependentOnHeight():void
    {
        if (model_internal::_heightIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfHeight = null;
            model_internal::calculateHeightIsValid();
        }
    }
    public function invalidateDependentOnStateName():void
    {
        if (model_internal::_stateNameIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfStateName = null;
            model_internal::calculateStateNameIsValid();
        }
    }
    public function invalidateDependentOnStyleVO():void
    {
        if (model_internal::_styleVOIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfStyleVO = null;
            model_internal::calculateStyleVOIsValid();
        }
    }
    public function invalidateDependentOnLocaleVO():void
    {
        if (model_internal::_localeVOIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLocaleVO = null;
            model_internal::calculateLocaleVOIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get nameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get nameValidator() : StyleValidator
    {
        return model_internal::_nameValidator;
    }

    model_internal function set _nameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_nameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_nameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "nameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get nameIsValid():Boolean
    {
        if (!model_internal::_nameIsValidCacheInitialized)
        {
            model_internal::calculateNameIsValid();
        }

        return model_internal::_nameIsValid;
    }

    model_internal function calculateNameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_nameValidator.validate(model_internal::_instance.name)
        model_internal::_nameIsValid_der = (valRes.results == null);
        model_internal::_nameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::nameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::nameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get nameValidationFailureMessages():Array
    {
        if (model_internal::_nameValidationFailureMessages == null)
            model_internal::calculateNameIsValid();

        return _nameValidationFailureMessages;
    }

    model_internal function set nameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_nameValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_nameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "nameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get widthStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get widthValidator() : StyleValidator
    {
        return model_internal::_widthValidator;
    }

    model_internal function set _widthIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_widthIsValid;         
        if (oldValue !== value)
        {
            model_internal::_widthIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "widthIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get widthIsValid():Boolean
    {
        if (!model_internal::_widthIsValidCacheInitialized)
        {
            model_internal::calculateWidthIsValid();
        }

        return model_internal::_widthIsValid;
    }

    model_internal function calculateWidthIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_widthValidator.validate(model_internal::_instance.width)
        model_internal::_widthIsValid_der = (valRes.results == null);
        model_internal::_widthIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::widthValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::widthValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get widthValidationFailureMessages():Array
    {
        if (model_internal::_widthValidationFailureMessages == null)
            model_internal::calculateWidthIsValid();

        return _widthValidationFailureMessages;
    }

    model_internal function set widthValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_widthValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_widthValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "widthValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get heightStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get heightValidator() : StyleValidator
    {
        return model_internal::_heightValidator;
    }

    model_internal function set _heightIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_heightIsValid;         
        if (oldValue !== value)
        {
            model_internal::_heightIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "heightIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get heightIsValid():Boolean
    {
        if (!model_internal::_heightIsValidCacheInitialized)
        {
            model_internal::calculateHeightIsValid();
        }

        return model_internal::_heightIsValid;
    }

    model_internal function calculateHeightIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_heightValidator.validate(model_internal::_instance.height)
        model_internal::_heightIsValid_der = (valRes.results == null);
        model_internal::_heightIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::heightValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::heightValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get heightValidationFailureMessages():Array
    {
        if (model_internal::_heightValidationFailureMessages == null)
            model_internal::calculateHeightIsValid();

        return _heightValidationFailureMessages;
    }

    model_internal function set heightValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_heightValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_heightValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "heightValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get stateNameStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get stateNameValidator() : StyleValidator
    {
        return model_internal::_stateNameValidator;
    }

    model_internal function set _stateNameIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_stateNameIsValid;         
        if (oldValue !== value)
        {
            model_internal::_stateNameIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stateNameIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get stateNameIsValid():Boolean
    {
        if (!model_internal::_stateNameIsValidCacheInitialized)
        {
            model_internal::calculateStateNameIsValid();
        }

        return model_internal::_stateNameIsValid;
    }

    model_internal function calculateStateNameIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_stateNameValidator.validate(model_internal::_instance.stateName)
        model_internal::_stateNameIsValid_der = (valRes.results == null);
        model_internal::_stateNameIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::stateNameValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::stateNameValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get stateNameValidationFailureMessages():Array
    {
        if (model_internal::_stateNameValidationFailureMessages == null)
            model_internal::calculateStateNameIsValid();

        return _stateNameValidationFailureMessages;
    }

    model_internal function set stateNameValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_stateNameValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_stateNameValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stateNameValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get styleVOStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get styleVOValidator() : StyleValidator
    {
        return model_internal::_styleVOValidator;
    }

    model_internal function set _styleVOIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_styleVOIsValid;         
        if (oldValue !== value)
        {
            model_internal::_styleVOIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "styleVOIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get styleVOIsValid():Boolean
    {
        if (!model_internal::_styleVOIsValidCacheInitialized)
        {
            model_internal::calculateStyleVOIsValid();
        }

        return model_internal::_styleVOIsValid;
    }

    model_internal function calculateStyleVOIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_styleVOValidator.validate(model_internal::_instance.styleVO)
        model_internal::_styleVOIsValid_der = (valRes.results == null);
        model_internal::_styleVOIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::styleVOValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::styleVOValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get styleVOValidationFailureMessages():Array
    {
        if (model_internal::_styleVOValidationFailureMessages == null)
            model_internal::calculateStyleVOIsValid();

        return _styleVOValidationFailureMessages;
    }

    model_internal function set styleVOValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_styleVOValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_styleVOValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "styleVOValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get localeVOStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get localeVOValidator() : StyleValidator
    {
        return model_internal::_localeVOValidator;
    }

    model_internal function set _localeVOIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_localeVOIsValid;         
        if (oldValue !== value)
        {
            model_internal::_localeVOIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "localeVOIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get localeVOIsValid():Boolean
    {
        if (!model_internal::_localeVOIsValidCacheInitialized)
        {
            model_internal::calculateLocaleVOIsValid();
        }

        return model_internal::_localeVOIsValid;
    }

    model_internal function calculateLocaleVOIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_localeVOValidator.validate(model_internal::_instance.localeVO)
        model_internal::_localeVOIsValid_der = (valRes.results == null);
        model_internal::_localeVOIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::localeVOValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::localeVOValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get localeVOValidationFailureMessages():Array
    {
        if (model_internal::_localeVOValidationFailureMessages == null)
            model_internal::calculateLocaleVOIsValid();

        return _localeVOValidationFailureMessages;
    }

    model_internal function set localeVOValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_localeVOValidationFailureMessages;

        var needUpdate : Boolean = false;
        if (oldValue == null)
            needUpdate = true;
    
        // avoid firing the event when old and new value are different empty arrays
        if (!needUpdate && (oldValue !== value && (oldValue.length > 0 || value.length > 0)))
        {
            if (oldValue.length == value.length)
            {
                for (var a:int=0; a < oldValue.length; a++)
                {
                    if (oldValue[a] !== value[a])
                    {
                        needUpdate = true;
                        break;
                    }
                }
            }
            else
            {
                needUpdate = true;
            }
        }

        if (needUpdate)
        {
            model_internal::_localeVOValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "localeVOValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }


     /**
     * 
     * @inheritDoc 
     */ 
     override public function getStyle(propertyName:String):com.adobe.fiber.styles.IStyle
     {
         switch(propertyName)
         {
            default:
            {
                return null;
            }
         }
     }
     
     /**
     * 
     * @inheritDoc 
     *  
     */  
     override public function getPropertyValidationFailureMessages(propertyName:String):Array
     {
         switch(propertyName)
         {
            case("name"):
            {
                return nameValidationFailureMessages;
            }
            case("width"):
            {
                return widthValidationFailureMessages;
            }
            case("height"):
            {
                return heightValidationFailureMessages;
            }
            case("stateName"):
            {
                return stateNameValidationFailureMessages;
            }
            case("styleVO"):
            {
                return styleVOValidationFailureMessages;
            }
            case("localeVO"):
            {
                return localeVOValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
