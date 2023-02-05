//
//  EditView.swift
//  Codable
//
//  Created by 松村拓洋 on 2023/02/05.
//

import SwiftUI

struct EditView: View {
    @Binding var data : Model
    @Binding var stopOngen: Bool
    var body: some View {
        List{
            Section(header:Text("タイトル")){
                TextField("入力してください",text: $data.title)
            }
            Section(header:Text("サブタイトル")){
                TextField("サブタイトル",text: $data.subtitle)
            }
            Button(action:{
                if(stopOngen){
                    MusicPlay.stop()
                    stopOngen = false
                }else{
                    MusicPlay.play()
                    stopOngen = true
                }
            }){
                Text(stopOngen ? "音源停止":"音源再生")
            }
        }
        
        
       
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(data:.constant(Model.sampledata[0]), stopOngen: .constant(false))
    }
}
