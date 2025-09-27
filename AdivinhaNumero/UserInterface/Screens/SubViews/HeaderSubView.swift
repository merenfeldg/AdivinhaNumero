import SwiftUI

struct HeaderSubView: View {
    
    @EnvironmentObject var controller: GuessNumberController
    
    let textTitle: String
    let textTip: String
    let onTap: () -> Void
    
    var body: some View {
        VStack {
            Text(textTitle)
                .font(.system(size: 34))
                .bold()
        
            Text(textTip)
            
            HStack {
                TextInputComponent(
                    hint: "Escreva um número...",
                    text: $controller.inputText,
                    keyboardType: .numberPad,
                )
                
                Spacer()
                
                Button(action: onTap) {
                    Text("Confirma")
                }
            }
            Divider()
        }
        .padding(.horizontal, 24)
    }
}
