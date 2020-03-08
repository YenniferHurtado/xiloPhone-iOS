
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func clickAction(_ sender: Any) {
        
        let button = (sender as! XiloButton)
        print(button.tag)
        button.shakeMovement()
    }
}

