/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - ChoiceVO.as.
 */

package com.masuland.religionchooser.data.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import com.masuland.religionchooser.data.vo.LangVO;
import com.masuland.religionchooser.data.vo.QuestionVO;
import com.masuland.religionchooser.data.vo.ResultVO;
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
public class _Super_ChoiceVO extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        com.masuland.religionchooser.data.vo.LangVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.data.vo.ResultVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.data.vo.QuestionVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.data.vo.ChoiceVO.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _ChoiceVOEntityMetadata;

    /**
     * properties
     */
    private var _internal_type : String;
    private var _internal_langVO : ArrayCollection;
    model_internal var _internal_langVO_leaf:com.masuland.religionchooser.data.vo.LangVO;
    private var _internal_resultVO : com.masuland.religionchooser.data.vo.ResultVO;
    private var _internal_questionVO : com.masuland.religionchooser.data.vo.QuestionVO;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_ChoiceVO()
    {
        _model = new _ChoiceVOEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "type", model_internal::setterListenerType));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "langVO", model_internal::setterListenerLangVO));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "resultVO", model_internal::setterListenerResultVO));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "questionVO", model_internal::setterListenerQuestionVO));

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get type() : String
    {
        return _internal_type;
    }

    [Bindable(event="propertyChange")]
    public function get langVO() : ArrayCollection
    {
        return _internal_langVO;
    }

    [Bindable(event="propertyChange")]
    public function get resultVO() : com.masuland.religionchooser.data.vo.ResultVO
    {
        return _internal_resultVO;
    }

    [Bindable(event="propertyChange")]
    public function get questionVO() : com.masuland.religionchooser.data.vo.QuestionVO
    {
        return _internal_questionVO;
    }

    /**
     * data property setters
     */

    public function set type(value:String) : void
    {
        var oldValue:String = _internal_type;
        if (oldValue !== value)
        {
            _internal_type = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "type", oldValue, _internal_type));
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

    public function set resultVO(value:com.masuland.religionchooser.data.vo.ResultVO) : void
    {
        var oldValue:com.masuland.religionchooser.data.vo.ResultVO = _internal_resultVO;
        if (oldValue !== value)
        {
            _internal_resultVO = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "resultVO", oldValue, _internal_resultVO));
        }
    }

    public function set questionVO(value:com.masuland.religionchooser.data.vo.QuestionVO) : void
    {
        var oldValue:com.masuland.religionchooser.data.vo.QuestionVO = _internal_questionVO;
        if (oldValue !== value)
        {
            _internal_questionVO = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "questionVO", oldValue, _internal_questionVO));
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

    model_internal function setterListenerType(value:flash.events.Event):void
    {
        _model.invalidateDependentOnType();
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

    model_internal function setterListenerResultVO(value:flash.events.Event):void
    {
        _model.invalidateDependentOnResultVO();
    }

    model_internal function setterListenerQuestionVO(value:flash.events.Event):void
    {
        _model.invalidateDependentOnQuestionVO();
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
        if (!_model.typeIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_typeValidationFailureMessages);
        }
        if (!_model.langVOIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_langVOValidationFailureMessages);
        }
        if (!_model.resultVOIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_resultVOValidationFailureMessages);
        }
        if (!_model.questionVOIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_questionVOValidationFailureMessages);
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
    public function get _model() : _ChoiceVOEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _ChoiceVOEntityMetadata) : void
    {
        var oldValue : _ChoiceVOEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfType : Array = null;
    model_internal var _doValidationLastValOfType : String;

    model_internal function _doValidationForType(valueIn:Object):Array
    {
        var value : String = valueIn as String;

        if (model_internal::_doValidationCacheOfType != null && model_internal::_doValidationLastValOfType == value)
           return model_internal::_doValidationCacheOfType ;

        _model.model_internal::_typeIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isTypeAvailable && _internal_type == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "type is required"));
        }

        model_internal::_doValidationCacheOfType = validationFailures;
        model_internal::_doValidationLastValOfType = value;

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
    
    model_internal var _doValidationCacheOfResultVO : Array = null;
    model_internal var _doValidationLastValOfResultVO : com.masuland.religionchooser.data.vo.ResultVO;

    model_internal function _doValidationForResultVO(valueIn:Object):Array
    {
        var value : com.masuland.religionchooser.data.vo.ResultVO = valueIn as com.masuland.religionchooser.data.vo.ResultVO;

        if (model_internal::_doValidationCacheOfResultVO != null && model_internal::_doValidationLastValOfResultVO == value)
           return model_internal::_doValidationCacheOfResultVO ;

        _model.model_internal::_resultVOIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isResultVOAvailable && _internal_resultVO == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "resultVO is required"));
        }

        model_internal::_doValidationCacheOfResultVO = validationFailures;
        model_internal::_doValidationLastValOfResultVO = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfQuestionVO : Array = null;
    model_internal var _doValidationLastValOfQuestionVO : com.masuland.religionchooser.data.vo.QuestionVO;

    model_internal function _doValidationForQuestionVO(valueIn:Object):Array
    {
        var value : com.masuland.religionchooser.data.vo.QuestionVO = valueIn as com.masuland.religionchooser.data.vo.QuestionVO;

        if (model_internal::_doValidationCacheOfQuestionVO != null && model_internal::_doValidationLastValOfQuestionVO == value)
           return model_internal::_doValidationCacheOfQuestionVO ;

        _model.model_internal::_questionVOIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isQuestionVOAvailable && _internal_questionVO == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "questionVO is required"));
        }

        model_internal::_doValidationCacheOfQuestionVO = validationFailures;
        model_internal::_doValidationLastValOfQuestionVO = value;

        return validationFailures;
    }
    

}

}
