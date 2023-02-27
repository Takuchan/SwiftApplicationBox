//
//  ContentView.swift
//  Bluetooth
//
//  Created by 松村拓洋 on 2023/02/27.
//

import SwiftUI
import CoreBluetooth

struct ContentView: View {
    @EnvironmentObject var bleManager: CoreBluetoothViewModel

    var body: some View {
        ZStack {
            //second stack
            VStack {
                NavigationView {
                    ScanListView()
                }
                .navigationViewStyle(StackNavigationViewStyle())
            }
            //first stack
            if bleManager.isSearching {
                Color.gray.opacity(0.6)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    VStack {
                        ProgressView()
                    }
                    VStack {
                        Spacer()
                        Button(action: {
                            bleManager.stopScan()
                        }) {
                            Text("スキャンを停止する")
                                .padding()
                        }
                    }
                }
                .frame(width: 200, height: 200, alignment: .center)
                .background(Color.gray.opacity(0.5))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
