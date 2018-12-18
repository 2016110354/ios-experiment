//: Playground - noun: a place where people can play

import UIKit

// 性别枚举
enum Gender:Int {
    case male    //男性
    case female  //女性
    case unknow  //未知
    //重载>操作符，排序
    static func > (gr:Gender,br:Gender) -> Bool {
        return gr.rawValue < br.rawValue
    }
}
//人类
class Person:CustomStringConvertible {
    
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String {
        get {
            return  firstName + lastName
        }
    }
    //构造方法
    init(firstName:String,lastName:String,age:Int,gender:Gender) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
    }
    //便利构造函数；
    convenience init(firstName: String, age: Int, gender: Gender) {
        self.init(firstName: firstName, lastName: "", age: age, gender: gender)
    }
    
    
    convenience init(firstName: String,age:Int) {
        self.init(firstName: firstName, age: age, gender: Gender.unknow)
    }
    
    //required convenience init() {
    //    self.init(firstName: "")
    //}
    
    static func ==(fi:Person,se:Person) -> Bool {
        return fi.fullName == se.fullName && fi.age == se.age && fi.gender == se.gender
    }
    //使用重载两个Person实例对象,!==
    static func !=(fi:Person,se:Person) -> Bool {
        return !(fi==se)
    }
    //实现CustomStringConvertible协议中的计算属性，可以使用print直接输出对象内容
    var description: String {
        return "fullName: \(self.fullName),age:\(self.age),gender:\(self.gender)"
    }
}

var a1 = Person(firstName: "梓", age: 21)
var a2 = Person(firstName: "王", age: 22, gender: .male)
print(a1)
print(a1 == a2)
print(a1 != a2)

//老师类
    class Teacher: Person {
        var title:String
        //构造方法
        init(title:String,firstName: String, lastName: String, age: Int, gender: Gender) {
            self.title=title
            super.init(firstName: firstName, lastName: lastName, age:age, gender: gender)
        }
        //重写父类计算属性
        override var description: String {
            return "title: \(self.title),fullName: \(self.fullName),age: \(self.age),gender:\(self.gender)"
        }
 }
var b1=Teacher(title: "class", firstName: "王", lastName: "麻子", age: 34, gender: .male)
print(b1)

//学生类1个
class Student:Person {
    var stuNo:Int
    init(stuNo:Int,firstName: String, lastName: String, age: Int, gender: Gender) {
        self.stuNo=stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    //重写父类计算属性
    override var description: String {
        return "stuNo: \(self.stuNo),fullName: \(self.fullName),age: \(self.age),gender:\(self.gender)"
    }
}
var c1=Student(stuNo: 2016110354, firstName: "胡", lastName: "还", age: 55, gender: .male)
print(c1)

//数组操作,初始化一个空的数组

var newArray = [Person]()
//生成5个Person对象
for i in 1...5 {
    let team = Person(firstName: "榨", lastName: "\(i)", age: 20, gender: .male)
    newArray.append(team)
}
//生成4个Teacher对象
for i in 1...4 {
    let team = Teacher(title: "Hello", firstName: "周", lastName: "\(i)", age: 33, gender: .female)
    newArray.append(team)
}
//生成6个Student对象
for i in 1...6 {
    let team = Student(stuNo: 2016110300, firstName: "王", lastName: "\(i)", age: 22, gender: .male)
    newArray.append(team)
}
//定义一个字典，用于统计每个类的对象个数
var direct = ["Person":0,"Teacher":0,"Student":0]

for item in newArray {
    //判断是否是teacher类
    if item is Teacher {
        direct["Teacher"]! += 1
        //判断是否是Student类
    }else if item is Student {
        direct["Student"]! += 1
        //判断是否是Person类
    }else {
        direct["Person"]! += 1
    }
}
//输出字典值
print("------------------------------")
for (key,value) in direct {
    print("\(key) has \(value) items")
}

//输出原始数组
print("------------------------------")
for item in newArray {
    print(item)
}
//根据age从大到小排序
print("------------------------------")
newArray.sort{return $0.age > $1.age}
for item in newArray{
    print(item)
}

//根据全名从前往后排序
print("------------------------------")
newArray.sort { return $0.fullName < $1.fullName}
for item in newArray {
    print(item)
}
//根据gender和age从大往小排序
print("------------------------------")
newArray.sort {
    return ($0.gender > $1.gender) && ($0.age > $1.age) }
    for item in newArray {
    print(item)
}

