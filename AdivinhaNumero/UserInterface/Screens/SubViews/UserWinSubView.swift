import SwiftUI

struct UserWinSubView: View {
    
    @EnvironmentObject var controller: GuessNumberController
    let message: String
    
    var body: some View {
        VStack {
            Spacer()
            Text("👏🥳")
                .font(.system(size: 64))
            
            Text("VOCE ACERTOU!!")
                .font(.title2)
                .bold()
            
            Text(message)
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.bottom, 150)
            
            Spacer()
            
            Button(action: controller.restartGame) {
                Text("Jogar novamente")
            }
        }
    }
}
