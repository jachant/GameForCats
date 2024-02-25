import UIKit

enum Buttons {
    case plus
    case start
    case dif
}

class ViewController: UIViewController {
    //MARK: -IBOOutlet
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var startButtom: UIButton!
    @IBOutlet weak var difButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    
    //MARK: -var/let
   
    private var countWidht = 0
    private var countHeight = 0
    private let change = 10
    //MARK: -lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultLabel.text = "0"
    }
    
   //MARK: -IBAAction
    @IBAction func startButtompressed(_ sender: UIButton) {
        touchOnButton(touch: .start)
        
    }
    
    @IBAction func plusButtonPressed(_ sender: UIButton) {
        touchOnButton(touch: .plus)
    }
    
    @IBAction func difButtonPressed(_ sender: UIButton) {
        touchOnButton(touch: .dif)
    }
    
    //MARK: -Other Func
    private func touchOnButton(touch: Buttons) {
        switch touch {
        case .start:
            let width = Int(self.resultLabel.text!)!
            while(true) {
                if ((countWidht+1) * width <= Int(self.view.frame.size.width)) {
                    createView(x: self.countWidht*width, y: self.countHeight*width)
                    self.countWidht+=1
                }
                else if ((countHeight+2)*width <= Int(self.startButtom.frame.origin.y)) {
                    self.countWidht=0
                    self.countHeight+=1
                    createView(x: self.countWidht*width, y: self.countHeight*width)
                    self.countWidht+=1
                }
                else {break}
            }
            self.resultLabel.text = "0"
        
        case .plus:
            if (((Int(self.resultLabel.text!)!+Int(self.change))) <= Int(self.view.frame.size.width) && ((Int(self.resultLabel.text!)!+Int(self.change))) <= Int(self.startButtom.frame.origin.y) ) {
                self.resultLabel.text = String(Int(self.resultLabel.text!)! + self.change)
            }
        
        case .dif:
            if ((Int(self.resultLabel.text!)! - Int(self.change)) >= 0) {
                self.resultLabel.text = String(Int(self.resultLabel.text!)! - self.change)
            }
        }
    }
    
    private func createView(x: Int, y:Int) {
        let view = UIView()
        let height = Int(self.resultLabel.text!)!
        view.frame = CGRect(x: x, y: y, width: height, height: height)
        view.backgroundColor = UIColor(hue: Double.random(in: 0...1), saturation: Double.random(in: 0...1), brightness: Double.random(in: 0...1), alpha: 1)
        self.view.addSubview(view)
    }
    
    

}

