//
//  ViewController.swift
//  6.2
//
//  Created by Ru Zhao on 2018/11/10.
//  Copyright © 2018年 zhaoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //视图模块
        let yelloView = UIView()
        yelloView.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        let greenView = UIView()
        greenView.backgroundColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        let zongView = UIView()
        zongView.backgroundColor = #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        //模块加入总的stack视图，视图属性设置
        let stackView = UIStackView(arrangedSubviews: [yelloView,greenView,zongView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        
//        stackView.frame = CGRect(x: 20, y: 20, width: 200, height: 400)
        view.addSubview(stackView)
    stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

}

