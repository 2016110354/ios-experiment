//
//  ViewController.swift
//  实验九.3
//
//  Created by Ru Zhao on 2018/11/25.
//  Copyright © 2018年 zhaoru. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{
     //page
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //拖动放大缩小
        //        scrollview.minimumZoomScale = 0.2//        scrollview.maximumZoomScale = 5
        scrollview.delegate = self
//        scrollview.delegate = self as? UIScrollVi÷ewDelegate
        //定义图片（7张）在view中
        for i in 1...7 {
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            //图片完全显示,内容
            imageView.contentMode = .scaleAspectFit
            //设置图片位置，竖屏划动展示
            imageView.frame = CGRect(x:CGFloat(i-1) * scrollview.bounds.width, y: 0, width: scrollview.bounds.width, height: scrollview.bounds.height)
            scrollview.addSubview(imageView)
            //完整一页翻页
            scrollview.isPagingEnabled = true
        }
        scrollview.contentSize = CGSize(width:  scrollview.bounds.width * 7, height: scrollview.bounds.height)
        scrollview.isPagingEnabled = true
        scrollview.showsHorizontalScrollIndicator = false
//        //定义图片
//        let imageView = UIImageView(image: UIImage(named: "1"))
//        //图片加载到视图
//        scrollview.addSubview(imageView)
//        //按照图片原来尺寸查看图片
//        scrollview.contentSize = ImageView.bounds.size

        //设置滚动条
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
//        //拖动放大缩小
//        func viewForZooning(in scrollView:UIScrollView) -> UIView? {
//            return scrollview.subviews.first
//        }
//
        //滚动条与图片
        func scrollViewDidEndDecerating(_ scrollView: UIScrollView) {
            pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.bounds.width)
        }
    }
    // 滚动条与图片对应
    @IBAction func pagecontrol(_ sender: UIPageControl) {
        let currentPage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentPage) * scrollview.bounds.width, y: 0, width: scrollview.bounds.width, height: scrollview.bounds.height)
        scrollview.scrollRectToVisible(rect, animated: true)
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x/scrollView.bounds.width
        pageControl.currentPage = Int(currentPage)
    }


}

