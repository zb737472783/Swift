							简单值
let 常量
var 变量 

如果初始值没有提供足够的信息（或者没有初始值），那你需要在变量后面声明类型，用冒号分割
	let explicitDouble:Double = 70

值永远不会被隐式转换为其他类型。如果你需要把一个值转换成其他类型，请显式转换
	let label = "The width is" 
	let width = 94
	let widthLabel = label + String(width) 

有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠
	let apples = 3 
	let oranges = 5
	let appleSummary = "I have \(apples) apples." 
	let fruitSummary = "I have \(apples + oranges) pieces of fruit." 

字典根据 key 取值
	occupations["Jayne"] = "Public Relations" 

let emptyArray = String[]()  //初始化空数组
let emptyDictionary = Dictionary<String, Float>()  //初始化空字典

如果类型信息可以被推断出来，你可以用[]和[:]来创建空数组和空字典

包裹条件和循环变量括号可以省略，但是语句体的大括号是必须的
	let individualScores = [75, 43, 103, 87, 12] 
	var teamScore = 0 
	for score in individualScores { 
   		 if score > 50 { 
       	 		teamScore += 3 
   	 	} else { 
      	  		teamScore += 1 
  	  	} 
	} 
	teamScore 

有些变量的值是可选的。一个可选的值可能是一个具体的值或者是nil，表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的
	var optionalString: String? = "Hello" 
	optionalString == nil 
	var optionalName: String? = "John Appleseed" 
	var greeting = "Hello!" 
	if let name = optionalName { 
	    greeting = "Hello, \(name)" 
	}

switch支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。运行switch中匹配到的子句之后，程序会退出switch语句，并不会继续向下运行，所以不需要在每个子句结尾写break。
let vegetable = "red pepper" 
switch vegetable { 
case "celery": 
    let vegetableComment = "Add some raisins and make ants on a log." 
case "cucumber", "watercress": 
    let vegetableComment = "That would make a good tea sandwich." 
case let x where x.hasSuffix("pepper"): 
    let vegetableComment = "Is it a spicy \(x)?" 
default: 
    let vegetableComment = "Everything tastes good in soup." 
} 

使用for-in来遍历字典，需要两个变量来表示每个键值对。 
let interestingNumbers = [ 
    "Prime": [2, 3, 5, 7, 11, 13], 
    "Fibonacci": [1, 1, 2, 3, 5, 8], 
    "Square": [1, 4, 9, 16, 25], 
] 
var largest = 0 
for (kind, numbers) in interestingNumbers { 
    for number in numbers { 
        if number > largest { 
            largest = number 
        } 
    } 
} 
largest 

可以在循环中使用..来表示范围，也可以使用传统的写法，两者是等价的
使用..创建的范围不包含上界，如果想包含的话需要使用...
var firstForLoop = 0 
for i in 0..3 { 
    firstForLoop += i 
} 
firstForLoop 
  
var secondForLoop = 0 
for var i = 0; i < 3; ++i { 
    secondForLoop += 1 
} 
secondForLoop 


						函数和闭包
使用func来声明一个函数，使用名字和参数来调用函数。使用->来指定函数返回值。
func greet(name: String, day: String) -> String { 
    return "Hello \(name), today is \(day)." 
} 
greet("Bob", "Tuesday") 

使用一个元组来返回多个值
func getGasPrices() -> (Double, Double, Double) { 
    return (3.59, 3.69, 3.79) 
} 
getGasPrices() 

函数的参数数量是可变的，用一个数组来获取它们
func sumOf(numbers: Int...) -> Int { 
    var sum = 0 
    for number in numbers { 
        sum += number 
    } 
    return sum 
} 
sumOf() 
sumOf(42, 597, 12) 

函数可以嵌套。被嵌套的函数可以访问外侧函数的变量，你可以使用嵌套函数来重构一个太长或者太复杂的函数。
func returnFifteen() -> Int { 
    var y = 10 
        func add() { 
        y += 5 
    } 
    add() 
    return y 
} 
returnFifteen() 

函数是一等公民，这意味着函数可以作为另一个函数的返回值。
func makeIncrementer() -> (Int -> Int) { 
    func addOne(number: Int) -> Int { 
        return 1 + number 
    } 
    return addOne 
} 
var increment = makeIncrementer() 
increment(7) 

函数也可以当做参数传入另一个函数。
func hasAnyMatches(list: Int[], condition: Int -> Bool) -> Bool { 
    for item in list { 
        if condition(item) { 
            return true 
        } 
    } 
    return false 
} 
func lessThanTen(number: Int) -> Bool { 
    return number < 10 
} 
var numbers = [20, 19, 7, 12] 
hasAnyMatches(numbers, lessThanTen) 

函数实际上是一种特殊的闭包，你可以使用{}来创建一个匿名闭包。使用in来分割参数并返回类型。
numbers.map({ 
    (number: Int) -> Int in 
    let result = 3 * number 
    return result 
    }) 

    有很多种创建闭包的方法。如果一个闭包的类型已知，比如作为一个回调函数，你可以忽略参数的类型和返回值。单个语句闭包会把它语句的值当做结果返回。

    你可以通过参数位置而不是参数名字来引用参数——这个方法在非常短的闭包中非常有用。当一个闭包作为最后一个参数传给一个函数的时候，它可以直接跟在括号后面。
sort([1, 5, 3, 12, 2]) { $0 > $1 } 