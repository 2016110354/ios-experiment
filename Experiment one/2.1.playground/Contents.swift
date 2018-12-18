//: Playground - noun: a place where people can play


//: [Previous](@previous)

import Foundation

func newArray() -> [Int] {
    //定义可变数组
    var changeArray = [2,3]
    //记录判断是否为质数
    var isPrim = 0 
    for number in 4...10000{
        for number1 in 2..<number{
            if number%number1==0{
                isPrim+=1
                break
            }
        }
        if isPrim==0 {
            changeArray.append(number)
        }
        isPrim=0
    }
    return changeArray
}
var oldArray=newArray()
//升序排序
oldArray.sort()
print("数组升序排列所得数组为：")
print(oldArray)
//降序排列一共有六种方法
func compare(m:Int,n:Int) -> Bool {
    return m>n
}
oldArray.sort(by:compare)
print("第一种数组降序排列所得数组为：")
print(oldArray)

oldArray.sort(by:{
    (m:Int,n:Int) -> Bool in
    return m>n
})
print("第二种数组降序排列所得数组为：")
print(oldArray)

oldArray.sort{
    (m,n) -> Bool in
    return m>n
}
print("第三种数组降序排列所得数组为：")
print(oldArray)

oldArray.sort{(m,n) in
    return m>n
}
print("第四种数组降序排列所得数组为：")
print(oldArray)

oldArray.sort(by:>)
print("第五种数组降序排列所得数组为：")
print(oldArray)

oldArray.sort{$0>$1}
print("第六种数组降序排列所得数组为：")
print(oldArray)

