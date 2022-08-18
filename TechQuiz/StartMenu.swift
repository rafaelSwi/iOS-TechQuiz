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
                    .frame(width: 142,height: 120)
                    .offset(x: -0, y: -278)
                
                VStack {
                    
                    
                    NavigationLink (destination: ContentView()) {
                        
                        Text("Start Game")
                            .font(.largeTitle)
                        
                    }.padding()
                    
                    NavigationLink (destination: AboutGame()) {
                        
                        Text("About")
                            .font(.largeTitle)
                        
                    }.padding()
                }
                
            }
            
            
            
            
        } .navigationBarBackButtonHidden(true)
        
        
        
    }
}





struct StartMenu_Previews: PreviewProvider {
    static var previews: some View {
        StartMenu()
    }
}
