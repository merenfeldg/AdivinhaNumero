import Foundation

struct GuessNumberLogic {
    
    var choosenNumber = 100123
    var previusNumber = 0
    
    var upperLimit = 100
    var lowerLimit = 1
    
    var newNumber: Int {
        return (upperLimit + lowerLimit) / 2
    }
    
    mutating func startChoosenNumber(_ number: Int) {
        self.choosenNumber = number
    }
    
    mutating func generateGuess(_ number: Int) -> GameResponses {
        
        if number == choosenNumber {
            return .correct
        }
        if verifyNumberIsNotInRange(number) {
            if(number > choosenNumber) {
                return .incorrect(newNumber: previusNumber - 2)
            }
            previusNumber = number
            return .incorrect(newNumber: previusNumber + 2)
        }
        
        previusNumber = number
        
        if number > choosenNumber {
            self.upperLimit = number - 1
            return .incorrect(newNumber: newNumber)
        }
        
        self.lowerLimit = number + 1
        return .incorrect(newNumber: newNumber)
    }
    
    mutating func restartGame() {
        self.upperLimit = 100
        self.lowerLimit = 0
        self.choosenNumber = 100123
        self.previusNumber = 0
    }
    
    private func verifyNumberIsNotInRange(_ number: Int) -> Bool {
        let isLesserLowerLimit = number < lowerLimit
        let isHigherUpperLimit = number > upperLimit
        
        return isLesserLowerLimit || isHigherUpperLimit
    }
    
    private func generateComparasionWithNumber() -> ComparasionWithChoosenNumber {
        return previusNumber > choosenNumber ? .higher : .lower
    }
}
