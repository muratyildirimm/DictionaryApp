
import UIKit
var wordList =  [Word]()
class ViewController: UIViewController {
  
  @IBOutlet weak var searchBar: UISearchBar!
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    WordDao().copyDatabase()
    tableView.dataSource = self
    tableView.delegate = self
    searchBar.delegate = self
    wordList = WordDao().getAllWord()
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      let index = sender as? Int
      let destination = segue.destination as! DetailViewController
      guard let index = index else {
        print(GeneralWarning.canNotToConvertToInt.rawValue)
        return
      }
      destination.word = wordList[index]
  }
}

extension ViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.performSegue(withIdentifier: Storyboard.toDetailVC.rawValue, sender: indexPath.row)
    }
}

extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return wordList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let word = wordList[indexPath.row]
    let cell = tableView.dequeueReusableCell(withIdentifier: TableView.cellName.rawValue, for: indexPath) as! WordTableViewCell
    cell.englishLabel.text = word.english
    cell.turkishLabel.text = word.turkish
    return cell
  }
}

extension ViewController : UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    wordList = WordDao().searchEnglishWord(english: searchText)
    tableView.reloadData()
    }
}

