//
//  ViewController.swift
//  RunTimeDemo-Swift
//
//  Created by yunna on 2018/4/3.
//  Copyright © 2018年 yunna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FirstBtn: UIButton!
    @IBOutlet weak var SecondBtn: UIButton!
    @IBOutlet weak var ThirdBtn: UIButton!
    
    
    @IBOutlet weak var FirstLabel: UILabel!
    @IBOutlet weak var SecondLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.FirstLabel.isUserInteractionEnabled = true;
        self.SecondLabel.isUserInteractionEnabled = true;
        let tap = UITapGestureRecognizer(target: self, action: #selector(clickLabel1), timeInterval: 1)
        self.FirstLabel.addGestureRecognizer(tap)
        
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(clickLabel2))
        tap1.timeInterval = 2;
        self.SecondLabel.addGestureRecognizer(tap1)
        
        
        //扩大点击事件
        self.ThirdBtn.setEnlargeEdge(top: 20, right: 20, bottom: 20, left: 20)
        
        self.ThirdBtn.buttonParam = ["key":"value"]
      
    }

     
    
    @IBAction func FirstButtonEvent(_ sender: Any) {
        print("======\(self.CurrentStingTime())======");
    }
    
    
    @IBAction func SecondButtonEvent(_ sender: Any) {
        print("------\(self.CurrentStingTime())--------")
    }
    
  
    @IBAction func ThirdButtonEvent(_ sender: UIButton) {
        print("++++++++\(self.CurrentStingTime())+++++++++")
        print(sender.buttonParam ?? [])
    }
    
    
    @objc func clickLabel1(){
        print("第一个label:\(self.CurrentStingTime())")
        
    }
    @objc func clickLabel2(){
        print("第二个label:\(self.CurrentStingTime())")
    }
    
    
     func CurrentStingTime() -> String {
        let currentDate = Date.init()
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let dataString = dateFormatter.string(from: currentDate)
        
        return dataString
    }
    
    
}

