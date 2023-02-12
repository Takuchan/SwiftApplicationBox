//
//  ContentView.swift
//  MeishiKokan
//
//  Created by 松村拓洋 on 2023/02/12.
//

import SwiftUI

struct ContentView: View {
    enum TabTitle:String{
        case tab1 = "Me!"
        case tab2 = "交換済み"
    }
    @State var navigationTitle : String = TabTitle.tab1.rawValue
    @State private var selectedTab : TabTitle = .tab1
    var body: some View {
        TabView(selection: $selectedTab){
            MyProfileView()
                .tabItem{
                    VStack{
                        Image(systemName: "person")
                        Text(TabTitle.tab1.rawValue)
                    }
                }
                .tag(TabTitle.tab1)
            ExchangedView()
                .tabItem{
                    VStack{
                        Image(systemName: "books.vertical")
                        Text(TabTitle.tab2.rawValue)
                    }
                }
                .tag(TabTitle.tab2)
        }
        .navigationTitle(navigationTitle)
        .onChange(of: selectedTab){ tab in
            navigationTitle = tab.rawValue
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
       
    }
}
