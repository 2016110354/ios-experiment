//: Playground - noun: a place where people can play

import UIKit
//给定一个Dictionary数组，Dictionary包含key值name和key值age，用map函数返回name字符串数组
var dictionti = ["name":"王逸","age":20] as [String : Any]
var dictionti1 = ["name":"于洋","age":22] as [String : Any]
let Dictionaryre = [dictionti,dictionti1].map {
    return $0["name"]!
}

//给定一个String数组，用filter函数选出能被转成Int的字符串
let stringin = ["qw","999","ty","3","jk"].filter{return Int($0) != nil
}
print(stringin)
//用reduce函数把String数组中元素连接成一个字符串，以逗号分隔
let stringin1 = ["yu","fef","hello"].reduce("") {
    return $0 + "," + $1
}

print(stringin1)
//用 reduce 方法一次求出整数数组的最大值、最小值、总数和
var newArray = [23,56,14,7,9,0]
let item = newArray.reduce((max:Int.min, min:Int.max, sum:0)){
    (item,i) in
    return (max(item.max,i),min(item.min,i),item.sum+i)
}
print("最大值为:\(item.max)")
print("最小值为:\(item.min)")
print("总数和为:\(item.sum)")

//新建一个函数数组，函数数组里面保存了不同函数类型的函数，要求从数组里找出参数为一个整数，返回值为一个整数的所有函数；
func arr1() -> Int {
    return 1
}
func arr2(x:Int) -> Int {
    print("参数整型，返回整型")
    return 2
}
func arr3(x:Double) -> Int {
    return 3
}
func arr4(x:Double) -> Double {
    return 4
}
let arr = [arr1,arr2,arr3,arr4].filter{return $0 is (Int) -> Int}
for (index,_) in arr.enumerated() {
    print(" 符合参数为整数，返回值为整数的函数下标为:\(index)")
}
//扩展Int，增加sqrt方法，可以计算Int的Sqrt值并返回浮点数，进行验证；
extension Int {
    mutating func sqrt() -> Double {
        let m1:Double = Double(self)
        let m2:Double = m1*m1
        return m2
    }
}
var x:Int = 2
print(x.sqrt())
//实现一个支持泛型的函数，该函数接受任意个变量并返回最大和最小值，分别传入整数值、浮点数值、字符串进行验证。dex)")
func searchMaxAndMin<T:Comparable>(data:[T])->(max:T,min:T){
    var max = data[0]
    var min = data[0]
    for i in data{
        if max < i{
            max = i
        }else if min > i{
            min = i
        }
    }
    return (max,min)
}
let tempInt = searchMaxAndMin(data:[8,10,6,33])
print("传入整数时最大值为:\(tempInt.max),最小值为:\(tempInt.min)")

let tempDouble = searchMaxAndMin(data:[11.2,33.9,9.0,7,7])
print("传入浮点数时最大值为:\(tempDouble.max),最小值为:\(tempDouble.min)")

let tempString = searchMaxAndMin(data:["R","X","L"])
print("传入字符串时：最大为:\(tempString.max),最小值为：\(tempString.min)")


