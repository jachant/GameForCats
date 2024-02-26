//
//  secondViewController.swift
//  GameForCats
//
//  Created by Артем Антонов on 26.02.2024.
//

import UIKit

class secondViewController: UIViewController {
    
    //MARK: -let/var
    let aroundButton = UIButton()
    
    //MARK: -lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton(button: aroundButton)
        
    }
    //MARK: -func and buttons
    
    func createButton(button: UIButton) {
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        button.layer.cornerRadius = button.frame.width/2
        button.backgroundColor = .green

        //button.setTitle("Test button", for: .normal)
        button.addTarget(self, action: #selector(changeCoordinates), for: .touchUpInside)
        self.view.addSubview(button)
       
    }
    
    @objc func changeCoordinates(sender: UIButton!) {
        sender.frame.origin.x = CGFloat(Int.random(in: 0...(Int(self.view.frame.width)-Int(sender.frame.size.width))))
        sender.frame.origin.y = CGFloat(Int.random(in: 0...(Int(self.view.frame.height)-Int(sender.frame.size.height))))
        sender.backgroundColor = UIColor(hue: Double.random(in: 0...1), saturation: Double.random(in: 0...1), brightness: Double.random(in: 0...1), alpha: 1)
    }
    
}
