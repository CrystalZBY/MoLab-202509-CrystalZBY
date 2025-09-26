import UIKit

//DAY 6 - LOOPS
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

//Loop body
//loop iteration: number of times loop accross the loop body --> 4 loop iterations
//"os": loop variable --> name of the loop
for os in platforms {
    print("Swift works great on \(os).")
}

//"1...12": range, between the numbers
for i in 1...12{
    print("5 x \(i) = \(5*i)")
}

//nested loop: loop in loop
for i in 1...12{
    print("The \(i) times table")
    
    for j in 1...12{
        print("    \(j) x \(i) is \(j * i)")
    }
//  print a new line
    print()
}

//count, but not including the last number
for i in 1..<5{
    print("Counting from 1 up to 5: \(i)")
}
//useful for array, count from 0

//run certain number of time, but does matter what is the loop variable
var lyric = "Swift is awesome!"

for _ in 1...5{
    lyric += " 🎶"
}
print(lyric)



//"while" loop: run again and again until false
//less common and useful
//useful when don't know how many times the loop will run

var countdown = 10

//start at 10, print number -1 until it gets 0
while countdown > 0{
    print("\(countdown)...")
    countdown -= 1
}

print("Blast off!")
//end loop


let id = Int.random(in: 1...1000)
let amount = Double.random(in: 0...1)

var roll = 0

while roll != 20 {
    roll = Int.random(in: 1...20)
    print("I rolled a \(roll)")
}
print("Critical hit!")


//Skip loop items with break and continue
//"continue": stop loop iteration, carry on the one afterwards
let filenames = ["me.jpg", "work.txt", "sophie.jpg"]
for filename in filenames {
    if filename.hasSuffix(".jpg") == false {
        continue
    }
}

//"break": exit the loop immediately
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100000{
    if i.isMultiple(of: number1) && i.isMultiple(of: number2){
        multiples.append(i)
        if multiples.count == 10 {
            break
        }
    }
}

print(multiples)


//SUMMARY
for i in 1...100 {
    if i.isMultiple(of: 3) {
        print("Fizz")
    }else if i.isMultiple(of: 5) {
        print("Buzz")
    }else if i.isMultiple(of: 3) && i.isMultiple(of: 5){
        print("FizzBuzz")
    }else {
        print(i)
    }
}
