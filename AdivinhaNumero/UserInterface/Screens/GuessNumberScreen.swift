import SwiftUI

struct GuessNumberScreen: View {
    
    @StateObject private var controller = GuessNumberController()
    
    private func closeErrorAlert() {
        controller.showErrorAlert = false
        controller.messageErrorAlert = ""
    }
    
    var body: some View {
        VStack {
            switch(controller.state) {
                case .initial: InitialSubView()
                case .notGuessedNumber(let interval, let suggestion): NotGuessNumberSubView(
                        messageInterval: interval,
                        messageSuggestionGuess: suggestion
                )
                case .win(let msg): UserWinSubView(message: msg)
            }
        }
        .padding(.vertical, 16)
        .padding(.horizontal, 24)
        .alert(
            "Ocorreu um erro",
            isPresented: $controller.showErrorAlert) {
                Button(action: closeErrorAlert) {
                    Text("OK")
                }
            } message: {
                Text(controller.messageErrorAlert)
            }
        .environmentObject(controller)
    }
}
#Preview {
    GuessNumberScreen()
}
