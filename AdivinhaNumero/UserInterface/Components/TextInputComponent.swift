import SwiftUI

struct TextInputComponent: View {
    
    let hint: String
    @Binding var text: String
    let keyboardType: UIKeyboardType
    
    var body: some View {
        TextField(
            "",
            text: $text,
            prompt: Text(hint)
                .foregroundColor(.gray)
        )
        .keyboardType(keyboardType)
    }
}

#Preview {
    TextInputComponent(
        hint: "Clique aqui e escreva um número...",
        text: .constant(""),
        keyboardType: .numberPad
    )
}
