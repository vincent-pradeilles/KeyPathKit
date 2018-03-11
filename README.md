# KeyPathKit

## Context

Swift 4 has introduced a new type called `KeyPath`, with allows to access the properties of an object with a very nice syntax. For instance:

```swift
let string = "Foo"
let keyPathForCount = \String.count

let count = string[keyPath: keyPathForCount] // count == 3
```

The great part is that the syntax can be very concise, because it supports type inference and property chaining.

## Purpose of `KeyPathKit`

Consequently, I thought it would be nice to leverage this new concept in order to build an API that allows to perform data manipulation in a very declarative fashion.

SQL is a great language for such manipulations, so I took inspiration from it and implemented most of its standard operators in Swift 4 using `KeyPath`.

## Operator details

For the purpose of demonstrating the usage of the operators, the following mock data is defined:

```swift
struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    let hasDriverLicense: Bool
    let isAmerican: Bool
}

let contacts = [
    Person(firstName: "Charlie", lastName: "Webb", age: 10, hasDriverLicense: false, isAmerican: true),
    Person(firstName: "Alex", lastName: "Elexson", age: 22, hasDriverLicense: false, isAmerican: true),
    Person(firstName: "Charles", lastName: "Webb", age: 45, hasDriverLicense: true, isAmerican: true),
    Person(firstName: "Alex", lastName: "Zunino", age: 34, hasDriverLicense: true, isAmerican: true),
    Person(firstName: "Alex", lastName: "Alexson", age: 8, hasDriverLicense: false, isAmerican: true),
    Person(firstName: "John", lastName: "Webb", age: 28, hasDriverLicense: true, isAmerican: true),
    Person(firstName: "Webb", lastName: "Elexson", age: 30, hasDriverLicense: true, isAmerican: true)
]
``` 
 
### and

Performs a boolean AND operation on a property of type `Bool`.

```swift
contacts.and(\.hasDriverLicense)
contacts.and(\.isAmerican)
```

```
false
true
```

### average

Calculates the average of a numerical property.

```swift
contacts.average(of: \.age).rounded()
```

```
25
```

### between

Filters out elements whose value for the property is not within the range.

```swift
contacts.between(\.age, range: 20...30)
```

```
[Person(firstName: "Alex", lastName: "Elexson", age: 22, hasDriverLicense: false, isAmerican: true),
 Person(firstName: "John", lastName: "Webb", age: 28, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "Webb", lastName: "Elexson", age: 30, hasDriverLicense: true, isAmerican: true)]
```

### distinct

Returns all the distinct values for the property.

```swift
contacts.distinct(\.lastName)
```

```
["Webb", "Elexson", "Zunino", "Alexson"]
```

### filter

Filters out element whose value is `false` for a boolean property.

```swift
contacts.filter(where: \.hasDriverLicense)
```

```
[Person(firstName: "Charles", lastName: "Webb", age: 45, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "Alex", lastName: "Zunino", age: 34, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "John", lastName: "Webb", age: 28, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "Webb", lastName: "Elexson", age: 30, hasDriverLicense: true, isAmerican: true)]
```

### groupBy

Groups values by equality on the property. 

```swift
contacts.groupBy(\.lastName)
```

```
["Alexson": [Person(firstName: "Alex", lastName: "Alexson", age: 8, hasDriverLicense: false, isAmerican: true)], 
 "Webb": [Person(firstName: "Charlie", lastName: "Webb", age: 10, hasDriverLicense: false, isAmerican: true), Person(firstName: "Charles", lastName: "Webb", age: 45, hasDriverLicense: true, isAmerican: true), Person(firstName: "John", lastName: "Webb", age: 28, hasDriverLicense: true, isAmerican: true)], 
 "Elexson": [Person(firstName: "Alex", lastName: "Elexson", age: 22, hasDriverLicense: false, isAmerican: true), Person(firstName: "Webb", lastName: "Elexson", age: 30, hasDriverLicense: true, isAmerican: true)], 
 "Zunino": [Person(firstName: "Alex", lastName: "Zunino", age: 34, hasDriverLicense: true, isAmerican: true)]]

```

