import Foundation

enum GameResponses {
    case correct
    case incorrect(newNumber: Int)
    case failure(String)
}
