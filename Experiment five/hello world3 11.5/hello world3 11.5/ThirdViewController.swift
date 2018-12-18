//
//  ThirdViewController.swift
//  HelloWorld
//
//  Created by liguiyang on 2018/10/17.
//  Copyright © 2018年 liguiyang. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Third"
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        let imageView = UIImageView(frame: CGRect(x: 10, y: 300, width: 400, height: 400))
        imageView.image =  UIImage(named: "Smile")
        view.addSubview(imageView)
        //按钮定义
        let button = UIButton(frame: CGRect(x: 150, y: 100, width: 100, height: 100))
        button.setTitle("begin", for: .normal)
        //        button.setTitle("I am focused", for: .highlighted)
        button.setTitleColor(UIColor.black, for: .normal)
        view.addSubview(button)
        //按钮方法
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.title = "Third"
        // Do any additional setup after loading the view.
    }
    //按钮触动方法
    @IBAction func btnClicked() {
        //        presentingViewController?.dismiss(animated: true, completion: nil)
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


