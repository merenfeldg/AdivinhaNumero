import SwiftUI

struct InitialSubView: View {
    
    @EnvironmentObject var controller: GuessNumberController
        
    var body: some View {
        HeaderSubView(
            textTitle: "Escolha um número",
            textTip: "entre 1 a 100",
            onTap: controller.startGame
        )
        
        Spacer()
        
        Button(action: controller.restartGame) {
            Text("Reiniciar")
        }
    }
}
