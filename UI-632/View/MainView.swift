//
//  MainView.swift
//  UI-632
//
//  Created by nyannyan0328 on 2022/08/05.
//

import SwiftUI
import Lottie

struct MainView: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @State var currentTab : Tab = .home
    @Environment(\.self) var env
    
    @State var animatedIcons : [AnimatedIcon] = {
        
        var tabs : [AnimatedIcon] = []
        
        for tab in Tab.allCases{
            
            tabs.append(.init(tabIcon: tab, lottieView: AnimationView(name: tab.rawValue,bundle: .main)))
            
        }
        return tabs
        
        
        
    }()

    var body: some View {
        VStack(spacing:0){
            
            TabView(selection: $currentTab) {
                
                Text("Home")
                    .BG()
                    .tag(Tab.home)
                
                Text("Notifications")
                    .BG()
                    .tag(Tab.notifications)
                
                Text("Account")
                    .BG()
                    .tag(Tab.account)
                
                Text("Saved")
                    .BG()
                    .tag(Tab.saved)
                
                Text("Person")
                    .BG()
                    .tag(Tab.chat)
            }
            
            if #available(iOS 16, *){
                
                    TabBar()
                    .toolbar(.hidden, for: .tabBar)
                
            }
            else{
                
                TabBar()
                
                
            }
            
            
            
        }
    }
    @ViewBuilder
    func TabBar()->some View{
        
        HStack(spacing:0){
            
            ForEach(animatedIcons){icon in
                
                VStack{
                    
                    let tabColor : SwiftUI.Color = currentTab == icon.tabIcon ? (env.colorScheme == .dark ? .white : .black) : .gray.opacity(0.6)
                    
                    ResizbleLottieView(lottieView: icon.lottieView,color:tabColor)
                        .font(.title2)
                     .frame(width: 30,height: 30)
                       .frame(maxWidth: .infinity,alignment: .center)
                    
                    Text(currentTab.rawValue)
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(currentTab == icon.tabIcon ? .green : .gray)
                        .opacity(currentTab == icon.tabIcon ? 1 : 0)
                    
                }
                .scaleEffect(currentTab == icon.tabIcon ? 1.5 : 1)
                .contentShape(Rectangle())
                .onTapGesture {
                    
                    currentTab = icon.tabIcon
                    icon.lottieView.play{_ in
                        
                        
                    }
                }
                
            
            }
        }
        .padding(.top,10)
        .background{
        
            (env.colorScheme == .dark ? Color.black : Color.white)
                .ignoresSafeArea()
        }
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
extension View{
    
    @ViewBuilder
    func BG()->some View{
        
        self
      
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Color.primary.opacity(0.03)
                    .ignoresSafeArea()
            }
         
        
        
            
        
    }
}
