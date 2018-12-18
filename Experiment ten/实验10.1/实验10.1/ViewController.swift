//
//  ViewController.swift
//  实验10.1
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 zhaoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //定义两个视图
    var firstView: UIView!
    var secondView: UIView!
    
    //在使用UIDynamicAnimator时，需要声明初始化三个属性
    var animator:UIDynamicAnimator!
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //改变视图的位置,改变视图的大小,改变视图的transform
        animation()
        transition()
        dynamicAnimation()
        
    }
    //1.实现视图位置、大小、转换的改变。需要调用uiview的工厂方法
    func animation() {
        //创建view大小
        let view = UIView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        view.backgroundColor = UIColor.brown
        //添加
        self.view.addSubview(view)
        //完成动画所需要时间，延迟秒数，重复以及自动倒转
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat,.autoreverse,.layoutSubviews], animations: {
            view.frame = CGRect(x: 0, y: 20, width: 10, height: 10)
            view.backgroundColor = UIColor.red
            view.transform = view.transform.rotated(by: CGFloat.pi)
        }, completion: nil)
        
    }
  //改变视图的背景颜色；切换两个子视图，观察切换后视图层次的变化情况；
    
    func transition() {
        
        //定义一个button
        let button = UIButton(frame: CGRect(x: 0, y: 300, width: 100, height: 40))
        button.setTitle("切换视图", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        //将按钮添加到视图
        self.view.addSubview(button)
        
        //定义viewfirst
        firstView = UIView(frame: CGRect(x: 100, y: 300, width: 200, height: 200))
        firstView.backgroundColor = UIColor.purple
        self.view.addSubview(firstView)
        //定义viewscond
        secondView = UIView(frame: CGRect(x: 100, y: 300, width: 200, height: 200))
        secondView.backgroundColor = UIColor.orange
        self.view.addSubview(secondView)
        
    }
    //实现动画执行
    @objc func changeView(){
        UIView.transition(from: secondView, to: firstView, duration: 3, options: [.transitionCurlUp], completion: nil)
    }
    
    //UIGravityBehavior为重力的行为，UICollisionBehavior为碰撞的行为,方法中就可以随机产生一些视图添加到里面了
    // 可以掉落方块；有碰撞；可以反弹
    
    func dynamicAnimation(){
        animator = UIDynamicAnimator(referenceView: self.view)
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        collision.translatesReferenceBoundsIntoBoundary = true
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (t) in
            let x = CGFloat(arc4random() % (UInt32(self.view.frame.width) - 50))
            let view = UIView(frame: CGRect(x: x, y: 20, width: 50, height: 50))
            view.backgroundColor = UIColor.green
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 10
            self.view.addSubview(view)
            
            self.gravity.addItem(view)
            self.collision.addItem(view)
    }
    }


}

