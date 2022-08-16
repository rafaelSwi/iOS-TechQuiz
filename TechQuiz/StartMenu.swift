// Release 1.0 (17.aug.22) - RafaelSwi GITHUB

import SwiftUI

struct StartMenu: View {
    
    
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                
                Rectangle()
                LinearGradient (colors: [.teal, .white], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                Image("TECHQUIZ_LOGO")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 162,height: 140)
                    .offset(x: 0, y: -300)
                
                NavigationLink (destination: ContentView()) {
                    
                    Text("Start Game")
                        .font(.largeTitle)
                    
                }
                
                
            } .navigationBarTitle("Main Menu", displayMode: .inline)
            
            
            
            
        }
        
        
        
    }
}





struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
