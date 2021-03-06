package hext.threading;

import hext.Closure;
import hext.NotImplementedException;
import hext.threading.IExecutor;

/**
 * Sequential Executor to be used as a fallback for situations
 * where an Executor is required but we do not want an async one.
 */
class SequentialExecutor implements IExecutor
{
    /**
     * Constructor to initialize a new Sequential Executor.
     */
    public function new():Void {}

    /**
     * @{inherit}
     */
    public inline function execute(fn:Closure):Void
    {
        fn();
    }
}
