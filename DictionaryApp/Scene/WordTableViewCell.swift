
import UIKit

class WordTableViewCell: UITableViewCell {
  // MARK: IBOutlet
  @IBOutlet weak var englishLabel: UILabel!
  @IBOutlet weak var turkishLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
