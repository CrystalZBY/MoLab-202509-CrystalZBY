import UIKit

//DAY 4. TYPE ANNOTATION
//specifying UIStyle has the listed items
enum UIStyle {
    case light, dark, system
}

//type annotation, assign value to thing when I want to use it
var style: UIStyle = .light
style = .dark

let playerName: String = "Roy"

var albums: [String] = ["Red", "Fearless", "Speak Now", "A Night at the Opera"]
var user: [String: String] = ["id": "1", "username": "roy", "email": "roy@example.com"]

//empty array --> assign whatever in the array later
var teams: [String] = []


let username: String
//lots of complex logic
username = "@twostraws"
print(username)

//Swift must know what data type I am using
//Why does Swift need annotations?
//1. Swift can't figure out what type shoud be used
//2. You want Swift to use a different type from default
//3. don't want to assign a value just yet --> empty collection

//Enums: array with 0, 1, 2, 3 could be confusing; use enums with simple storage

//Array
var sports = ["soccer","basketball","hockey"]
print(sports[0])
sports.append("frisbee")
print(sports.contains("marathon"))
print(sports.count)

var moreSports = Set(sports)
moreSports.insert("swimming")
print(moreSports)


//Set, can't store in order like array
var plants = Set<String>()
plants.insert("rose")
plants.insert("fern")
print(plants)


//DAY 5. IF CONDITIONS
var someCondition: Bool = true
if someCondition {
    print("Do something")
    print("Do something else")
}

//"<>=" comparison operator
let score = 85
if score > 80{
    print("Great job!")
}
    
    
let speed = 88
let percentage = 85
let age = 18

//let speed >= 88 {
//    print("Where we're going, we don't need roads.")
//}


let ourName = "Purple Reign"
let friendName = "Chimera"

if ourName < friendName {
    print("It's \(ourName) vs \(friendName)")
}

//numbers in array condition
var numbers = [1, 2, 3]
numbers.append(4)

//remove the oldest number in array
if numbers.count > 3 {
    numbers.remove(at:0)
    
    print(numbers)
}


//==
let country = "Canada"
if country == "Australia" {
    print ("Happy")
}

//!= --> not
let name = "Taylor Swift"
if name != "Anonymous"{
    print("Welcome, \(name)")
}

//Empty string, pair
var user1 = "Crystal"

//if user1 == "" {
//    user1 = "Anonymous"
//}
//
//if user1.count == 0{
//    user1 = "Anonymous"
//}
////boolen
//if user1.isEmpty == true {
//    user1 = "Anonymous"
//}

if user.isEmpty{
    user1 = "Anonymous"
}
print("Welcome, \(user1)")


if someCondition {
    print("This will run if the condition is true")
} else {
    print("This will run if the condition is false")
}

//&& -->"and"
// || --> "or"

enum TransportOption {
    case airplane, helicopter, bicycle, car, scooter
}
let transport = TransportOption.airplane
if transport == .airplane || transport == .helicopter {
    print("Let's fly!")
} else if transport == .bicycle {
    print("I hope there's a bike pathe...")
} else if transport == .car {
    print ("Time to get stuck in traffic...")
} else {
    print("Have to find another transport option...")
}

//switch
enum Weather {
    case sun, rain, wind, snow, unknown
}
let forecast = Weather.sun

//switch requires to cover all enum cases --> exaustive
switch forecast {
case .sun:
    print("It shoud be a nice day")
case .rain:
    print("Pack an umbrella.")
case .wind:
    print("Wear something warm.")
case .snow:
    print("School is cancelled.")
case .unknown:
    print("Our forecast generator is broken!")
}

//default case
let place = "Metropolis"

switch place {
case "Gotham":
    print("Your're Batman")
case "Mega-City One":
    print ("You're Judge Dread!!")
default:
    print("Who are you?")
}
//if switch cannot find anything from the list --> go to default
//default comes first, put it at bottom


//fall through - starting print from the designated point
let day = 4
print("My true love gave to me")
switch day {
case 5:
    print("5 golden rings")
    fallthrough
case 4:
    print("4 calling birds")
    fallthrough
case 3:
    print("3 french hens")
    fallthrough
case 2:
    print("2 turtle doves")
    fallthrough
default:
    print("A partridge in a pear tree")
}

//Ternary conditional operator for quick tests

//binary operator --> bind two pieces of input
//ternary operator --> bind three pieces of input

let age1 = 18
let canVote = age >= 18 ? "Yes" : "No"
//W (what are we checking)
//T (if true)
//F (if false)

let hour = 23
print(hour < 12 ? "It's before noon" : "It's afternnon")

let roommates = ["Crystal", "Simon", "Chuan"]
let roomCount = roommates.isEmpty ? "No one" : "\(name.count) people"
print(roomCount)


enum Theme {
    case light, dark
}
let theme = Theme.dark
let background = theme == .dark ? "black" : "white"
print(background)



//DAY 6. LOOP

