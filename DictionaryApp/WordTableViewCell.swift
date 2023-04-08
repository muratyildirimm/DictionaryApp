//
//  WordTableViewCell.swift
//  DictionaryApp
//
//  Created by Murat Yıldırım on 6.04.2023.
//

import UIKit

class WordTableViewCell: UITableViewCell {

  @IBOutlet weak var englishLabel: UILabel!
  @IBOutlet weak var turkishLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }

}
