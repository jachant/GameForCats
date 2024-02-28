import UIKit

enum Move: String {
    case up = "There is no way up"
    case down = "There is no way down"
    case left = "There is no way left"
    case right = "There is no way right"
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
        
        let SwapperUp = UISwipeGestureRecognizer(target: self, action: #selector(moveUp))
        SwapperUp.direction = .up
        self.mainView.addGestureRecognizer(SwapperUp)
        let SwapperDown = UISwipeGestureRecognizer(target: self, action: #selector(moveDown))
        SwapperDown.direction = .down
        self.mainView.addGestureRecognizer(SwapperDown)
        let SwapperLeft = UISwipeGestureRecognizer(target: self, action: #selector(moveLeft))
        SwapperLeft.direction = .left
        self.mainView.addGestureRecognizer(SwapperLeft)
        let SwapperRight = UISwipeGestureRecognizer(target: self, action: #selector(moveRight))
        SwapperRight.direction = .right
        self.mainView.addGestureRecognizer(SwapperRight)
    }
    //MARK: -IBAAction
    @objc func moveUp() {
        move(.up)
    }
    @objc func moveDown() {
        move(.down)
    }
    @objc func moveLeft() {
        move(.left)
    }
    @objc func moveRight() {
        move(.right)
    }
    
    
    //MARK: -some funcs
    private func createArroundView(view: UIView){
        view.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.backgroundColor = .red
        view.layer.cornerRadius = view.frame.size.width/2
        self.view.addSubview(view)
    }
    private func move(_ direction: Move)  {
        switch direction {
        case .up:
            if (Int(self.arroundView.frame.origin.y) - Int(self.change) >= 0) {
                self.arroundView.frame.origin.y -= CGFloat(Int(self.change))
                errorLabel.text = ""
            }
            else {
                errorLabel.text = direction.rawValue
            }
        case .down:
            if (Int(self.arroundView.frame.origin.y) + Int(self.arroundView.frame.size.height) + Int(self.change) <= Int(self.mainView.frame.origin.y)) {
                self.arroundView.frame.origin.y+=CGFloat(self.change)
                errorLabel.text = ""
            }
            else {
                errorLabel.text = direction.rawValue
            }
        case .left:
            if (Int(self.arroundView.frame.origin.x)-Int(self.change) >= 0) {
                self.arroundView.frame.origin.x -= CGFloat(self.change)
                errorLabel.text = ""
            }
            else {
                errorLabel.text = direction.rawValue
            }
        case .right:
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

