import UIKit

class ViewController: UIViewController {
    
    //MARK: -IBOOutlet
    @IBOutlet weak var frontLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    
    //MARK: -lifecycle func
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    //MARK: -IBAAction
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        self.present(controller, animated: true, completion: nil)
    }
    
    

}

