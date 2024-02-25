import UIKit

class ViewController: UIViewController {
    
    let squarebuttonPressed = UIButton()
    let width = 100
    let height = 100
    var countWidthSquare = 0
    var countHeightSquare = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton(button: self.squarebuttonPressed)
    }
    
    func createButton(button: UIButton) {
        button.frame = CGRect(x: 0, y: self.view.frame.size.height-100, width: self.view.frame.size.width, height: 100)
        button.setTitle("Add square", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(addSqure), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    func createView(x: Int, y:Int) {
        let view = UIView()
        view.frame = CGRect(x: x, y: y, width: self.width, height: self.height)
        view.backgroundColor = UIColor(hue: Double.random(in: 0...1), saturation: Double.random(in: 0...1), brightness: Double.random(in: 0...1), alpha: 1)
        self.view.addSubview(view)
    }
    
    @objc func addSqure() {
        
            if ((countWidthSquare+1)*width <= Int(self.view.frame.size.width)) {
                createView(x: countWidthSquare*width, y: countHeightSquare*height)
                countWidthSquare+=1
            }
        else if ((countHeightSquare+2)*height <= Int(self.view.frame.size.height-100)) {
                countWidthSquare=0
                countHeightSquare+=1
            createView(x: countWidthSquare*width, y: countHeightSquare*height)
            countWidthSquare+=1
            }
            
            
    }
    
    

}

