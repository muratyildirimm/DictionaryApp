
import Foundation

enum Database: String {
  case dbName = "dictionary", dbExtension = "sqlite", dbFullName = "dictionary.sqlite"
  case dbId = "id", dbEnglish = "english", dbTurkish = "turkish"
  case dbWarning = "Database already exist, no need copy"
}

enum TableView: String {
  case cellName = "wordCell"
}

enum GeneralWarning: String {
  case canNotToConvertToInt = "Index can not convert to Int"
}

