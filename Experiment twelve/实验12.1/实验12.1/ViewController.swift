//
//  ViewController.swift
//  实验12.1
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 zhaoru. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    let db = SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //返回是否打开表的结果
        //        let result =  SQLiteDB.shared.open(dbPath: "", copyFile: true)
        let result = db.open(dbPath: "", copyFile: true)
        print("result:\(result)")
        let r = db.execute(sql: "create table if not exists person(name carchar(20),phone varchar(20))")
        print("result:\(r)")
        //可写
        print(NSHomeDirectory())
        //只读沙盒
        print(Bundle.main.bundlePath)
    }
    @IBAction func add(_ sender: Any) {
        let r = db.execute(sql: "insert into person(name,phone) values('\(tfName.text!)','\(tfPhone.text!)')")
        print("result:\(r)")
//        SQLiteDB.shared.execute(sql: "")
    }
    @IBAction func update(_ sender: Any) {
    let r = db.execute(sql: "update person set phone = '\(tfPhone.text!)' where name = '\(tfName.text!)'")
        print("result:\(r)")
    }
    @IBAction func del(_ sender: Any) {
        let r = db.execute(sql: "delete from person where name ='\(tfName.text!)'")
        print("result:\(r)")
    }
    @IBAction func query(_ sender: Any) {
        let persons = db.query(sql:" select * from person where name = '\(tfName.text!)'")
        if let person = persons.first,let phone = person["phone"] as? String {
            tfPhone.text = phone
        }
    }
    


}

