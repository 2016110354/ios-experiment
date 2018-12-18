//
//  ViewController.swift
//  workEight
//
//  Created by zhaoru on 2018/11/11.
//  Copyright © 2018年 2016110354. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var MyTableView: UITableView!
    @IBOutlet weak var chooseLable: UILabel!
    var tableTitile=["teacher","student"]
    var images=["baiyun","chengxi","furong","jinping","nangang","qilihe","shangjie","wuhou"]
    var students=[Student]()
    var teachers=[Teacher]()
    let stuONe=Student(firstName: "zr", lastName: "z", age: 8, gender: .female, stuNo: "01")
    let stuTwo=Student(firstName: "zzp", lastName: "z", age: 10, gender: .female, stuNo: "02")
    let stuThree=Student(firstName: "am", lastName: "a", age: 12, gender: .female, stuNo: "03")
    let stuFour=Student(firstName: "zf", lastName: "z", age: 20, gender: .female, stuNo: "04")
    let teacOne=Teacher(firstName: "yx", lastName: "y", age: 40, gender: .male, title: "教授")
    let teacTwo=Teacher(firstName: "lgy", lastName: "l", age: 41, gender: .female, title: "副教授")
    let teacThree=Teacher(firstName: "fg", lastName: "f", age: 42, gender: .male, title: "副教授")
    let teacFour=Teacher(firstName: "f", lastName: "f", age: 43, gender: .female, title: "教授")
    let addStudentAlert=UIAlertController(title: "添加学生", message:nil, preferredStyle: .alert)
      let addTeacherAlert=UIAlertController(title: "添加老师", message: nil, preferredStyle: .alert)
    let editStudentAlertOne=UIAlertController(title: "修改id", message: nil, preferredStyle: .alert)
     let editStudentAlertTwo=UIAlertController(title: "修改fristName", message: nil, preferredStyle: .alert)
    let editTeacherAlertOne=UIAlertController(title: "修改职称", message: nil, preferredStyle: .alert)
    let editTeacherAlertTwo=UIAlertController(title: "修改fristName", message: nil, preferredStyle: .alert)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return teachers.count
        } else {
            return students.count
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableTitile.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableTitile[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = tableTitile[indexPath.section]
        let studentCell:StudentTableViewCell=tableView.dequeueReusableCell(withIdentifier: "studentView") as! StudentTableViewCell
        let teacherCell = tableView.dequeueReusableCell(withIdentifier: "teacherView") as! TeacherTableViewCell
      
        if identifier=="teacher"
        {
            let tec=teachers[indexPath.row]
           teacherCell.teacherFirstNmae.text = tec.lastName+tec.firstName
            teacherCell.teacherTitleLable.text=tec.title
            teacherCell.teacherImage.image=UIImage(named: images[indexPath.row%7])
    teacherCell.teacherImage.layer.cornerRadius=teacherCell.teacherImage.frame.size.width/2
            teacherCell.teacherImage.clipsToBounds=true
             return teacherCell
        }
        else
        {
            
            let stu=students[indexPath.row]
            studentCell.studentId.text=stu.stuNo
            studentCell.studentFirstName.text=stu.lastName+stu.firstName
           studentCell.studentImge.image=UIImage(named: images[7-indexPath.row%7])
            studentCell.studentImge.layer.cornerRadius=studentCell.studentImge.frame.size.width/2
           studentCell.studentImge.clipsToBounds=true
            return studentCell
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        students.append(stuONe)
        students.append(stuTwo)
        students.append(stuThree)
        students.append(stuFour)
        teachers.append(teacOne)
        teachers.append(teacTwo)
        teachers.append(teacThree)
        teachers.append(teacFour)
       
        addStudentAlert.addTextField{(textField) in
            textField.placeholder="输入您的ID"
        }
        addStudentAlert.addTextField{(textField) in
            textField.placeholder="输入输入你的firstName"
        }
        addStudentAlert.addTextField{(textField) in
            textField.placeholder="输入输入你的lastName"
        }
        addStudentAlert.addTextField{(textField) in
            textField.placeholder="输入您的性别"
        }
        addStudentAlert.addTextField{(textField) in
            textField.placeholder="输入你的年龄"
        }
        addStudentAlert.addAction(UIAlertAction(title: "添加", style: .default, handler:{(action) in self.studentAdd() }))
           addStudentAlert.addAction(UIAlertAction(title: "取消", style: .default, handler:nil))
        editTeacherAlertOne.addTextField{(textField) in
            textField.placeholder="请输入修改后的职称"
        }
        editTeacherAlertTwo.addTextField{(textField) in
            textField.placeholder="请输入修改后的fristName"
        }
        editTeacherAlertOne.addAction(UIAlertAction(title: "确定", style: .default, handler: {(action)
            in self.editTeacherOne()
        }))
        editTeacherAlertOne.addAction(UIAlertAction(title: "取消", style: .default, handler: nil
        ))
        editTeacherAlertTwo.addAction(UIAlertAction(title: "确定", style: .default, handler: {(action)
            in self.editTeacherTwo()
        }))
        editTeacherAlertTwo.addAction(UIAlertAction(title: "取消", style: .default, handler: nil
        ))
        
        
        
       editStudentAlertOne.addTextField{(textField) in
            textField.placeholder="请输入修改后的职称"
        }
        editStudentAlertTwo.addTextField{(textField) in
            textField.placeholder="请输入修改后的fristName"
        }
        editStudentAlertOne.addAction(UIAlertAction(title: "确定", style: .default, handler: {(action)
            in self.editStudentOne()
        }))
       editStudentAlertOne.addAction(UIAlertAction(title: "取消", style: .default, handler: nil
        ))
       editStudentAlertTwo.addAction(UIAlertAction(title: "确定", style: .default, handler: {(action)
            in self.editStudentTwo()
        }))
        editStudentAlertTwo.addAction(UIAlertAction(title: "取消", style: .default, handler: nil
        ))
        

        
        addTeacherAlert.addTextField{(textField) in
            textField.placeholder="输入您的职称"
        }
        addTeacherAlert.addTextField{(textField) in
            textField.placeholder="输入输入你的firstName"
        }
        addTeacherAlert.addTextField{(textField) in
            textField.placeholder="输入输入你的lastName"
        }
        addTeacherAlert.addTextField{(textField) in
            textField.placeholder="输入您的性别"
        }
        addTeacherAlert.addTextField{(textField) in
            textField.placeholder="输入你的年龄"
        }
        addTeacherAlert.addAction(UIAlertAction(title: "添加", style: .default, handler:{(action) in self.teacherAdd()}))
           addTeacherAlert.addAction(UIAlertAction(title: "取消", style: .default, handler:nil))

    }
    func editTeacherOne()
    {
        guard let zhicheng=editTeacherAlertOne.textFields?.first?.text
        else
        {
           
            return
        }
           teachers[(MyTableView.indexPathForSelectedRow?.row)!].title=zhicheng
          MyTableView.reloadData()
    }
    func editTeacherTwo()
    {
        guard let firstName=editTeacherAlertTwo.textFields?.first?.text
            else
        {
            return
        }
        teachers[(MyTableView.indexPathForSelectedRow?.row)!].firstName=firstName
          MyTableView.reloadData()
    }
    func editStudentOne()
    {
        guard let id=editStudentAlertOne.textFields?.first?.text else {
            return
        }
        students[(MyTableView.indexPathForSelectedRow?.row)!].stuNo=id
        MyTableView.reloadData()
    }
    func editStudentTwo()
    {
        guard let firstName=editStudentAlertTwo.textFields?.first?.text else {
            return
        }
        students[(MyTableView.indexPathForSelectedRow?.row)!].firstName=firstName
        MyTableView.reloadData()
    }
    func studentAdd() {
        guard let studentId = addStudentAlert.textFields![0].text,   let studentFristName = addStudentAlert.textFields![1].text, let studentLastName = addStudentAlert.textFields![2].text,let age = Int(addStudentAlert.textFields![4].text!) else {
            return
        }
       
        
        let studentgender: Gender
        switch addStudentAlert.textFields![3].text! {
        case "男":
            studentgender = .male
        case "女":
            studentgender = .female
        default:
            studentgender = .female
        }
        
        let student = Student(firstName: studentFristName, lastName: studentLastName, age: age, gender: studentgender, stuNo:studentId)
        addStudentAlert.textFields![0].resignFirstResponder()
       addStudentAlert.textFields![1].resignFirstResponder()
        addStudentAlert.textFields![2].resignFirstResponder()
        addStudentAlert.textFields![3].resignFirstResponder()
        students.append(student)
        MyTableView.reloadData()
    }
    func teacherAdd() {
        guard let teacherTitle = addTeacherAlert.textFields![0].text,   let teacherFristName = addTeacherAlert.textFields![1].text, let teacherLastName = addTeacherAlert.textFields![2].text,let age = Int(addTeacherAlert.textFields![4].text!) else {
            return
        }
        
        
        let teachergender: Gender
        switch addTeacherAlert.textFields![3].text! {
        case "男":
            teachergender = .male
        case "女":
            teachergender = .female
        default:
            teachergender = .female
        }
        
        let teacher = Teacher(firstName: teacherFristName, lastName: teacherLastName, age: age, gender: teachergender, title:teacherTitle)
        addTeacherAlert.textFields![0].resignFirstResponder()
        addTeacherAlert.textFields![1].resignFirstResponder()
        addTeacherAlert.textFields![2].resignFirstResponder()
        addTeacherAlert.textFields![3].resignFirstResponder()
       teachers.append(teacher)
        MyTableView.reloadData()
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addBtn(_ sender: UIButton) {
        let alert=UIAlertController(title: nil, message: nil, preferredStyle:.actionSheet)
        alert.addAction(UIAlertAction(title: "添加老师", style: .destructive, handler:{ (action) in
            self.present(self.addTeacherAlert, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "添加学生", style: .destructive, handler:{ (action) in
            self.present(self.addStudentAlert, animated: true, completion: nil)
        }))

      
        self.present(alert, animated: true, completion: nil)
    }
   
   
    @IBAction func editBtn(_ sender: Any) {
      
        guard let section=MyTableView.indexPathForSelectedRow?.section else {
            return
        }
        if section==0
        {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "修改职称", style: .default, handler: {(action) in
                self.present(self.editTeacherAlertOne, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "修改fristName", style: .default, handler: {(action) in
                self.present(self.editTeacherAlertTwo, animated: true, completion: nil)
            }))
        self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "修改id", style: .default, handler: {(action) in
                self.present(self.editStudentAlertOne, animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "修改fristName", style: .default, handler: {(action) in
                self.present(self.editStudentAlertTwo, animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    @IBAction func deleteBtn(_ sender: UIButton) {
        MyTableView.isEditing = !MyTableView.isEditing
        
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return  .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            if indexPath.section == 0 {
                teachers.remove(at: indexPath.row)
            } else {
                students.remove(at: indexPath.row)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let identifier = tableTitile[indexPath.section]
        if identifier=="teacher"
        {
             chooseLable.text="You choose Teacher\(teachers[indexPath.row].lastName)\(teachers[indexPath.row].firstName)"
        }
        else
        {
             chooseLable.text="You choose Student\(students[indexPath.row].lastName)\(students[indexPath.row].firstName)"
        }
        
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath.section != destinationIndexPath.section {
            tableView.reloadData()
        } else {
            if sourceIndexPath.section == 0 {
                teachers.insert(teachers.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
            } else {
                students.insert(students.remove(at: sourceIndexPath.row), at: destinationIndexPath.row)
            }
        }
    }


}

