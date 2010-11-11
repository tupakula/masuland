/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - ResultVO.as.
 */

package com.masuland.religionchooser.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import com.masuland.religionchooser.vo.LangVO;
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
public class _Super_ResultVO extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        com.masuland.religionchooser.vo.LangVO.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _ResultVOEntityMetadata;

    /**
     * properties
     */
    private var _internal_imgUrl : String;
    private var _internal_langVO : ArrayCollection;
    model_internal var _internal_langVO_leaf:com.masuland.religionchooser.vo.LangVO;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_ResultVO()
    {
        _model = new _ResultVOEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "imgUrl", model_internal::setterListenerImgUrl));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "langVO", model_internal::setterListenerLangVO));

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get imgUrl() : String
    {
        return _internal_imgUrl;
    }

    [Bindable(event="propertyChange")]
    public function get langVO() : ArrayCollection
    {
        return _internal_langVO;
    }

    /**
     * data property setters
     */

    public function set imgUrl(value:String) : void
    {
        var oldValue:String = _internal_imgUrl;
        if (oldValue !== value)
        {
            _internal_imgUrl = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "imgUrl", oldValue, _internal_imgUrl));
        }
    }

    public function set langVO(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_langVO;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_langVO = value;
            }
            else if (value is Array)
            {
                _internal_langVO = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of langVO must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "langVO", oldValue, _internal_langVO));
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

    model_internal function setterListenerImgUrl(value:flash.events.Event):void
    {
        _model.invalidateDependentOnImgUrl();
    }

    model_internal function setterListenerLangVO(value:flash.events.Event):void
    {
        if (value is mx.events.PropertyChangeEvent)
        {
            if (mx.events.PropertyChangeEvent(value).newValue)
            {
                mx.events.PropertyChangeEvent(value).newValue.addEventListener(mx.events.CollectionEvent.COLLECTION_CHANGE, model_internal::setterListenerLangVO);
            }
        }
        _model.invalidateDependentOnLangVO();
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
        if (!_model.imgUrlIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_imgUrlValidationFailureMessages);
        }
        if (!_model.langVOIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_langVOValidationFailureMessages);
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
    public function get _model() : _ResultVOEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _ResultVOEntityMetadata) : void
    {
        var oldValue : _ResultVOEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfImgUrl : Array = null;
    model_internal var _doValidationLastValOfImgUrl : String;

    model_internal function _doValidationForImgUrl(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfImgUrl != null && model_internal::_doValidationLastValOfImgUrl == value)
           return model_internal::_doValidationCacheOfImgUrl ;

        _model.model_internal::_imgUrlIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isImgUrlAvailable && _internal_imgUrl == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "imgUrl is required"));
        }

        model_internal::_doValidationCacheOfImgUrl = validationFailures;
        model_internal::_doValidationLastValOfImgUrl = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfLangVO : Array = null;
    model_internal var _doValidationLastValOfLangVO : ArrayCollection;

    model_internal function _doValidationForLangVO(valueIn:Object):Array
    {
        var value : ArrayCollection = valueIn as ArrayCollection;

        if (model_internal::_doValidationCacheOfLangVO != null && model_internal::_doValidationLastValOfLangVO == value)
           return model_internal::_doValidationCacheOfLangVO ;

        _model.model_internal::_langVOIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isLangVOAvailable && _internal_langVO == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "langVO is required"));
        }

        model_internal::_doValidationCacheOfLangVO = validationFailures;
        model_internal::_doValidationLastValOfLangVO = value;

        return validationFailures;
    }
    

}

}
