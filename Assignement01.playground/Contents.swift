//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Optional Types
    //? !
// Nil
//Class
//Struct
//enum
//init
    //Failable Init
//Object type Declarations
//Subscripts
//Class Inheritance
//Protocols
//Umbrella Types (Any)
//Extensions
//Errors
    //Throwing, catching
//Arrays
    //Enumeration
    //Transformation
    //Dictionaries


class Dog
{
    var name : String?
    
    func bark()
    {
        print ("woof woof")
    }
}

var d1 = Dog()
var d2 : Dog? = nil

d1.bark()
d2?.bark()

d1.name = "Tyson"
d1.name!.uppercaseString
d2?.name?.lowercaseString

//Class, Init, Failable Init, Casting, static variable
class Cat {
    
    var name : String
    var age : Int
    static var awake : String = "Night Only"
    
    init?(name : String, age : Int = 1, awake : String = "Night Only")
    {
        self.name = name
        self.age = age
        
        if age < 0{
            return nil
        }
        
        self.hairball()
    }
    
    func hairball() {
        print("hack... Gross")
    }
}

var f = Cat(name : "Fluffy", age : 4)
f!.hairball() //will unwrap


var c = Cat(name : "Tyga", age: -1)
c?.hairball() //will not unwrap because it is nil


//Class, subscripts
class classroom{
    
    private var students = ["Jason", "Ryan", "Jack", "Chris", "Jess", "Jackie", "Kate"]
    
    subscript(idx : Int) -> String{
        
        return students[idx]
    }
}

let findStudent = classroom()
print("I think \(findStudent[2]) broke the teachers computer")

//enums
enum animalType {
    
    case flier
    case scales
    case landOnly
    case seafood
    
}

let eagle = animalType.flier
let dog = animalType.landOnly
let snake = animalType.scales

//raw Value enums
enum major : String{
    
    case tech = "CompSci"
    case life = "Pre-Med"
    case build = "Engineering"
    case argue = "Pre-Law"
    case politics = "PolySci"
    case feelings = "Psychology"
    case think = "Philosophy"
    
}

let person1 = "CompSci"
let person2 = major(rawValue: person1)
let person3 = major(rawValue: "Pre-Law")


//mutating enums
enum karate : Int {
    
    case whiteBelt = 0
    case yellowBelt = 1
    case greenBelt = 2
    case blueBelt = 3
    case purpleBelt = 4
    case redBelt = 5
    case brownBelt = 6
    case blackBeltMaster = 7
    
    mutating func masterMove()
    {
        let nextBelt = karate(rawValue: self.rawValue+1)
        self = nextBelt!
    }
}

var level = karate.blueBelt
level.masterMove()
level.masterMove()

var kStudent : karate = .brownBelt

switch kStudent {
case .whiteBelt:
    print("You just started")
case .yellowBelt:
    print("OK, OK")
case .greenBelt:
    print("hmmmmm")
case .blueBelt:
    print("You're getting good!")
case .purpleBelt:
    print("Ok, woah there")
case .redBelt:
    print("You're getting too good...")
case .brownBelt:
    print("Stop...")
    fallthrough
case.blackBeltMaster:
    print("wow... congrats i guess. -__-")
default: // default wont be reached
    print("You don't even go here.")
}

//Structs
struct team
{
    var name : String
    var sport : String
}

let t1 = team(name: "Giants", sport: "Baseball")
var t2 = t1
t2.sport = "Football"

//class, inheritance
class mammal
{
    var name : String
    var age : Int
    
    init (name : String, age: Int)
    {
        self.name = name
        self.age = age
    }
    
    convenience init()
    {
        self.init(name : "", age : 0)
        print("soo convenient")
    }
    
    func move()
    {
        print("move")
    }
}

class human : mammal
{
    final override func move()
    {
        super.move()
        print("vroooommm")
    }
    func doWork()
    {
        print("stress, then not do work")
    }
}

final class Whale : mammal
{
    override func move()
    {
        super.move()
        print("just keep swimming")
    }
    
    func sing()
    {
        print("ooohhWHoowhaHWhhWWOo Whale Song")
    }
}

let collegeStudent = human(name: "Sophomore", age: 20)
collegeStudent.move()
collegeStudent.doWork()

let Dory = Whale(name: "Dory", age: 100)
Dory.move()
Dory.sing()

//cannot make subclass of Whale
//Cannot override move() in subclass of human

