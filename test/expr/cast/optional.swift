// RUN: %swift -parse %s -verify

class Base : Hashable { 
  var hashValue: Int { return 0 }
}

func ==(lhs: Base, rhs: Base) -> Bool { return false }

// Inputs that are more optional than the output.
func f1(i: Int?, ii: Int??, a: [Base]?, d: [Base : Base]?) {
  let i2 = i as Int // expected-error{{downcast from 'Int?' to 'Int' only unwraps optionals}}
  let i3 = ii as Int // expected-error{{downcast from 'Int??' to 'Int' only unwraps optionals}}
  let a2 = a as [Base] // expected-error{{downcast from '[Base]?' to '[Base]' only unwraps optionals}}
  let d2 = d as [Base : Base] // expected-error{{downcast from '[Base : Base]?' to '[Base : Base]' only unwraps optionals}}
}
