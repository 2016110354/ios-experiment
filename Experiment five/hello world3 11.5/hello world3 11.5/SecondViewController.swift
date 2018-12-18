//
//  SecondViewController.swift
//  HelloWorld
//
//  Created by liguiyang on 2018/10/17.
//  Copyright © 2018年 liguiyang. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let viewRect = CGRect(x: 100, y: 200, width: 200, height: 200)
        let view1 = MyCanvas(frame: viewRect)
        self.view.addSubview(view1)
        
        let button = UIButton(frame: CGRect(x: 150, y: 100, width: 100, height: 100))
        button.setTitle("close Me", for: .normal)
        // button.setTitle("I am focused", for: .highlighted)
        button.setTitleColor(UIColor.red, for: .normal)
        view.addSubview(button)
        //按钮方法
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
        self.title = "Second"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


class MyCanvas: UIView {
    override func draw(_ rect: CGRect) {
        UIColor.blue.setFill()
        let path = UIBezierPath(rect: self.bounds)
        path.fill()
    }
}

    
//        图像定义
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 100, width: 400, height: 400))
//        imageView.image =  UIImage(named: "HBuilder")
//        view.addSubview(imageView)
        //按钮定义


    //按钮触动方法
    @objc func btnClicked() {
//        presentingViewController?.dismiss(animated: true, completion: nil)
   navigationController?.pushViewController(ThirdViewController(), animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
