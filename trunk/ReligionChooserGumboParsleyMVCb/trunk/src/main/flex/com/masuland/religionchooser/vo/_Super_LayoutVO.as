/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - LayoutVO.as.
 */

package com.masuland.religionchooser.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import com.masuland.religionchooser.vo.LocaleVO;
import com.masuland.religionchooser.vo.StyleVO;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.collections.ArrayCollection;
import mx.events.CollectionEvent;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_LayoutVO extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        com.masuland.religionchooser.vo.StyleVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.LocaleVO.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _LayoutVOEntityMetadata;

    /**
     * properties
     */
    private var _internal_name : String;
    private var _internal_width : String;
    private var _internal_height : String;
    private var _internal_stateName : String;
    private var _internal_styleVO : ArrayCollection;
    model_internal var _internal_styleVO_leaf:com.masuland.religionchooser.vo.StyleVO;
    private var _internal_localeVO : ArrayCollection;
    model_internal var _internal_localeVO_leaf:com.masuland.religionchooser.vo.LocaleVO;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_LayoutVO()
    {
        _model = new _LayoutVOEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "name", model_internal::setterListenerName));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "width", model_internal::setterListenerWidth));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "height", model_internal::setterListenerHeight));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "stateName", model_internal::setterListenerStateName));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "styleVO", model_internal::setterListenerStyleVO));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "localeVO", model_internal::setterListenerLocaleVO));

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get name() : String
    {
        return _internal_name;
    }

    [Bindable(event="propertyChange")]
    public function get width() : String
    {
        return _internal_width;
    }

    [Bindable(event="propertyChange")]
    public function get height() : String
    {
        return _internal_height;
    }

    [Bindable(event="propertyChange")]
    public function get stateName() : String
    {
        return _internal_stateName;
    }

    [Bindable(event="propertyChange")]
    public function get styleVO() : ArrayCollection
    {
        return _internal_styleVO;
    }

    [Bindable(event="propertyChange")]
    public function get localeVO() : ArrayCollection
    {
        return _internal_localeVO;
    }

    /**
     * data property setters
     */

    public function set name(value:String) : void
    {
        var oldValue:String = _internal_name;
        if (oldValue !== value)
        {
            _internal_name = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "name", oldValue, _internal_name));
        }
    }

    public function set width(value:String) : void
    {
        var oldValue:String = _internal_width;
        if (oldValue !== value)
        {
            _internal_width = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "width", oldValue, _internal_width));
        }
    }

    public function set height(value:String) : void
    {
        var oldValue:String = _internal_height;
        if (oldValue !== value)
        {
            _internal_height = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "height", oldValue, _internal_height));
        }
    }

    public function set stateName(value:String) : void
    {
        var oldValue:String = _internal_stateName;
        if (oldValue !== value)
        {
            _internal_stateName = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "stateName", oldValue, _internal_stateName));
        }
    }

    public function set styleVO(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_styleVO;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_styleVO = value;
            }
            else if (value is Array)
            {
                _internal_styleVO = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of styleVO must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "styleVO", oldValue, _internal_styleVO));
        }
    }

    public function set localeVO(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_localeVO;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_localeVO = value;
            }
            else if (value is Array)
            {
                _internal_localeVO = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of localeVO must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "localeVO", oldValue, _internal_localeVO));
        }
    }

    /**
     * Data property setter listeners
     *
     * Each data property whose value affects other properties or the validity of the entity
     * needs to invalidate all previously calculated artifacts. These include:
     *  - any derived properties or constraints that reference the given data property.
     *  - any availability guards (variant expressions) that reference the given data property.
     *  - any style validations, message tokens or guards that reference the given data property.
     *  - the validity of the property (and the containing entity) if the given data property has a length restriction.
     *  - the validity of the property (and the containing entity) if the given data property is required.
     */

    model_internal function setterListenerName(value:flash.events.Event):void
    {
        _model.invalidateDependentOnName();
    }

    model_internal function setterListenerWidth(value:flash.events.Event):void
    {
        _model.invalidateDependentOnWidth();
    }

    model_internal function setterListenerHeight(value:flash.events.Event):void
    {
        _model.invalidateDependentOnHeight();
    }

    model_internal function setterListenerStateName(value:flash.events.Event):void
    {
        _model.invalidateDependentOnStateName();
    }

    model_internal function setterListenerStyleVO(value:flash.events.Event):void
    {
        if (value is mx.events.PropertyChangeEvent)
        {
            if (mx.events.PropertyChangeEvent(value).newValue)
            {
                mx.events.PropertyChangeEvent(value).newValue.addEventListener(mx.events.CollectionEvent.COLLECTION_CHANGE, model_internal::setterListenerStyleVO);
            }
        }
        _model.invalidateDependentOnStyleVO();
    }

    model_internal function setterListenerLocaleVO(value:flash.events.Event):void
    {
        if (value is mx.events.PropertyChangeEvent)
        {
            if (mx.events.PropertyChangeEvent(value).newValue)
            {
                mx.events.PropertyChangeEvent(value).newValue.addEventListener(mx.events.CollectionEvent.COLLECTION_CHANGE, model_internal::setterListenerLocaleVO);
            }
        }
        _model.invalidateDependentOnLocaleVO();
    }


    /**
     * valid related derived properties
     */
    model_internal var _isValid : Boolean;
    model_internal var _invalidConstraints:Array = new Array();
    model_internal var _validationFailureMessages:Array = new Array();

    /**
     * derived property calculators
     */

    /**
     * isValid calculator
     */
    model_internal function calculateIsValid():Boolean
    {
        var violatedConsts:Array = new Array();
        var validationFailureMessages:Array = new Array();

        var propertyValidity:Boolean = true;
        if (!_model.nameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_nameValidationFailureMessages);
        }
        if (!_model.widthIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_widthValidationFailureMessages);
        }
        if (!_model.heightIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_heightValidationFailureMessages);
        }
        if (!_model.stateNameIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_stateNameValidationFailureMessages);
        }
        if (!_model.styleVOIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_styleVOValidationFailureMessages);
        }
        if (!_model.localeVOIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_localeVOValidationFailureMessages);
        }

        model_internal::_cacheInitialized_isValid = true;
        model_internal::invalidConstraints_der = violatedConsts;
        model_internal::validationFailureMessages_der = validationFailureMessages;
        return violatedConsts.length == 0 && propertyValidity;
    }

    /**
     * derived property setters
     */

    model_internal function set isValid_der(value:Boolean) : void
    {
        var oldValue:Boolean = model_internal::_isValid;
        if (oldValue !== value)
        {
            model_internal::_isValid = value;
            _model.model_internal::fireChangeEvent("isValid", oldValue, model_internal::_isValid);
        }
    }

    /**
     * derived property getters
     */

    [Transient]
    [Bindable(event="propertyChange")]
    public function get _model() : _LayoutVOEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _LayoutVOEntityMetadata) : void
    {
        var oldValue : _LayoutVOEntityMetadata = model_internal::_dminternal_model;
        if (oldValue !== value)
        {
            model_internal::_dminternal_model = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "_model", oldValue, model_internal::_dminternal_model));
        }
    }

    /**
     * methods
     */


    /**
     *  services
     */
    private var _managingService:com.adobe.fiber.services.IFiberManagingService;

    public function set managingService(managingService:com.adobe.fiber.services.IFiberManagingService):void
    {
        _managingService = managingService;
    }

    model_internal function set invalidConstraints_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_invalidConstraints;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_invalidConstraints = value;
            _model.model_internal::fireChangeEvent("invalidConstraints", oldValue, model_internal::_invalidConstraints);
        }
    }

    model_internal function set validationFailureMessages_der(value:Array) : void
    {
        var oldValue:Array = model_internal::_validationFailureMessages;
        // avoid firing the event when old and new value are different empty arrays
        if (oldValue !== value && (oldValue.length > 0 || value.length > 0))
        {
            model_internal::_validationFailureMessages = value;
            _model.model_internal::fireChangeEvent("validationFailureMessages", oldValue, model_internal::_validationFailureMessages);
        }
    }

    model_internal var _doValidationCacheOfName : Array = null;
    model_internal var _doValidationLastValOfName : String;

    model_internal function _doValidationForName(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfName != null && model_internal::_doValidationLastValOfName == value)
           return model_internal::_doValidationCacheOfName ;

        _model.model_internal::_nameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isNameAvailable && _internal_name == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "name is required"));
        }

        model_internal::_doValidationCacheOfName = validationFailures;
        model_internal::_doValidationLastValOfName = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfWidth : Array = null;
    model_internal var _doValidationLastValOfWidth : String;

    model_internal function _doValidationForWidth(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfWidth != null && model_internal::_doValidationLastValOfWidth == value)
           return model_internal::_doValidationCacheOfWidth ;

        _model.model_internal::_widthIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isWidthAvailable && _internal_width == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "width is required"));
        }

        model_internal::_doValidationCacheOfWidth = validationFailures;
        model_internal::_doValidationLastValOfWidth = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfHeight : Array = null;
    model_internal var _doValidationLastValOfHeight : String;

    model_internal function _doValidationForHeight(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfHeight != null && model_internal::_doValidationLastValOfHeight == value)
           return model_internal::_doValidationCacheOfHeight ;

        _model.model_internal::_heightIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isHeightAvailable && _internal_height == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "height is required"));
        }

        model_internal::_doValidationCacheOfHeight = validationFailures;
        model_internal::_doValidationLastValOfHeight = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfStateName : Array = null;
    model_internal var _doValidationLastValOfStateName : String;

    model_internal function _doValidationForStateName(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfStateName != null && model_internal::_doValidationLastValOfStateName == value)
           return model_internal::_doValidationCacheOfStateName ;

        _model.model_internal::_stateNameIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isStateNameAvailable && _internal_stateName == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "stateName is required"));
        }

        model_internal::_doValidationCacheOfStateName = validationFailures;
        model_internal::_doValidationLastValOfStateName = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfStyleVO : Array = null;
    model_internal var _doValidationLastValOfStyleVO : ArrayCollection;

    model_internal function _doValidationForStyleVO(valueIn:Object):Array
    {
        var value : ArrayCollection = valueIn as ArrayCollection;

        if (model_internal::_doValidationCacheOfStyleVO != null && model_internal::_doValidationLastValOfStyleVO == value)
           return model_internal::_doValidationCacheOfStyleVO ;

        _model.model_internal::_styleVOIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isStyleVOAvailable && _internal_styleVO == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "styleVO is required"));
        }

        model_internal::_doValidationCacheOfStyleVO = validationFailures;
        model_internal::_doValidationLastValOfStyleVO = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfLocaleVO : Array = null;
    model_internal var _doValidationLastValOfLocaleVO : ArrayCollection;

    model_internal function _doValidationForLocaleVO(valueIn:Object):Array
    {
        var value : ArrayCollection = valueIn as ArrayCollection;

        if (model_internal::_doValidationCacheOfLocaleVO != null && model_internal::_doValidationLastValOfLocaleVO == value)
           return model_internal::_doValidationCacheOfLocaleVO ;

        _model.model_internal::_localeVOIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isLocaleVOAvailable && _internal_localeVO == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "localeVO is required"));
        }

        model_internal::_doValidationCacheOfLocaleVO = validationFailures;
        model_internal::_doValidationLastValOfLocaleVO = value;

        return validationFailures;
    }
    

}

}
