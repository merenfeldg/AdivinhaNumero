import SwiftUI

struct NotGuessNumberSubView: View {
    
    @EnvironmentObject var controller: GuessNumberController
    let messageInterval: String
    let messageSuggestionGuess: String
    
    var body: some View {
        
        let numberAttempts = controller.attempts.count
        
        VStack() {
            HStack {
                Text("\(numberAttempts + 1)º tentativa")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding(.bottom, 4)
            
            HeaderSubView(
                textTitle: "Adivinhe o número",
                textTip: messageInterval,
                onTap: controller.guessNumber
            )
            .padding(.bottom, 32)
            
            Text(messageSuggestionGuess)
                .font(.title3)
            
            Spacer()
            
            PreviousAttemptsSubView(attempts: controller.attempts)
                .padding(.bottom, 16)
            
            Button(action: controller.restartGame) {
                Text("Reiniciar")
            }
        }
    }
}
