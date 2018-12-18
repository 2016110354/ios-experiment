//
//  ViewController.swift
//  实验九.2
//
//  Created by Ru Zhao on 2018/11/25.
//  Copyright © 2018年 zhaoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func actionsheet(_ sender: Any) {
        //定alert
        let alert = UIAlertController(title: "action sheet", message: "please choose color", preferredStyle: .actionSheet)
        //定义按钮点击之后事件(颜色切换)
        alert.addAction(UIAlertAction(title: "cyan", style: .default, handler: {(action) in self.view.backgroundColor = UIColor.cyan}))
        alert.addAction(UIAlertAction(title: "lightGray", style: .default, handler: {(action) in self.view.backgroundColor = UIColor.lightGray}))
        alert.addAction(UIAlertAction(title: "brown", style: .default, handler: {(action) in self.view.backgroundColor = UIColor.brown}))
        alert.addAction(UIAlertAction(title: "purple", style: .default, handler: {(action) in self.view.backgroundColor = UIColor.purple}))
        alert.addAction(UIAlertAction(title: "white", style: .default, handler: {(action) in self.view.backgroundColor = UIColor.white}))
        
        present(alert, animated: true, completion: nil)
    
    }
    
    @IBAction func alert(_ sender: Any) {
        //定义alert
        let alert = UIAlertController(title: "Alert", message: "login message", preferredStyle: .alert)
        //按钮触发事件 登陆（用户名，密码）
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: {(action) in guard let username = alert.textFields?.first?.text,let password = alert.textFields?.last?.text else{
            return
            }
            //输出用户基本信息
            print("username=\(username) password=\(password)")
        }))
        //触发事件
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action) in }))
        alert.addTextField {(textField) in textField.placeholder = "your user name?"}
        alert.addTextField{(textField) in textField.placeholder = "Your password?"
            textField.isSecureTextEntry = true
        }
        present(alert, animated: true, completion: nil)
        
    }
}


