
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
import com.masuland.religionchooser.data.vo.LangVO;
import mx.events.ValidationResultEvent;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IModelType;
import mx.events.PropertyChangeEvent;

use namespace model_internal;

[ExcludeClass]
internal class _ChoiceVOEntityMetadata extends com.adobe.fiber.valueobjects.AbstractEntityMetadata
{
    private static var emptyArray:Array = new Array();

    model_internal static var allProperties:Array = new Array("resultVO", "type", "langVO", "questionVO");
    model_internal static var allAssociationProperties:Array = new Array();
    model_internal static var allRequiredProperties:Array = new Array("resultVO", "type", "langVO", "questionVO");
    model_internal static var allAlwaysAvailableProperties:Array = new Array("resultVO", "type", "langVO", "questionVO");
    model_internal static var guardedProperties:Array = new Array();
    model_internal static var dataProperties:Array = new Array("resultVO", "type", "langVO", "questionVO");
    model_internal static var derivedProperties:Array = new Array();
    model_internal static var collectionProperties:Array = new Array("langVO");
    model_internal static var collectionBaseMap:Object;
    model_internal static var entityName:String = "ChoiceVO";
    model_internal static var dependentsOnMap:Object;
    model_internal static var dependedOnServices:Array = new Array();

    
    model_internal var _resultVOIsValid:Boolean;
    model_internal var _resultVOValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _resultVOIsValidCacheInitialized:Boolean = false;
    model_internal var _resultVOValidationFailureMessages:Array;
    
    model_internal var _typeIsValid:Boolean;
    model_internal var _typeValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _typeIsValidCacheInitialized:Boolean = false;
    model_internal var _typeValidationFailureMessages:Array;
    
    model_internal var _langVOIsValid:Boolean;
    model_internal var _langVOValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _langVOIsValidCacheInitialized:Boolean = false;
    model_internal var _langVOValidationFailureMessages:Array;
    
    model_internal var _questionVOIsValid:Boolean;
    model_internal var _questionVOValidator:com.adobe.fiber.styles.StyleValidator;
    model_internal var _questionVOIsValidCacheInitialized:Boolean = false;
    model_internal var _questionVOValidationFailureMessages:Array;

    model_internal var _instance:_Super_ChoiceVO;
    model_internal static var _nullStyle:com.adobe.fiber.styles.Style = new com.adobe.fiber.styles.Style();

