

import Foundation
import SwiftUI

//MARK: - Upd
extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    var displayName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
}


struct AboutUsView: View {

    @EnvironmentObject var appRouter: NavRouter<AppRouteState>
    var bundleVers:  String = Bundle.main.releaseVersionNumber ?? "1.0"
    var buildVers: String = Bundle.main.buildVersionNumber ?? "1"
    let iconW = UIScreen.main.bounds.width / 3
    
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
                
                HStack {
                    Image("mc").resizable()
                        .frame(width: iconW, height: iconW)
                        .cornerRadius(40)
                } .padding(.bottom, 10)
                
                Text("Version \(bundleVers) (build \(buildVers))").font(.headline) .foregroundColor(.white)
                

                
                Text("""
            Над этим невероятным приложением на протяжении долгих лет не покладая своих мышек и клавиатур работали
            Дизайнеры: Никита, Никита,  Никита, Никита,  Никита, Никита, Никита, Никита, Никита, Никита
            Разработчики: Миро Милёхин, Кармелита Рамировна Зарецкая, Леонид Форс, Баро, Антон Николаевич Астахов
            """
                )
                .gameTextStyle(.nextButton)
                
        
                
                Button {
                    
                } label: {
                    Text("Share App")
                        .foregroundColor(.white)
                        .font(.system(size: 16) .bold())
                        .padding()
                        .frame(maxWidth: 200)
                        .background(Color.nextButton.opacity(1))
                        .cornerRadius(8)
                } .buttonStyle(.plain)
                
                Spacer()

                
                
            }
        }
    }
}
