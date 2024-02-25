import UIKit

class ViewController: UIViewController {
    
    let aroundButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createButton(button: aroundButton)
        
    }
    
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
        var red = Double.random(in: 0...1)
        var green = Double.random(in: 0...1)
        var blue = Double.random(in: 0...1)
        sender.backgroundColor = UIColor(hue: red, saturation: green, brightness: blue, alpha: 1)
    }

}

