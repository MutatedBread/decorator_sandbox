1. delegation is explicitly declared, `method_missing` will not be called.
2. Can encapsulate internal object and expose intended methods only.s

With an OpenStruct, you can arbitrarily create attributes. A Struct, on the other hand, must have its attributes defined when you create it. The choice of one over the other should be based primarily on whether you need to be able to add attributes later.

The way to think about them is as the middle ground of the spectrum between Hashes on one side and classes on the other. They imply a more concrete relationship amongst the data than does a Hash, but they don't have the instance methods as would a class. A bunch of options for a function, for example, make sense in a hash; they're only loosely related. A name, email, and phone number needed by a function could be packaged together in a Struct or OpenStruct. If that name, email, and phone number needed methods to provide the name in both "First Last" and "Last, First" formats, then you should create a class to handle it.

"but they don't have the instance methods as would a class". well, there is a pretty common pattern to use it as a "normal class": class Point < Struct.new(:x, :y); methods here; end

@tokland as for today, the "preferred" approach of customizing the struct with methods is to pass the block to constructor Point = Struct.new(:x, :y) { methods here }. (source) Of course, { ... } there can be written as a multi-line block (do ... end) and, I think, that's the preferred way. – Ivan Kolmychek

https://www.rubyguides.com/2018/10/delegate-methods-in-ruby/
