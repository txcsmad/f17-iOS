import UIKit

class ViewController: UIViewController {
 
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print(sender.titleLabel!.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Wins: 0 / Loses: 0"
    }
    
}
