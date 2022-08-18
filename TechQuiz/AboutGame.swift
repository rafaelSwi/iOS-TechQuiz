import SwiftUI

struct AboutGame: View {
    
    
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
            LinearGradient (colors: [.gray, .black], startPoint: .bottom, endPoint: .topLeading)
                .ignoresSafeArea()
            
            VStack {
                
                Text ("""
A Simple Quiz App of Curiosities about Tech companies, made in Swift together with the SwiftUI framework, published by Rafael Neuwirth Swierczynski on GitHub.

The Application was made with the intention of learning how to use different features of SwiftUI, such as gradient colors, simple animations and navigation between Views.
""")
                .bold()
                .multilineTextAlignment(.center)
                .frame(width: 295, height: 550)
                .font(.system(size:24))
                .foregroundColor(.white)
                
                
                Spacer()
                
            }
            
            
            
            
        }
        
        
        
    }
}

struct AboutGame_Previews: PreviewProvider {
    static var previews: some View {
        AboutGame()
    }
}