//Protocols
protocol Swims
{
    var size : String {get}
    
    func eat() -> Void
    
    func breath() -> Void
}

class clownFish : Swims
{
    var size : String = "small"
    
    func eat()
    {
        print("mmm algae and other smaller things)")
    }
    
    func breath()
    {
        print("H2O")
    }
}

class Dolphin : Swims
{
    var size : String = "Medium"
    
    func eat()
    {
        print("mmm fish")
    }
    
    func breath()
    {
        print("O2")
    }
}

struct Shark : Swims
{
    var size : String = "Medium"
    
    func eat()
    {
        print("Fish are friends, Not food!")
    }
    
    func breath()
    {
        print("H2O")
    }
}

var marlin = clownFish()
var bruce = Shark()
var flipper = Dolphin()

bruce.eat()
flipper.breath()

//Umbrella types
func anyObjectExpect(obj : AnyObject) {}
func anyClassExpect(cls : AnyClass) {}
func anyExpect(a : Any) {}

anyObjectExpect("hello")
anyObjectExpect(marlin)

anyObjectExpect(UIButton)
anyObjectExpect(Dolphin())

anyClassExpect(Dolphin)

anyExpect("")
anyExpect(String)
anyExpect(bruce)


//Extensions
extension String
{
    func concatenate(s1 : String, s2 : String)
    {
        print(s1, s2)
    }
}

let str1 = "Hello"
let str2 = "Ryan"

str1.concatenate(str1, s2: str2)

//ternary operators
let num1 = 10
let spec1 = (num1 < 0) ? "negative" : "Positive"

let num2 = -50
let spec2 = (num2 < 0) ? "Negative" : "Positive"

//while binding

var names : [String] = ["Jason", "Ryan", "Katie", "Chris"]

while let name = names.popLast()
{
    print(name)
}

var nums : [Int] = [10, 23, 8, 6, 15, 16, 5]

for var num in nums where num - 14 > 0
{
    print(num)
}

struct Cartoon
{
    var name : String
    var type : String
}

let c1 = Cartoon(name: "Tweety", type: "Animal")
let c2 = Cartoon(name: "Tommy Pickles", type: "Human")
let c3 = Cartoon(name: "Mickey Mouse", type: "Animal")
let c4 = Cartoon(name: "Jimmy Neutron", type: "Human")
let c5 = Cartoon(name: "Lightning McQueen", type: "Talking Car???")

let toonArray : [Cartoon] = [c1, c2, c3, c4, c5]

for toon in toonArray where toon.type == "Human"
{
    print(toon.name)
}

var start = (1,1)


//break
outer: for x in 0 ... 50
{
    for y in 0 ... 50
    {
        print("(\(x),\(y))")
        if x == start.0 && y == start.1
        {
            break outer
        }
    }
}

//Array Initialization
nums = [10, 23, 8, 6, 15, 16, 5]

//indexing 
print(nums[4])

//slicing
nums[2...4]

let goodMajors : [major] = [.tech, .life, .build, .argue]
let why : [major] = [.think, .feelings]
let governmentMaybe = [major.politics]


//transformationsx
let cartoonType = toonArray.map { (t : Cartoon) -> String in
    return t.type
}

toonArray.forEach { (t) -> () in
    print(t.name)
}

for (i, toon) in toonArray.enumerate()
{
    print("\(i):\(toon)")
}


//Dictionaries
var dogKennel = [Int:String]()
dogKennel[19834] = "Tyson"
dogKennel[12432] = "Cali"
dogKennel[11111] = "Bailey"
dogKennel[13240] = "Jaque"
dogKennel

//enumeration
let subset = dogKennel.filter { (id, name) -> Bool in
    return name.containsString("a")
}


//throwable types
let err = NSError(domain: "edu.chapman", code: 0, userInfo: nil)
enum Error : ErrorType
{
    case Whoops
    case Sorry
    case How
}

func failure() throws
{
    throw Error.Sorry
}

do {
    try failure()
}
catch Error.Whoops {
    //only catches if error is error.whoops happened
    print("Whoops, that's an error")
}
catch Error.How {
    //only happens when error is Error.How
    print("How did you manage this?")
}
catch let error as Error {
    //only catches if error is Error
    print("\(error) happened")
}
catch let error {
    //catches any error and assigns to error
    print("\(error) happened")
}
catch {
    //catch anything
    print("error")
}

try? failure()















