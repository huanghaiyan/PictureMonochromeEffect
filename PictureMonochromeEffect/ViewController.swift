//
//  ViewController.swift
//  PictureMonochromeEffect
//
//  Created by 黄海燕 on 16/4/22.
//  Copyright © 2016年 huanghy. All rights reserved.
//

import UIKit

//首先导入要使用的CoreImage框架。该框架提供了强大和高效的图像处理功能，用来对基于像素的图像进行分析处理
import CoreImage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image = UIImage(named: "1.jpg")
        let imageView = UIImageView(image: image)
        self.view.addSubview(imageView)
        //初始化一个CoreImage图像对象，并加载之前导入的图片
        let ciimage = CIImage(image: image!)
        //初始化一个颜色对象，并设置其颜色值为棕色，七参数值介于0和1之间
        let color = CIColor(red: 0.8,green: 0.6,blue: 0.4)
        //初始化一个滤镜对象，并设置滤镜类型为单色滤镜
        let filter = CIFilter(name: "CIColorMonochrome")
        //设置单色调滤镜的输入颜色值
        filter?.setValue(color, forKey: kCIInputColorKey)
        //设置单色调滤镜的颜色浓度值
        filter?.setValue(1.0, forKey: kCIInputIntensityKey)
        //设置需要应用单色调滤镜的图像
        filter?.setValue(ciimage, forKey: kCIInputImageKey)
        //获得应用单色调滤镜后的图像
        let outImage = filter?.outputImage
        //更改图像视图的内容，为应用滤镜后的图像
        imageView.image = UIImage(CIImage: outImage!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

