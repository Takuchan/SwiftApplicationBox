//
//  MyProfileView.swift
//  MeishiKokan
//
//  Created by 松村拓洋 on 2023/02/12.
//

import SwiftUI

struct MyProfileView: View {
    @Binding var data : Model.Data
    var body: some View {
        List{
            Section(header:Text("あなたの名前")){
                TextField("あなたの名前", text: $data.full_name)
            }
            Section(header:Text("アカウント一覧")){
                ForEach(data.register_account){ result in
                    ProfileAccountCard(service_name: result.service_name, service_id: result.user_id)
                        .frame(height: 70)
                }
            }
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MyProfileView(data: .constant(Model.sampleData[0].data))
        }
        
    }
}