### join

Joins values of two sequences in tuples by the equality on their respective property.

```swift
contacts.join(\.firstName, with: contacts, on: \.lastName)
```

```
[(Person(firstName: "Webb", lastName: "Elexson", age: 30, hasDriverLicense: true, isAmerican: true), Person(firstName: "Charlie", lastName: "Webb", age: 10, hasDriverLicense: false, isAmerican: true)), 
 (Person(firstName: "Webb", lastName: "Elexson", age: 30, hasDriverLicense: true, isAmerican: true), Person(firstName: "Charles", lastName: "Webb", age: 45, hasDriverLicense: true, isAmerican: true)), 
 (Person(firstName: "Webb", lastName: "Elexson", age: 30, hasDriverLicense: true, isAmerican: true), Person(firstName: "John", lastName: "Webb", age: 28, hasDriverLicense: true, isAmerican: true))]
```

### map

Maps elements to their values of the property.

```swift
contacts.map(\.lastName)
```

```
["Webb", "Elexson", "Webb", "Zunino", "Alexson", "Webb", "Elexson"]
```

### max

Returns the element with the greatest value for a `Comparable` property.

```swift
contacts.max(of: \.age)
```

```
Optional(Person(firstName: "Charles", lastName: "Webb", age: 45, hasDriverLicense: true, isAmerican: true))
```

### min

Returns the element with the minimum value for a `Comparable` property.

```swift
contacts.min(of: \.age)
```

```
Optional(Person(firstName: "Alex", lastName: "Alexson", age: 8, hasDriverLicense: false, isAmerican: true))
```

### or

Performs a boolean OR operation on an property of type `Bool`.

```swift
contacts.or(\.hasDriverLicense)
```

```
true
```

### sum

Calculates the sum of the values for a numerical property.

```swift
contacts.sum(of: \.age)
```

```
177
```

### sort

Sorts the elements with respect to a `Comparable` property.

```swift
contacts.sorted(by: \.age)
```

```
[Person(firstName: "Alex", lastName: "Alexson", age: 8, hasDriverLicense: false, isAmerican: true), 
 Person(firstName: "Charlie", lastName: "Webb", age: 10, hasDriverLicense: false, isAmerican: true), 
 Person(firstName: "Alex", lastName: "Elexson", age: 22, hasDriverLicense: false, isAmerican: true), Person(firstName: "John", lastName: "Webb", age: 28, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "Webb", lastName: "Elexson", age: 30, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "Alex", lastName: "Zunino", age: 34, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "Charles", lastName: "Webb", age: 45, hasDriverLicense: true, isAmerican: true)]
```

It's also possible to specify the sorting order, to sort on multiple criteria, or to do both.

```swift
contacts.sorted(by: .ascending(\. lastName), .descending(\.age))
```

```
[Person(firstName: "Alex", lastName: "Alexson", age: 8, hasDriverLicense: false, isAmerican: true), 
 Person(firstName: "Webb", lastName: "Elexson", age: 30, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "Alex", lastName: "Elexson", age: 22, hasDriverLicense: false, isAmerican: true), 
 Person(firstName: "Charles", lastName: "Webb", age: 45, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "John", lastName: "Webb", age: 28, hasDriverLicense: true, isAmerican: true), 
 Person(firstName: "Charlie", lastName: "Webb", age: 10, hasDriverLicense: false, isAmerican: true), 
 Person(firstName: "Alex", lastName: "Zunino", age: 34, hasDriverLicense: true, isAmerican: true)]
```

## Thanks

A big thank you to Jérôme Alves ([elegantswift.com](http://elegantswift.com)) for coming up with the right modelization to allow sorting on multiple properties with heterogenous type.