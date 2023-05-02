
import UIKit

final class ViewController: UIViewController {
  // MARK: IBOutlet
  @IBOutlet private weak var searchBar: UISearchBar!
  @IBOutlet private weak var tableView: UITableView!
  
  
  // MARK: Variables
  private var wordList = [Word]()
  private var wordDao = WordDao()
  private var wordTableViewModel: WordTableViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    wordDao.copyDatabase()
    wordList = wordDao.getAllWord()
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

// MARK: UITableViewDelegate
extension ViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    performSegue(withIdentifier: Storyboard.toDetailVC.rawValue, sender: indexPath.row)
  }
}

// MARK: UITableViewDataSource
extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    wordTableViewModel == nil ? 0 : self.wordTableViewModel.numberOfRowsInSection()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cell = tableView.dequeueReusableCell(withIdentifier: TableView.cellName.rawValue, for: indexPath) as! WordTableViewCell
    let newWord = self.wordTableViewModel.wordAtIndexPath(index: indexPath.row)
    cell.englishLabel.text = newWord.english
    cell.turkishLabel.text = newWord.turkish
    return cell
  }
}

// MARK: UISearchBarDelegate
extension ViewController : UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    wordList = wordDao.searchEnglishWord(english: searchText)
    tableView.reloadData()
  }
}
