import SwiftUI
import UIPilot
//MARK: - Upd

struct PolicyView: View {
    
    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    
    var body: some View {
        ZStack {
            Image("backPreview")
                .resizable()
                .ignoresSafeArea(.all)
            
            VStack {
                HStack {
                    Button(action: {
                        appRouter.pop()
                    }, label: {
                        Image("backArrow")
                            .resizable()
                            .frame(width: 12, height: 20)
                            .padding()
                    })
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
                VStack {
                    Text("111")
                    Text("123")
                }
                Spacer()
            }
        }
    }
}

#Preview {
    PolicyView()
}
