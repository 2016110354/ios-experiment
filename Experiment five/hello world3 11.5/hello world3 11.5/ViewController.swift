//
//  ViewController.swift
//  hello world3 11.5
//
//  Created by Ru Zhao on 2018/11/5.
//  Copyright © 2018年 zhaoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.gray
        
        //lable定义
        
        let label = UILabel(frame: CGRect(x: 200, y: 200, width: 400, height: 200))
        label.text = "Hello World!"
        label.backgroundColor = UIColor.yellow
        label.textAlignment = .center
        label.center = view.center
        view.addSubview(label)
        
        
        let button = UIButton(frame: CGRect(x: 150, y: 100, width: 100, height: 100))
        button.setTitle("Click Me", for: .normal)
        //        button.setTitle("I am focused", for: .highlighted)
        button.setTitleColor(UIColor.green, for: .normal)
        view.addSubview(button)
        //button触动
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        
        self.title = "first"
        print("viewdidload")
    }
    //触动方法
    @IBAction func btnClicked() {
        if let label = view.subviews.first as? UILabel {
            label.text = "I am Clicked!"
        }
        
        self.navigationController?.pushViewController(SecondViewController(), animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }




