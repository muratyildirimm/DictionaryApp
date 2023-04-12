
import UIKit

class DetailViewController: UIViewController {

  @IBOutlet weak var englishLabel: UILabel!
  @IBOutlet weak var turkishLabel: UILabel!
  
  var word : Word?
    override func viewDidLoad() {
        super.viewDidLoad()
      guard let word = word else {
        print("Data did not come")
        return
      }
        englishLabel.text = word.english
        turkishLabel.text = word.turkish
    }
}
