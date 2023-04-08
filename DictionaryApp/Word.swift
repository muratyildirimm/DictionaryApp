
import Foundation

// Creating 'Word' Model Class

struct Word {
  
  var id: Int?
  var english: String?
  var turkish: String?
  
  init() {}
  
  init(id: Int?, english: String?, turkish: String?) {
    self.id = id
    self.english = english
    self.turkish = turkish
  }
}
