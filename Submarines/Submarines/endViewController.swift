//
//  endViewController.swift
//  Submarines
//
//  Created by Артем Антонов on 03.03.2024.
//

import UIKit

class endViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func startGameButtonPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    

}
