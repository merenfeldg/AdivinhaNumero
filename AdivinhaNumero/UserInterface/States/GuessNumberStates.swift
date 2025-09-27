import Foundation

enum GuessNumberState {
    case initial
    case notGuessedNumber(
        messageInterval: String,
        messageSuggestion: String
    )
    case win(messageNumberAttempts: String)
}
