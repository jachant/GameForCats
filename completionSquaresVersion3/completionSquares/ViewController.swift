import UIKit

enum Buttons {
    case plus
    case start
    case dif
}

class ViewController: UIViewController {
    //MARK: -IBOOutlet
    
    @IBOutlet weak var frontLabel: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    //MARK: -var/let
   
   
    //MARK: -lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startButton.layer.cornerRadius = 10
    }
    
   //MARK: -IBAAction
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        controller.modalTransitionStyle = .flipHorizontal
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    //MARK: -Other Func
    
}

