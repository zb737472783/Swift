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
						