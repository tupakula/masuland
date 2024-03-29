package org.osflash.signals
{
	import flash.errors.IllegalOperationError;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	/** 
	 * Allows the valueClasses to be set in MXML, e.g.
	 * <signals:Signal id="nameChanged">{[String, uint]}</signals:Signal>
	 */
	[DefaultProperty("valueClasses")]	
	
	/**
	 * Signal dispatches events to multiple listeners.
	 * It is inspired by C# events and delegates, and by
	 * <a target="_top" href="http://en.wikipedia.org/wiki/Signals_and_slots">signals and slots</a>
	 * in Qt.
	 * A Signal adds event dispatching functionality through composition and interfaces,
	 * rather than inheriting from a dispatcher.
	 * <br/><br/>
	 * Project home: <a target="_top" href="http://github.com/robertpenner/as3-signals/">http://github.com/robertpenner/as3-signals/</a>
	 */
	public class Signal implements ISignalOwner, IDispatcher
	{
		protected var _valueClasses:Array;		// of Class
		protected var slots:Array;			// of Slot
		protected var slotsNeedCloning:Boolean = false;
		
		/**
		 * Creates a Signal instance to dispatch value objects.
		 * @param	valueClasses Any number of class references that enable type checks in dispatch().
		 * For example, new Signal(String, uint)
		 * would allow: signal.dispatch("the Answer", 42)
		 * but not: signal.dispatch(true, 42.5)
		 * nor: signal.dispatch()
		 *
		 * NOTE: Subclasses cannot call super.apply(null, valueClasses),
		 * but this constructor has logic to support super(valueClasses).
		 */
		public function Signal(...valueClasses)
		{
			slots = [];
			// Cannot use super.apply(null, valueClasses), so allow the subclass to call super(valueClasses).
			if (valueClasses.length == 1 && valueClasses[0] is Array)
				valueClasses = valueClasses[0];
			this.valueClasses = valueClasses;
		}
		
		/** @inheritDoc */
		[ArrayElementType("Class")]
		public function get valueClasses():Array { return _valueClasses; }
		
		/** @inheritDoc */
		public function set valueClasses(value:Array):void
		{
			// Clone so the Array cannot be affected from outside.
			_valueClasses = value ? value.slice() : [];
			for (var i:int = _valueClasses.length; i--; )
			{
				if (!(_valueClasses[i] is Class))
				{
					throw new ArgumentError('Invalid valueClasses argument: item at index ' + i
						+ ' should be a Class but was:<' + _valueClasses[i] + '>.' + getQualifiedClassName(_valueClasses[i]));
				}
			}
		}
		
		/** @inheritDoc */
		public function get numListeners():uint { return slots.length; }
		
		/** @inheritDoc */
		//TODO: @throws
		public function add(listener:Function):Function
		{
			registerListener(listener);
			return listener;
		}
		
		/** @inheritDoc */
		public function addOnce(listener:Function):Function
		{
			registerListener(listener, true);
			return listener;
		}
		
		/** @inheritDoc */
		public function remove(listener:Function):Function
		{
			if (indexOfListener(listener) == -1) return listener;
			if (slotsNeedCloning)
			{
				slots = slots.slice();
				slotsNeedCloning = false;
			}
			slots.splice(indexOfListener(listener), 1);
			return listener;
		}
		
		/** @inheritDoc */
		public function removeAll():void
		{
			// Looping backwards is more efficient when removing array items.
			for (var i:uint = slots.length; i--; )
			{
				// This is the "proper" type-safe way, but perhaps not the fastest.
				// TODO: Test for speed.
				remove(Slot(slots[i]).listener);
			}
		}
		
		/** @inheritDoc */
		public function dispatch(...valueObjects):void
		{
			// Validate value objects against pre-defined value classes.
			var valueObject:Object;
			var valueClass:Class;
			const numValueClasses:uint = _valueClasses.length;
			if (valueObjects.length < numValueClasses)
			{
				throw new ArgumentError('Incorrect number of arguments. Expected at least ' + numValueClasses + ' but received ' + valueObjects.length + '.');
			}
			
			for (var i:int = 0; i < numValueClasses; i++)
			{
				// null is allowed to pass through.
				if ( (valueObject = valueObjects[i]) === null
					|| valueObject is (valueClass = _valueClasses[i]) )
					continue;
					
				throw new ArgumentError('Value object <' + valueObject
					+ '> is not an instance of <' + valueClass + '>.');
			}

			//// Call listeners.
			if (slots.length)
			{
				// During a dispatch, add() and remove() should clone listeners array instead of modifying it.
				slotsNeedCloning = true;
				var slot:Slot;
				switch (valueObjects.length)
				{
					case 0:
						for each (slot in slots)
						{
							slot.execute0();
						}
						break;
						
					case 1:
						const singleValue:Object = valueObjects[0];
						for each (slot in slots)
						{
							slot.execute1(singleValue);
						}
						break;
						
					case 2:
						const value1:Object = valueObjects[0];
						const value2:Object = valueObjects[1];
						for each (slot in slots)
						{
							slot.execute2(value1, value2);
						}
						break;
						
					default:
						for each (slot in slots)
						{
							slot.execute(valueObjects);
						}
				}
				slotsNeedCloning = false;
			}
		}
		
		protected function indexOfListener(listener:Function):int
		{
			for (var i:int = slots.length; i--; )
			{
				if (Slot(slots[i]).listener == listener) return i;
			}
			return -1;
		}
		
		protected function registerListener(listener:Function, once:Boolean = false):void
		{
			// function.length is the number of arguments.
			if (listener.length < _valueClasses.length)
			{
				const argumentString:String = (listener.length == 1) ? 'argument' : 'arguments';
				throw new ArgumentError('Listener has '+listener.length+' '+argumentString+' but it needs at least '+_valueClasses.length+' to match the given value classes.');
			}
			
			const slot:Slot = new Slot(listener, once, this);
			// If there are no previous listeners, add the first one as quickly as possible.
			if (!slots.length)
			{
				slots[0] = slot;
				return;
			}
						
			var prevListenerIndex:int = indexOfListener(listener);
			if (prevListenerIndex >= 0)
			{
				// If the listener was previously added, definitely don't add it again.
				// But throw an exception in some cases, as the error messages explain.
				var prevSlot:Slot = Slot(slots[prevListenerIndex]);
				if (prevSlot.once && !once)
				{
					throw new IllegalOperationError('You cannot addOnce() then add() the same listener without removing the relationship first.');
				}
				else if (!prevSlot.once && once)
				{
					throw new IllegalOperationError('You cannot add() then addOnce() the same listener without removing the relationship first.');
				}
				// Listener was already added, so do nothing.
				return;
			}
			
			if (slotsNeedCloning)
			{
				slots = slots.slice();
				slotsNeedCloning = false;
			}
				
			// Faster than push().
			slots[slots.length] = slot;
		}
	}
}
