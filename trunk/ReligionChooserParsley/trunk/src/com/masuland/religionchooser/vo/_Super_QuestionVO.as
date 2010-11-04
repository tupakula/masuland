/**
 * This is a generated class and is not intended for modification.  To customize behavior
 * of this value object you may modify the generated sub-class of this class - QuestionVO.as.
 */

package com.masuland.religionchooser.vo
{
import com.adobe.fiber.services.IFiberManagingService;
import com.adobe.fiber.util.FiberUtils;
import com.adobe.fiber.valueobjects.IValueObject;
import com.masuland.religionchooser.vo.Choices;
import com.masuland.religionchooser.vo.Langs;
import flash.events.Event;
import flash.events.EventDispatcher;
import mx.binding.utils.ChangeWatcher;
import mx.events.PropertyChangeEvent;
import mx.validators.ValidationResult;

import flash.net.registerClassAlias;
import flash.net.getClassByAlias;
import com.adobe.fiber.core.model_internal;
import com.adobe.fiber.valueobjects.IPropertyIterator;
import com.adobe.fiber.valueobjects.AvailablePropertyIterator;

use namespace model_internal;

[ExcludeClass]
public class _Super_QuestionVO extends flash.events.EventDispatcher implements com.adobe.fiber.valueobjects.IValueObject
{
    model_internal static function initRemoteClassAliasSingle(cz:Class) : void
    {
    }

    model_internal static function initRemoteClassAliasAllRelated() : void
    {
        com.masuland.religionchooser.vo.Langs.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.LangVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.Choices.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.ChoiceVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.ResultVO.initRemoteClassAliasSingleChild();
        com.masuland.religionchooser.vo.QuestionVO.initRemoteClassAliasSingleChild();
    }

    model_internal var _dminternal_model : _QuestionVOEntityMetadata;

    /**
     * properties
     */
    private var _internal_langs : com.masuland.religionchooser.vo.Langs;
    private var _internal_choices : com.masuland.religionchooser.vo.Choices;

    private static var emptyArray:Array = new Array();


    /**
     * derived property cache initialization
     */
    model_internal var _cacheInitialized_isValid:Boolean = false;

    model_internal var _changeWatcherArray:Array = new Array();

    public function _Super_QuestionVO()
    {
        _model = new _QuestionVOEntityMetadata(this);

        // Bind to own data properties for cache invalidation triggering
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "langs", model_internal::setterListenerLangs));
        model_internal::_changeWatcherArray.push(mx.binding.utils.ChangeWatcher.watch(this, "choices", model_internal::setterListenerChoices));

    }

    /**
     * data property getters
     */

    [Bindable(event="propertyChange")]
    public function get langs() : com.masuland.religionchooser.vo.Langs
    {
        return _internal_langs;
    }

    [Bindable(event="propertyChange")]
    public function get choices() : com.masuland.religionchooser.vo.Choices
    {
        return _internal_choices;
    }

    /**
     * data property setters
     */

    public function set langs(value:com.masuland.religionchooser.vo.Langs) : void
    {
        var oldValue:com.masuland.religionchooser.vo.Langs = _internal_langs;
        if (oldValue !== value)
        {
            _internal_langs = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "langs", oldValue, _internal_langs));
        }
    }

    public function set choices(value:com.masuland.religionchooser.vo.Choices) : void
    {
        var oldValue:com.masuland.religionchooser.vo.Choices = _internal_choices;
        if (oldValue !== value)
        {
            _internal_choices = value;
            this.dispatchEvent(mx.events.PropertyChangeEvent.createUpdateEvent(this, "choices", oldValue, _internal_choices));
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

    model_internal function setterListenerLangs(value:flash.events.Event):void
    {
        _model.invalidateDependentOnLangs();
    }

    model_internal function setterListenerChoices(value:flash.events.Event):void
    {
        _model.invalidateDependentOnChoices();
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
        if (!_model.langsIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_langsValidationFailureMessages);
        }
        if (!_model.choicesIsValid)
        {
            propertyValidity = false;
            com.adobe.fiber.util.FiberUtils.arrayAdd(validationFailureMessages, _model.model_internal::_choicesValidationFailureMessages);
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
    public function get _model() : _QuestionVOEntityMetadata
    {
        return model_internal::_dminternal_model;
    }

    public function set _model(value : _QuestionVOEntityMetadata) : void
    {
        var oldValue : _QuestionVOEntityMetadata = model_internal::_dminternal_model;
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

    model_internal var _doValidationCacheOfLangs : Array = null;
    model_internal var _doValidationLastValOfLangs : com.masuland.religionchooser.vo.Langs;

    model_internal function _doValidationForLangs(valueIn:Object):Array
    {
        var value : com.masuland.religionchooser.vo.Langs = valueIn as com.masuland.religionchooser.vo.Langs;

        if (model_internal::_doValidationCacheOfLangs != null && model_internal::_doValidationLastValOfLangs == value)
           return model_internal::_doValidationCacheOfLangs ;

        _model.model_internal::_langsIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isLangsAvailable && _internal_langs == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "langs is required"));
        }

        model_internal::_doValidationCacheOfLangs = validationFailures;
        model_internal::_doValidationLastValOfLangs = value;

        return validationFailures;
    }
    
    model_internal var _doValidationCacheOfChoices : Array = null;
    model_internal var _doValidationLastValOfChoices : com.masuland.religionchooser.vo.Choices;

    model_internal function _doValidationForChoices(valueIn:Object):Array
    {
        var value : com.masuland.religionchooser.vo.Choices = valueIn as com.masuland.religionchooser.vo.Choices;

        if (model_internal::_doValidationCacheOfChoices != null && model_internal::_doValidationLastValOfChoices == value)
           return model_internal::_doValidationCacheOfChoices ;

        _model.model_internal::_choicesIsValidCacheInitialized = true;
        var validationFailures:Array = new Array();
        var errorMessage:String;
        var failure:Boolean;

        var valRes:ValidationResult;
        if (_model.isChoicesAvailable && _internal_choices == null)
        {
            validationFailures.push(new ValidationResult(true, "", "", "choices is required"));
        }

        model_internal::_doValidationCacheOfChoices = validationFailures;
        model_internal::_doValidationLastValOfChoices = value;

        return validationFailures;
    }
    

}

}
