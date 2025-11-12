import Foundation

class GuessNumberController: ObservableObject {
    
    @Published var state: GuessNumberState
    @Published var inputText = ""
    @Published var attempts = [GuessModel]()
    @Published var showErrorAlert = false
    
    var messageErrorAlert = ""
    
    private var gameLogic = GuessNumberLogic()
    private var idGuess = 0
    private var choosenNumber = 100123
    
    init() {
        state = .initial
    }
    
    func startGame() {
        if verifyInputTextIsEmpty() { return }
        if verifyNumberIsNotBetween1And1000() { return }
        
        if let number = Int(inputText) {

            choosenNumber = number
            gameLogic.startChoosenNumber(number)
            self.inputText = ""
            
            self.state = .notGuessedNumber(
                messageInterval: "Escolha um número entre 1 a 100",
                messageSuggestion: "Será que é 50? 🤔"
            )
        }
    }
    
    func guessNumber() {
        if verifyInputTextIsEmpty() { return }
        if verifyNumberIsNotBetween1And1000() { return }
        
        if let number = Int(inputText) {
            let responseGenerateGuess = gameLogic.generateGuess(number)
            
            switch(responseGenerateGuess) {
                case .correct:
                    let actualGuess = GuessModel(
                        id: generateIdGuess(),
                        number: number,
                        comparasion: .equal
                    )
                    attempts.append(actualGuess)
                    
                    emitState(.win(
                        messageNumberAttempts: generateNumberAttemptsMessage()
                    ))
                    break
                
                case .incorrect(let suggestionNumber):
                    let actualGuess = GuessModel(
                        id: generateIdGuess(),
                        number: number,
                        comparasion: generateComparasionWithChooseNumber(number)
                    )
                    attempts.append(actualGuess)
                    
                    emitState(.notGuessedNumber(
                        messageInterval: "O número escolhido está entre \(gameLogic.lowerLimit) e \(gameLogic.upperLimit)",
                        messageSuggestion: "Será que é \(suggestionNumber)? 🤔"
                    ))
                    break
                    
                case .failure(let message):
                    showErrorAlert = true
                    messageErrorAlert = message
                    break
            }
            self.inputText = ""
            return
        }
        showErrorAlert = true
        messageErrorAlert = "Escolha um número inteiro positivo que esteja entre 1 a 100!"
    }
    
    func restartGame() {
        attempts.removeAll()
        inputText = ""
        gameLogic.restartGame()
        state = .initial
    }
    
    private func verifyInputTextIsEmpty() -> Bool {
        if inputText.isEmpty {
            showErrorAlert = true
            messageErrorAlert = "Você passou nenhum valor...\n Insira um número inteiro positivo!"
            return true
        }
        return false
    }
    
    private func verifyNumberIsNotBetween1And1000() -> Bool {
        if let number = Int(inputText) {
            if number < 1 || number > 100 {
                showErrorAlert = true
                messageErrorAlert = "O número precisa estar entre 1 e 100. Tente novamente!"
                return true
            } else { return false }
        }
        return true
    }
    
    
    private func generateIdGuess() -> Int {
        self.idGuess += 1
        return self.idGuess
    }
    
    private func emitState(_ newState: GuessNumberState) {
        state = newState
    }
    
    private func generateComparasionWithChooseNumber(_ number: Int) -> ComparasionWithChoosenNumber {
        return number > choosenNumber ? .higher : .lower
    }
    
    private func generateNumberAttemptsMessage() -> String {
        let numberAttempts = attempts.count
        
        if numberAttempts == 1 {
            return "Levou UMA tentativa para acertar o número!!!"
        }
        return "Levou \(numberAttempts) tentativas para acertar o número!"
    }
}
