package hext.io;

import hext.Error;

/**
 * The Bit abstract allows one to treat Bools or Ints like they were a single Bit.
 *
 * Use cases:
 *   - Working on a low-level system class (e.g. unfiltered storage access) and the data returned
 *     by member methods should feel natural. Bits should help...
 */
abstract Bit(Bool) from Bool to Bool
{
    /**
     * Constructor to initialize a new Bit.
     *
     * @param Bool value the Bit's value (true == 1)
     */
    private inline function new(value:Bool):Void
    {
        this = value;
    }

    /**
     * Overloaded operator that is called when comparing two Bits.
     *
     * @param hext.Bit other the right side Bit to compare against
     *
     * @return Bool true if they are equal (e.g. both are 1)
     */
    @:noCompletion
    @:op(A == A) public function compareEqual(other:Bit):Bool
    {
        return (this:Bool) == other;
    }

    /**
     * Overloaded operator that is called when comparing for NE two Bits.
     *
     * @param hext.Bit other the right side Bit to compare against
     *
     * @return Bool true if they are not equal (e.g. one is 1, the other 0)
     */
    @:noCompletion
    @:op(A != A) public function compareNotEqual(other:Bit):Bool
    {
        return !(this:Bit).compareEqual(other);
    }

    /**
     * Type-casting helper method to convert an integer to a Bit.
     *
     * @param Int value the integer value to convert
     *
     * @return Bit
     *
     * @throws hext.Error if the integer is not 0 or 1
     */
    @:noCompletion @:noUsing
    @:from public static function fromInt(value:Int):Bit
    {
        #if !HEXT_PERFORMANCE
            if (value != 0 && value != 1) {
                throw new Error("A bit can either be 0 or 1.");
            }
        #end

        return new Bit(value == 1);
    }

    /**
     * Negates the Bit's value.
     *
     * @return hext.Bit the negated Bit
     */
    @:noCompletion
    @:op(!A) public inline function negate():Bit
    {
        var current:Bool = this;
        this = !current;

        return this;
    }

    /**
     * Type-casting helper method to convert the Bit to an integer.
     *
     * @return Int
     */
    @:noCompletion
    @:to public function toInt():Int
    {
        return (this == true) ? 1 : 0;
    }

    /**
     * @{inherit}
     */
    @:noCompletion
    public function toString():String
    {
        return (this == true) ? "1" : "0";
    }
}