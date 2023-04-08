
import Foundation

class WordDao {
  
  let db : FMDatabase?
  
  // Copy databes to phone
  init() {
    let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent(Database.dbFullName.rawValue)
    db = FMDatabase(path: databaseURL.path)
  }
  
  
  func copyDatabase(){
    let bundlePath = Bundle.main.path(forResource: Database.dbName.rawValue, ofType: Database.dbExtension.rawValue)
    let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let fileManager = FileManager.default
    let toCopyPath = URL(fileURLWithPath: targetPath).appendingPathComponent(Database.dbFullName.rawValue)
    
    if fileManager.fileExists(atPath: toCopyPath.path){
      print(Database.dbWarning.rawValue)
    }else{
      do{
        try fileManager.copyItem(atPath: bundlePath!, toPath: toCopyPath.path)
      }catch{
        print(error)
      }
    }
    
  }
  
  
  func getAllWord() -> [Word] {
    db?.open()
    
    var words = [Word]()
    do { 
      let rs = try db!.executeQuery("SELECT * FROM words", values: nil)
      while rs.next() {
        let word = Word(id: Int(rs.string(forColumn: Database.dbId.rawValue))!,
                        english: rs.string(forColumn: Database.dbEnglish.rawValue)!,
                        turkish: rs.string(forColumn: Database.dbTurkish.rawValue)!)
        words.append(word)
      }
    }catch{
      print(error.localizedDescription)
    }
    db?.close()
    return words
  }
  
  func searchEnglishWord(english : String) -> [Word] {
    db?.open()
    
    var words = [Word]()
    do {
      let rs = try db!.executeQuery("SELECT * FROM words WHERE english like '%\(english)%'", values: nil)
      while rs.next() {
        let word = Word(id: Int(rs.string(forColumn: Database.dbId.rawValue))!,
                        english: rs.string(forColumn: Database.dbEnglish.rawValue)!,
                        turkish: rs.string(forColumn: Database.dbTurkish.rawValue)!)
        words.append(word)
      }
    }catch{
      print(error.localizedDescription)
    }
    db?.close()
    return words
  }
  

  
  
}
