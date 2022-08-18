import SwiftUI

struct FailScreenView: View {
    
    
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
            LinearGradient (colors: [.red,.black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                Text ("Game Over")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding()
                
                Text ("Score has reached zero.")
                    .foregroundColor(.white)
                    .font(.system(size:20))
                
            }
        }
    }
}

struct FailScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FailScreenView()
    }
}
