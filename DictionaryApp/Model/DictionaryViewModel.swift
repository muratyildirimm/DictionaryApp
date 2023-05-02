
import Foundation

struct WordTableViewModel {
  // MARK: Variable
  let newWordList: [Word]
}

extension WordTableViewModel {
  func numberOfRowsInSection() -> Int {
    return self.newWordList.count
  }
  
  func wordAtIndexPath(index: Int) -> WordViewModel {
    let word = self.newWordList[index]
    return WordViewModel(word: word)
  }
}

struct WordViewModel {
  // MARK: Variables
  let word: Word
  var id: Int? {
    return self.word.id
  }
  var english: String? {
    return self.word.english
  }
  var turkish: String? {
    return self.word.turkish
  }
}
