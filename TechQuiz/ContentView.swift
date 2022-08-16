import SwiftUI

struct ContentView: View {
    
    @State var choosenCompany = Companies.allCases.randomElement()
    
    @State var score: Int = 300 {
        didSet {
            if (score < 0) {score = 0}
        }
    }
    
    @State var correct = 0
    @State var wrong = 0
    
    @State var numberOfAttempts: Int = 0
    
    @State var companyAlignment: [Companies] = []
    
    enum Companies: String, CaseIterable {
        case apple = "APPLE"
        case microsoft = "MS"
        case ibm = "IBM"
        case sony = "SONY"
        case samsung = "SAMSUNG"
    }
    
    func resetStuff (resetAll: Bool) {
        
        choosenCompany = Companies.allCases.randomElement()
        companyAlignment.removeAll()
        createAlignment()
        
        if (resetAll == true) {
            wrong = 0
            correct = 0
            score = 500
            numberOfAttempts = 0
        }
        
        
    }
    
    func createAlignment () {
        
        companyAlignment.removeAll()
        
        companyAlignment.append(choosenCompany!)
        
        var placeHolder = choosenCompany
        
        while (placeHolder == choosenCompany) {
            placeHolder = Companies.allCases.randomElement()
        }
        
        companyAlignment.append(placeHolder!)
        
        placeHolder = choosenCompany
        
        while (placeHolder == choosenCompany || companyAlignment.contains(placeHolder!) == true) {
            placeHolder = Companies.allCases.randomElement()
        }
        
        companyAlignment.append(placeHolder!)
        
        companyAlignment.shuffle()
        
    }
    
    func generateQuestion (company: Companies, number: Int) -> String {
        
        switch company {
            
        case .apple:
            switch number {
            case 1: return "It's first computer model was sold for $666.66"
            case 2: return "It's First Logo Featured Isaac Newton"
            case 3: return "Devices are always Set to 9:41 in Advertisements"
            case 4: return "Had its main boss fired in 1985"
            case 5: return "Made a game console, failed in sales and expelled the company from the console market"
            case 6: return "Contain more money than the US Government"
            default: return "☓"
            }
            
        case .microsoft:
            switch number {
            case 1: return "It's most famous OS would have been called \"Interface Manager\", but it was modified before its release."
            case 2: return "Invented the \"tablet computer\""
            case 3: return "It's CEO was officially the youngest billionaire, in 1987 at the humble age of 31."
            case 4: return "Bought Nokia"
            case 5: return "It's former CEO no longer works in the company, but many people don't know that."
            case 6: return "Owns the rights to the most famous photo in history"
            default: return "☓"
            }
            
        case .ibm:
            switch number {
            case 1: return "Invented the Floppy Disk"
            case 2: return "Its founders were Charles Ranlett Flint & Thomas J. Watson"
            case 3: return "Is popularly known as \"Big Blue\", and the origin of this nickname is still a mystery."
            case 4: return "The Company Slogan is \"Think\""
            case 5: return "It competes in similar industries, and was once bigger than Microsoft"
            case 6: return "Its computers helped put the first man on the moon"
            default: return "☓"
            }
            
        case .sony:
            switch number {
            case 1: return "It has been sales leader several times in the game console market"
            case 2: return "Revolutionized the Music world with Walkman"
            case 3: return "Its most successful product was the result of an abandoned project with its Rival"
            case 4: return "It owns the studio responsible for the first games in the Halo franchise"
            case 5: return "Its name comes from the Latin word \"Sound\""
            case 6: return "Paid $5 million for Daniel Craig (James Bond) to use his smartphone"
            default: return "☓"
            }
            
        case .samsung:
            switch number {
            case 1: return "In terms of number of units sold, it leads the smartphone market"
            case 2: return "It has a construction company, which was responsible for the Burj Khalifa"
            case 3: return "Got in trouble for devices that accidentally exploded"
            case 4: return "Sells screen panels to its main rival"
            case 5: return "Its previous logo was based on the Milky Way galaxy"
            case 6: return "Made and sold a cell phone based on a scene from the movie \"Matrix\""
            default: return "☓"
            }
        }
    }
    
    func buttonSpecificAction (company: Companies) {
        
        numberOfAttempts += 1
        
        if (company != choosenCompany) {score -= 50; wrong += 1}
        else {score += 50; correct += 1}
        
        resetStuff(resetAll: false)
        
    }
    
    
    
    var body: some View {
        
        
        ZStack {
            
            LinearGradient (colors: [.mint, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack {
                
                VStack {
                    
                    ZStack {
                        
                        
                        Rectangle ()
                            .foregroundColor(.white)
                            .frame(width: 450, height: 120, alignment: .top)
                            .blur(radius: 50)
                        
                        
                        Image("TECHQUIZ_LOGO")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 162,height: 140)
                        
                        HStack {
                            Text ("\(correct)")
                                .foregroundColor(.green)
                            
                            Spacer().frame(width: 240,height: 50)
                            
                            Text ("\(wrong)")
                                .foregroundColor(.red)
                        }
                        .font(.system(size:72).bold())
                        .opacity(0.6)
                        
                        
                    }
                    
                    if (companyAlignment.count == 0) {
                        
                        Text ("Start a new game by clicking ↺")
                            .font(.largeTitle).bold()
                            .frame(width: 315, height: 160)
                            .multilineTextAlignment(.center)
                            .offset(x: 0, y: 150)
                            .foregroundColor(.white)
                        
                    } else {
                        Text (generateQuestion(company: choosenCompany!, number: Int.random(in: 1...6)))
                            .bold()
                            .multilineTextAlignment(.center)
                            .font(.system(size:25))
                            .foregroundColor(.white)
                            .frame(width: 315, height: 170)
                    }
                    
                } .offset(x: 0, y: -15)
                
                Spacer()
                
                HStack (spacing: 10) {
                    
                    ForEach (companyAlignment, id: \.self) { option in
                        Button {
                            buttonSpecificAction(company: option)
                        } label: {
                            Image(option.rawValue)
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.black)
                                .frame(width: 70,height: 70)
                            
                            
                        }
                    }
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(15)
                    
                    
                }
                
                Spacer()
                    .frame(width: 20,height: 120)
                
                if (companyAlignment.count == 0) {
                    
                    Button("↺") {
                        resetStuff(resetAll: true)
                    }
                    .frame(width: 90,height: 40)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    
                    Spacer()
                    
                } else {
                    
                    VStack {
                        
                        Text ("Score: \(score)")
                            .font(.system(size:23).bold())
                        
                        Spacer()
                            .frame(width: 30, height: 25)
                        
                        HStack (spacing: 40) {
                            
                            Button("Skip (-25)") {
                                resetStuff(resetAll: false)
                                score -= 25
                            }
                            .frame(width: 140,height: 60)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .font(.title3)
                            .cornerRadius(15)
                            
                            Button("↺") {
                                resetStuff(resetAll: true)
                            }
                            .frame(width: 60,height: 60)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .font(.title3)
                            .cornerRadius(50)
                            
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
