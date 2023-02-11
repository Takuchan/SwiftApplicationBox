//
//  ContentView.swift
//  CreateRow
//
//  Created by 松村拓洋 on 2023/02/11.
//

import SwiftUI

struct ContentView: View {
    @State var models : Model.Data
    var body: some View {
        ScrollView(.horizontal){
            VStack {
                ForEach(0..<10){line in
                    HStack{
                        ForEach(0..<30){ row in
                            Button(action:{
                                let buttonID = Model.Attendee(attend: (line * 30 + row))
                                models.bols.append(buttonID)
                                print(models)
                            }){
                                Text("\(line * 30 + row)")
                                    .multilineTextAlignment(.center)
                                    .frame(width:50,height: 50)
                            }
                            
                        }
                    }
                    
                    
                }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(models: (Model.sampleData[0].data))
    }
}
