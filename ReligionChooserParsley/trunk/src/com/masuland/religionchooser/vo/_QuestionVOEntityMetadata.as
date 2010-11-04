
/**
 * This is a generated class and is not intended for modification.  
 */
package com.masuland.religionchooser.vo
{
import com.adobe.fiber.styles.IStyle;
import com.adobe.fiber.styles.Style;
import com.adobe.fiber.styles.StyleValidator;
import com.adobe.fiber.valueobjects.AbstractEntityMetadata;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _QuestionVOEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("langs", "choices");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("langs", "choices");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("langs", "choices");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("langs", "choices");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array();
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "QuestionVO";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _langsIsValid:Boolean;
    model_internal var _langsValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _langsIsValidCacheInitialized:Boolean = false;
    model_internal var _langsValidationFailureMessages:Array;
    
    model_internal var _choicesIsValid:Boolean;
    model_internal var _choicesValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _choicesIsValidCacheInitialized:Boolean = false;
    model_internal var _choicesValidationFailureMessages:Array;

    model_internal var _instance:_Super_QuestionVO;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _QuestionVOEntityMetadata(value : _Super_QuestionVO)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["langs"] = new Array();
            model_internal::dependentsOnMap["choices"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
        }

        model_internal::_instance = value;
        model_internal::_langsValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLangs);
        model_internal::_langsValidator.required = true;
        model_internal::_langsValidator.requiredFieldError = "langs is required";
        //model_internal::_langsValidator.source = model_internal::_instance;
        //model_internal::_langsValidator.property = "langs";
        model_internal::_choicesValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForChoices);
        model_internal::_choicesValidator.required = true;
        model_internal::_choicesValidator.requiredFieldError = "choices is required";
        //model_internal::_choicesValidator.source = model_internal::_instance;
        //model_internal::_choicesValidator.property = "choices";
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
            throw new Error(propertyName + " is not a data property of entity QuestionVO");  
            
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
            throw new Error(propertyName + " is not a collection property of entity QuestionVO");  

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
            throw new Error(propertyName + " does not exist for entity QuestionVO");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity QuestionVO");
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
            throw new Error(propertyName + " does not exist for entity QuestionVO");
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
    public function get isLangsAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isChoicesAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnLangs():void
    {
        if (model_internal::_langsIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLangs = null;
            model_internal::calculateLangsIsValid();
        }
    }
    public function invalidateDependentOnChoices():void
    {
        if (model_internal::_choicesIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfChoices = null;
            model_internal::calculateChoicesIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get langsStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get langsValidator() : StyleValidator
    {
        return model_internal::_langsValidator;
    }

    model_internal function set _langsIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_langsIsValid;         
        if (oldValue !== value)
        {
            model_internal::_langsIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "langsIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get langsIsValid():Boolean
    {
        if (!model_internal::_langsIsValidCacheInitialized)
        {
            model_internal::calculateLangsIsValid();
        }

        return model_internal::_langsIsValid;
    }

    model_internal function calculateLangsIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_langsValidator.validate(model_internal::_instance.langs)
        model_internal::_langsIsValid_der = (valRes.results == null);
        model_internal::_langsIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::langsValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::langsValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get langsValidationFailureMessages():Array
    {
        if (model_internal::_langsValidationFailureMessages == null)
            model_internal::calculateLangsIsValid();

        return _langsValidationFailureMessages;
    }

    model_internal function set langsValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_langsValidationFailureMessages;

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
            model_internal::_langsValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "langsValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get choicesStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get choicesValidator() : StyleValidator
    {
        return model_internal::_choicesValidator;
    }

    model_internal function set _choicesIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_choicesIsValid;         
        if (oldValue !== value)
        {
            model_internal::_choicesIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "choicesIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get choicesIsValid():Boolean
    {
        if (!model_internal::_choicesIsValidCacheInitialized)
        {
            model_internal::calculateChoicesIsValid();
        }

        return model_internal::_choicesIsValid;
    }

    model_internal function calculateChoicesIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_choicesValidator.validate(model_internal::_instance.choices)
        model_internal::_choicesIsValid_der = (valRes.results == null);
        model_internal::_choicesIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::choicesValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::choicesValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get choicesValidationFailureMessages():Array
    {
        if (model_internal::_choicesValidationFailureMessages == null)
            model_internal::calculateChoicesIsValid();

        return _choicesValidationFailureMessages;
    }

    model_internal function set choicesValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_choicesValidationFailureMessages;

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
            model_internal::_choicesValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "choicesValidationFailureMessages", oldValue, value));
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
            case("langs"):
            {
                return langsValidationFailureMessages;
            }
            case("choices"):
            {
                return choicesValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
