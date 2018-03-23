//
//  ViewController.swift
//  Tools
//
//  Created by 杨方明 on 17/3/15.
//  Copyright © 2017年 杨方明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initUI()
    }
    
    private func initUI() {
        self.view.backgroundColor = .white
        
        colorView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        colorView.center = self.view.center
        self.view.addSubview(colorView)
        
        let actionBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        actionBtn.center = self.view.center
        actionBtn.setImage(UIImage(named: "icon_C_1"), for: .normal)
        actionBtn.setTitle("Action", for: .normal)
        
        actionBtn.titleLabel?.textColor = UIColor.white
        actionBtn.backgroundColor = UIColor.darkGray
        actionBtn.layer.cornerRadius = 5.0
        actionBtn.addTarget(self, action: #selector(test), for: .touchUpInside)
        
        self.view.addSubview(actionBtn)
        
        let leftItem = UIBarButtonItem(title: "Back", tintColor: .darkGray, target: self, action: #selector(action))
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "icon_C_1"), target: self, action: #selector(action2))
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    @objc func test() {
        colorView.backgroundColor = UIColor.jlt.randomColor
    }
    
    @objc func action(btn: UIButton) {
        colorView.backgroundColor = UIColor.jlt.randomColorDeep
    }
    
    @objc func action2(btn: UIButton) {
        colorView.backgroundColor = UIColor.jlt.randomColorLight
    }
    
    
    private lazy var colorView: UIView = {
        return UIView()
    }()
}

