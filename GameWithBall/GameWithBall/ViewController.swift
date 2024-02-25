import UIKit

class ViewController: UIViewController {
    let aroundView = UIView()
    let UpButton = UIButton()
    let DownButton = UIButton()
    let RightButton = UIButton()
    let LeftButton = UIButton()
    let speed = 30
    enum directions{
        case Up
    case Down
        case Right
        case Left
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        createView(view: aroundView)
        createButton(button: UpButton, direct: .Up)
        createButton(button: DownButton, direct: .Down)
        createButton(button: RightButton, direct: .Right)
        createButton(button: LeftButton, direct: .Left)
    }
    func createView(view: UIView) {
        view.frame = CGRect(x: self.view.frame.size.width/2-75, y: self.view.frame.size.height/2-75, width: 150, height: 150)
        view.layer.cornerRadius = view.frame.size.width/2
        view.backgroundColor = .red
        self.view.addSubview(view)
    }
    func createButton(button: UIButton, direct: directions) {
        switch direct {
        case .Up:
            button.frame = CGRect(x: self.view.frame.size.width/2-20, y: self.view.frame.size.height-200 , width: 40, height: 40)
            button.backgroundColor = .blue
            button.setTitle("Up", for: .normal)
            button.addTarget(self, action: #selector(UpButtonPressed), for: .touchUpInside)
            self.view.addSubview(button)
        case .Down:
            button.frame = CGRect(x:self.view.frame.size.width/2-20, y: self.view.frame.size.height-100, width: 40, height: 40)
            button.backgroundColor = .blue
            button.setTitle("Down", for: .normal)
            button.addTarget(self, action: #selector(DownButtonPressed), for: .touchUpInside)
            self.view.addSubview(button)
        case .Right:
            button.frame = CGRect(x:self.view.frame.size.width/2+80, y: self.view.frame.size.height-150, width: 40, height: 40)
            button.backgroundColor = .blue
            button.setTitle("Right", for: .normal)
            button.addTarget(self, action: #selector(RightButtonPressed), for: .touchUpInside)
            self.view.addSubview(button)
        case .Left:
            button.frame = CGRect(x:self.view.frame.size.width/2-120, y: self.view.frame.size.height-150, width: 40, height: 40)
            button.backgroundColor = .blue
            button.setTitle("Left", for: .normal)
            button.addTarget(self, action: #selector(LeftButtonPressed), for: .touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    
    @objc func UpButtonPressed(_ sender: UIButton!) {
        if (Int(self.aroundView.frame.origin.y)-(Int(speed)) >= 0 ) {
            self.aroundView.frame.origin.y-=CGFloat(Int(speed))}
        
    }
    @objc func DownButtonPressed(_ sender: UIButton!) {
        if (Int(self.aroundView.frame.origin.y)+(Int(speed)+Int(self.aroundView.frame.size.height)) <= Int(self.UpButton.frame.origin.y)) {
            self.aroundView.frame.origin.y+=CGFloat(Int(speed))}
    }
    
    @objc func RightButtonPressed(_ sender: UIButton!) {
        if (Int(self.aroundView.frame.origin.x)+(Int(speed)+Int(self.aroundView.frame.size.width)) <= Int(self.view.frame.size.width) ) {
            self.aroundView.frame.origin.x+=CGFloat(Int(speed))}
    }
    
    @objc func LeftButtonPressed(_ sender: UIButton!) {
        if (Int(self.aroundView.frame.origin.x)-(Int(speed)) >= 0 ) {
            self.aroundView.frame.origin.x-=CGFloat(Int(speed))}
    }
    

}

