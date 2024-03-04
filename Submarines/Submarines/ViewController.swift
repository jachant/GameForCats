
import UIKit

enum Thing {
    case fish
    case ref
    case ship
    case whiteWater
}


class ViewController: UIViewController {
    //MARK: -IBOOutlet
    @IBOutlet weak var waterView: UIView!
    @IBOutlet weak var oxidentView: UIView!
    @IBOutlet weak var downButton: UIButton!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var submafineImageView: UIImageView!
    
    
    
    @IBOutlet weak var underGround: UIImageView!
    //MARK: -let/var
    private var water = [UIView]()
    private var constWhiteWater: CGFloat = 50
    private var whiteWater = -1
    private let changeDistance: CGFloat = 50
    private var speadSubmarine = 1.5
    private var Ref = UIImageView()
    private var Ship = UIImageView()
    private var Fish = UIImageView()
    private var timerMoveRef = Timer()
    private var timerMoveShip = Timer()
    private var timerMoveFish = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        create(.fish)
        create(.ref)
        create(.ship)
        create(.whiteWater)
        self.moveAll()
        
       
    }
    private func endGame() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func create(_ who: Thing) {
        switch who {
        case .fish:
            createFish()
        case .ref:
            createRef()
        case .ship:
            createShip()
        case .whiteWater:
            createWhiteWater()
        }
    }
    
    
    private func moveAll() {
        moveWhiteWater()
        self.timerMoveRef = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { _ in
            self.moveRef()
        })
         // make Timer; make enum
        self.timerMoveFish = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: { _ in
            self.moveFish()
        })
        self.timerMoveShip = Timer.scheduledTimer(withTimeInterval: 7, repeats: true, block: { _ in
            self.moveShip()
        })
    }
   
    private func createFish() {
        self.Fish = UIImageView(frame: CGRect(x: self.waterView.frame.size.width, y: 0, width: self.waterView.frame.size.width/6, height: self.waterView.frame.size.height/7))
        self.Fish.image = UIImage(named: "fish")
        self.waterView.addSubview(self.Fish)
    }
    
    private func moveFish() {
        self.Fish.frame.origin.y = self.submafineImageView.frame.origin.y
        UIView.animate(withDuration: TimeInterval(self.speadSubmarine)) {
            self.Fish.frame.origin.x = self.Fish.frame.origin.x - self.waterView.frame.width
        } completion: { _ in
            if (self.submafineImageView.frame.intersects(self.Fish.frame)) {
                self.endGame()
            }
            
            self.Fish.frame.origin.x = self.waterView.frame.width
            

    
        }
    }
    
    private func createShip() {
        self.Ship = UIImageView(frame: CGRect(x: self.waterView.frame.width, y: -CGFloat(Int(self.view.frame.height - self.waterView.frame.height)), width: CGFloat(Int(self.waterView.frame.size.width)/4), height: CGFloat(Int(self.view.frame.height - self.waterView.frame.height))))
        self.Ship.image = UIImage(named: "ship")
        self.waterView.addSubview(self.Ship)
    }
    
    private func moveShip() {
        UIView.animate(withDuration: TimeInterval(self.speadSubmarine)) {
            self.Ship.frame.origin.x = self.Ship.frame.origin.x -  self.waterView.frame.width
        } completion: { _ in
            if (self.submafineImageView.frame.intersects(self.Ship.frame)) {
                self.endGame()
            }
            self.Ship.frame.origin.x = self.waterView.frame.size.width
        }

    }
    
    
    private func createRef() {
        self.Ref = UIImageView(frame: CGRect(x: Int(self.waterView.frame.width) , y: Int(self.waterView.frame.height - (self.waterView.frame.size.height - self.waterView.frame.size.height + 3 * self.changeDistance)) , width: Int(self.waterView.frame.size.width)/5 , height: Int(self.waterView.frame.size.height - self.waterView.frame.size.height + 2 * self.changeDistance)))
        self.Ref.image = UIImage(named: "ref")
        self.waterView.addSubview(self.Ref)
        self.Ref.frame.origin.x = self.waterView.frame.size.width
    }
    private func moveRef() {
        
        UIView.animate(withDuration: TimeInterval(self.speadSubmarine)) {
            self.Ref.frame.origin.x = self.Ref.frame.origin.x - self.waterView.frame.width
        }
    completion: { _ in
        if (self.submafineImageView.frame.intersects(self.Ref.frame)) {
            self.endGame()
        }
        self.Ref.frame.origin.x = self.waterView.frame.size.width
        
    }
        
    }
    
    private func createWhiteWater() {
        whiteWater = Int(self.view.frame.size.height/self.constWhiteWater)
        for i  in 0..<self.whiteWater {
            let whiteView = UIView(frame: CGRect(x: Int(self.view.frame.size.width) , y: i*Int(self.constWhiteWater), width: 10, height: 2))
            whiteView.backgroundColor = .white
            self.water.append(whiteView)
            self.view.addSubview(whiteView)
        }
        
    }
    
    private func moveWhiteWater() {
        let randomId = Int.random(in: Int(self.view.frame.size.height/self.constWhiteWater) - Int(self.waterView.frame.size.height/self.constWhiteWater)..<self.whiteWater)
        UIView.animate(withDuration: TimeInterval(self.speadSubmarine)) {
            self.water[randomId].frame.origin.x = self.water[randomId].frame.origin.x -  CGFloat(Int(self.view.frame.size.width)) + self.upButton.frame.size.width + self.oxidentView.frame.size.width
            
            
        } completion: { _ in
            self.water[randomId].frame.origin.x = self.view.frame.size.width
            self.moveWhiteWater()
        }

    }
    
    @IBAction func upButtonPressed(_ sender: UIButton) {
        if (self.submafineImageView.frame.origin.y - self.changeDistance >= -self.changeDistance) {
            UIView.animate(withDuration: 0.3) {
                self.submafineImageView.frame.origin.y-=self.changeDistance
            }}
        
    }
    
    
    @IBAction func downButtonPressed(_ sender: UIButton) {
        if (self.submafineImageView.frame.origin.y + self.submafineImageView.frame.size.height + self.changeDistance <= self.waterView.frame.size.height) {
            UIView.animate(withDuration: 0.3) {
                self.submafineImageView.frame.origin.y+=self.changeDistance
            }}
    }
    
}

