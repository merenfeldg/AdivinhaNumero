import SwiftUI

struct PreviousAttemptsSubView: View {
    
    var attempts: [GuessModel]
    
    func generateMessageComparasion(_ comparasion: ComparasionWithChoosenNumber) -> String {
        switch comparasion {
            case .lower:
                return "Menor"
            case .higher:
                return "Maior"
            case .equal:
                return "Acertou!"
        }
    }
    
    var body: some View {
        
        let isNotFirstAttempt = !(attempts.count < 1)
        
        VStack {
            HStack {
                if isNotFirstAttempt {
                    Text("Tentativas anteriores")
                        .font(.headline)
                        .fontWeight(.regular)
                    
                    Spacer()
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(attempts.reversed()) { attempt in
                        let comparasion = generateMessageComparasion(attempt.comparasion)
                            
                        HStack {
                            Divider()
                                
                            VStack {
                                Text("\(attempt.number)")
                                    .font(.title3)
                                    .bold()
                                    
                                Text(comparasion)
                                    .foregroundColor(.gray)
                            }
                                
                            Divider()
                        }
                        .frame(height: 50)
                    }
                }
            }
        }
    }
}

#Preview {
    PreviousAttemptsSubView(
        attempts: [
            GuessModel(id: 1, number: 10, comparasion: .lower),
            GuessModel(id: 2, number: 28, comparasion: .higher),
            GuessModel(id: 1, number: 10, comparasion: .lower),
            GuessModel(id: 2, number: 28, comparasion: .higher),
            GuessModel(id: 1, number: 10, comparasion: .lower),
            GuessModel(id: 2, number: 28, comparasion: .higher),
            GuessModel(id: 1, number: 10, comparasion: .lower),
            GuessModel(id: 2, number: 29, comparasion: .higher),
        ]
    )
}