    public function _ChoiceVOEntityMetadata(value : _Super_ChoiceVO)
    {
        // initialize property maps
        if (model_internal::dependentsOnMap == null)
        {
            // depenents map
            model_internal::dependentsOnMap = new Object();
            model_internal::dependentsOnMap["resultVO"] = new Array();
            model_internal::dependentsOnMap["type"] = new Array();
            model_internal::dependentsOnMap["langVO"] = new Array();
            model_internal::dependentsOnMap["questionVO"] = new Array();

            // collection base map
            model_internal::collectionBaseMap = new Object()
            model_internal::collectionBaseMap["langVO"] = "com.masuland.religionchooser.data.vo.LangVO";
        }

        model_internal::_instance = value;
        model_internal::_resultVOValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForResultVO);
        model_internal::_resultVOValidator.required = true;
        model_internal::_resultVOValidator.requiredFieldError = "resultVO is required";
        //model_internal::_resultVOValidator.source = model_internal::_instance;
        //model_internal::_resultVOValidator.property = "resultVO";
        model_internal::_typeValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForType);
        model_internal::_typeValidator.required = true;
        model_internal::_typeValidator.requiredFieldError = "type is required";
        //model_internal::_typeValidator.source = model_internal::_instance;
        //model_internal::_typeValidator.property = "type";
        model_internal::_langVOValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForLangVO);
        model_internal::_langVOValidator.required = true;
        model_internal::_langVOValidator.requiredFieldError = "langVO is required";
        //model_internal::_langVOValidator.source = model_internal::_instance;
        //model_internal::_langVOValidator.property = "langVO";
        model_internal::_questionVOValidator = new StyleValidator(model_internal::_instance.model_internal::_doValidationForQuestionVO);
        model_internal::_questionVOValidator.required = true;
        model_internal::_questionVOValidator.requiredFieldError = "questionVO is required";
        //model_internal::_questionVOValidator.source = model_internal::_instance;
        //model_internal::_questionVOValidator.property = "questionVO";
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
            throw new Error(propertyName + " is not a data property of entity ChoiceVO");  
            
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
            throw new Error(propertyName + " is not a collection property of entity ChoiceVO");  

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
            throw new Error(propertyName + " does not exist for entity ChoiceVO");
        }

        return model_internal::_instance[propertyName];
    }

    override public function setValue(propertyName:String, value:*):void
    {
        if (model_internal::dataProperties.indexOf(propertyName) == -1)
        {
            throw new Error(propertyName + " is not a data property of entity ChoiceVO");
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
            throw new Error(propertyName + " does not exist for entity ChoiceVO");
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
    public function get isResultVOAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isTypeAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isLangVOAvailable():Boolean
    {
        return true;
    }

    [Bindable(event="propertyChange")]
    public function get isQuestionVOAvailable():Boolean
    {
        return true;
    }


    /**
     * derived property recalculation
     */
    public function invalidateDependentOnResultVO():void
    {
        if (model_internal::_resultVOIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfResultVO = null;
            model_internal::calculateResultVOIsValid();
        }
    }
    public function invalidateDependentOnType():void
    {
        if (model_internal::_typeIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfType = null;
            model_internal::calculateTypeIsValid();
        }
    }
    public function invalidateDependentOnLangVO():void
    {
        if (model_internal::_langVOIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfLangVO = null;
            model_internal::calculateLangVOIsValid();
        }
    }
    public function invalidateDependentOnQuestionVO():void
    {
        if (model_internal::_questionVOIsValidCacheInitialized )
        {
            model_internal::_instance.model_internal::_doValidationCacheOfQuestionVO = null;
            model_internal::calculateQuestionVOIsValid();
        }
    }

    model_internal function fireChangeEvent(propertyName:String, oldValue:Object, newValue:Object):void
    {
        this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, propertyName, oldValue, newValue));
    }

    [Bindable(event="propertyChange")]   
    public function get resultVOStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get resultVOValidator() : StyleValidator
    {
        return model_internal::_resultVOValidator;
    }

    model_internal function set _resultVOIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_resultVOIsValid;         
        if (oldValue !== value)
        {
            model_internal::_resultVOIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "resultVOIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get resultVOIsValid():Boolean
    {
        if (!model_internal::_resultVOIsValidCacheInitialized)
        {
            model_internal::calculateResultVOIsValid();
        }

        return model_internal::_resultVOIsValid;
    }

    model_internal function calculateResultVOIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_resultVOValidator.validate(model_internal::_instance.resultVO)
        model_internal::_resultVOIsValid_der = (valRes.results == null);
        model_internal::_resultVOIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::resultVOValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::resultVOValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get resultVOValidationFailureMessages():Array
    {
        if (model_internal::_resultVOValidationFailureMessages == null)
            model_internal::calculateResultVOIsValid();

        return _resultVOValidationFailureMessages;
    }

    model_internal function set resultVOValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_resultVOValidationFailureMessages;

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
            model_internal::_resultVOValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "resultVOValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get typeStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get typeValidator() : StyleValidator
    {
        return model_internal::_typeValidator;
    }

    model_internal function set _typeIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_typeIsValid;         
        if (oldValue !== value)
        {
            model_internal::_typeIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "typeIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get typeIsValid():Boolean
    {
        if (!model_internal::_typeIsValidCacheInitialized)
        {
            model_internal::calculateTypeIsValid();
        }

        return model_internal::_typeIsValid;
    }

    model_internal function calculateTypeIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_typeValidator.validate(model_internal::_instance.type)
        model_internal::_typeIsValid_der = (valRes.results == null);
        model_internal::_typeIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::typeValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::typeValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get typeValidationFailureMessages():Array
    {
        if (model_internal::_typeValidationFailureMessages == null)
            model_internal::calculateTypeIsValid();

        return _typeValidationFailureMessages;
    }

    model_internal function set typeValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_typeValidationFailureMessages;

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
            model_internal::_typeValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "typeValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get langVOStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get langVOValidator() : StyleValidator
    {
        return model_internal::_langVOValidator;
    }

    model_internal function set _langVOIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_langVOIsValid;         
        if (oldValue !== value)
        {
            model_internal::_langVOIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "langVOIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get langVOIsValid():Boolean
    {
        if (!model_internal::_langVOIsValidCacheInitialized)
        {
            model_internal::calculateLangVOIsValid();
        }

        return model_internal::_langVOIsValid;
    }

    model_internal function calculateLangVOIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_langVOValidator.validate(model_internal::_instance.langVO)
        model_internal::_langVOIsValid_der = (valRes.results == null);
        model_internal::_langVOIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::langVOValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::langVOValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get langVOValidationFailureMessages():Array
    {
        if (model_internal::_langVOValidationFailureMessages == null)
            model_internal::calculateLangVOIsValid();

        return _langVOValidationFailureMessages;
    }

    model_internal function set langVOValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_langVOValidationFailureMessages;

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
            model_internal::_langVOValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "langVOValidationFailureMessages", oldValue, value));
            // Only execute calculateIsValid if it has been called before, to update the validationFailureMessages for
            // the entire entity.
            if (model_internal::_instance.model_internal::_cacheInitialized_isValid)
            {
                model_internal::_instance.model_internal::isValid_der = model_internal::_instance.model_internal::calculateIsValid();
            }
        }
    }

    [Bindable(event="propertyChange")]   
    public function get questionVOStyle():com.adobe.fiber.styles.Style
    {
        return model_internal::_nullStyle;
    }

    public function get questionVOValidator() : StyleValidator
    {
        return model_internal::_questionVOValidator;
    }

    model_internal function set _questionVOIsValid_der(value:Boolean):void 
    {
        var oldValue:Boolean = model_internal::_questionVOIsValid;         
        if (oldValue !== value)
        {
            model_internal::_questionVOIsValid = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "questionVOIsValid", oldValue, value));
        }                             
    }

    [Bindable(event="propertyChange")]
    public function get questionVOIsValid():Boolean
    {
        if (!model_internal::_questionVOIsValidCacheInitialized)
        {
            model_internal::calculateQuestionVOIsValid();
        }

        return model_internal::_questionVOIsValid;
    }

    model_internal function calculateQuestionVOIsValid():void
    {
        var valRes:ValidationResultEvent = model_internal::_questionVOValidator.validate(model_internal::_instance.questionVO)
        model_internal::_questionVOIsValid_der = (valRes.results == null);
        model_internal::_questionVOIsValidCacheInitialized = true;
        if (valRes.results == null)
             model_internal::questionVOValidationFailureMessages_der = emptyArray;
        else
        {
            var _valFailures:Array = new Array();
            for (var a:int = 0 ; a<valRes.results.length ; a++)
            {
                _valFailures.push(valRes.results[a].errorMessage);
            }
            model_internal::questionVOValidationFailureMessages_der = _valFailures;
        }
    }

    [Bindable(event="propertyChange")]
    public function get questionVOValidationFailureMessages():Array
    {
        if (model_internal::_questionVOValidationFailureMessages == null)
            model_internal::calculateQuestionVOIsValid();

        return _questionVOValidationFailureMessages;
    }

    model_internal function set questionVOValidationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_questionVOValidationFailureMessages;

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
            model_internal::_questionVOValidationFailureMessages = value;   
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "questionVOValidationFailureMessages", oldValue, value));
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
            case("resultVO"):
            {
                return resultVOValidationFailureMessages;
            }
            case("type"):
            {
                return typeValidationFailureMessages;
            }
            case("langVO"):
            {
                return langVOValidationFailureMessages;
            }
            case("questionVO"):
            {
                return questionVOValidationFailureMessages;
            }
            default:
            {
                return emptyArray;
            }
         }
     }

}

}
