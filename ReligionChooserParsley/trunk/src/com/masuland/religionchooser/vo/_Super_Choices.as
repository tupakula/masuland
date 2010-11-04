/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - Choices.as.
 */

package com.masuland.religionchooser.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import com.masuland.religionchooser.vo.ChoiceVO;
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
public class _Super_Choices extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        com.masuland.religionchooser.vo.ChoiceVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.ResultVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.LangVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.Langs.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.QuestionVO.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _ChoicesEntityMetadata;

    /**
     * properties
     */
    private var _internal_choiceVO : ArrayCollection;
    model_internal var _internal_choiceVO_leaf:com.masuland.religionchooser.vo.ChoiceVO;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_Choices()
    {
        _model = new _ChoicesEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "choiceVO", model_internal::setterListenerChoiceVO));

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get choiceVO() : ArrayCollection
    {
        return _internal_choiceVO;
    }

    /**
     * data property setters
     */

    public function set choiceVO(value:*) : void
    {
        var oldValue:ArrayCollection = _internal_choiceVO;
        if (oldValue !== value)
        {
            if (value is ArrayCollection)
            {
                _internal_choiceVO = value;
            }
            else if (value is Array)
            {
                _internal_choiceVO = new ArrayCollection(value);
            }
            else
            {
                throw new Error("value of choiceVO must be a collection");
            }
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "choiceVO", oldValue, _internal_choiceVO));
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

    model_internal function setterListenerChoiceVO(value:flash.events.Event):void
    {
        if (value is mx.events.PropertyChangeEvent)
        {
            if (mx.events.PropertyChangeEvent(value).newValue)
            {
                mx.events.PropertyChangeEvent(value).newValue.addEventListener(mx.events.CollectionEvent.COLLECTION_CHANGE, model_internal::setterListenerChoiceVO);
            }
        }
        _model.invalidateDependentOnChoiceVO();
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
        if (!_model.choiceVOIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_choiceVOValidationFailureMessages);
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
    public function get _model() : _ChoicesEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _ChoicesEntityMetadata) : void
    {
        var oldValue : _ChoicesEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfChoiceVO : Array = null;
    model_internal var _doValidationLastValOfChoiceVO : ArrayCollection;

    model_internal function _doValidationForChoiceVO(valueIn:Object):Array
    {
        var value : ArrayCollection = valueIn as ArrayCollection;

        if (model_internal::_doValidationCacheOfChoiceVO != null && model_internal::_doValidationLastValOfChoiceVO == value)
           return model_internal::_doValidationCacheOfChoiceVO ;

        _model.model_internal::_choiceVOIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isChoiceVOAvailable && _internal_choiceVO == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "choiceVO is required"));
        }

        model_internal::_doValidationCacheOfChoiceVO = validationFailures;
        model_internal::_doValidationLastValOfChoiceVO = value;

        return validationFailures;
    }
    

}

}
