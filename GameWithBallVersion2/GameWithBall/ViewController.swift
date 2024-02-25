import UIKit

enum Move: String {
    case Up = "There is no way up"
    case Down = "There is no way down"
    case Letf = "There is no way left"
    case Right = "There is no way right"
}

class ViewController: UIViewController {
    
    //MARK: -IBOOutlet
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var UpButton: UIButton!
    @IBOutlet weak var DownButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    //MARK: -var/let
    private let arroundView = UIView()
    private let change = 10
    
    //MARK: -lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        createArroundView(view: self.arroundView)
    }
    //MARK: -IBAAction
    @IBAction func UpButtonPressed(_ sender: UIButton) {
        move(direction: .Up)
    }
    
    @IBAction func rightButtonPressed(_ sender: UIButton) {
        move(direction: .Right)
    }
    
    @IBAction func DownButtonPressed(_ sender: UIButton) {
        move(direction: .Down)
    }
    
    @IBAction func leftButtonPressed(_ sender: UIButton) {
        move(direction: .Letf)
    }
    
    
    //MARK: -some funcs
    private func createArroundView(view: UIView){
        view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.backgroundColor = .red
        view.layer.cornerRadius = view.frame.size.width/2
        self.view.addSubview(view)
    }
    private func move(direction: Move)  {
        switch direction {
        case .Up:
            if (Int(self.arroundView.frame.origin.y) - Int(self.change) >= 0) {
                self.arroundView.frame.origin.y -= CGFloat(Int(self.change))
                errorLabel.text = ""
            }
            else {
                errorLabel.text = direction.rawValue
            }
        case .Down:
            if (Int(self.arroundView.frame.origin.y) + Int(self.arroundView.frame.size.height) + Int(self.change) <= Int(self.mainView.frame.origin.y)) {
                self.arroundView.frame.origin.y+=CGFloat(self.change)
                errorLabel.text = ""
            }
            else {
                errorLabel.text = direction.rawValue
            }
        case .Letf:
            if (Int(self.arroundView.frame.origin.x)-Int(self.change) >= 0) {
                self.arroundView.frame.origin.x -= CGFloat(self.change)
                errorLabel.text = ""
            }
            else {
                errorLabel.text = direction.rawValue
            }
        case .Right:
            if (Int(self.arroundView.frame.origin.x) + Int(self.arroundView.frame.size.width) + Int(self.change) <= Int(self.view.frame.size.width)) {
                self.arroundView.frame.origin.x+=CGFloat(self.change)
                errorLabel.text = ""
            }
            else {
                errorLabel.text = direction.rawValue
            }
        }
    }
}

