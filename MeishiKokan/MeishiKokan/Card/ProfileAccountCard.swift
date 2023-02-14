//
//  ProfileAccountCard.swift
//  MeishiKokan
//
//  Created by 松村拓洋 on 2023/02/13.
//

import SwiftUI

struct ProfileAccountCard: View {

    var service_name : String = ""
    var service_id : String = ""
    init(service_name: String, service_id: String) {
        self.service_name = service_name
        self.service_id = service_id
    }
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            VStack(alignment: .leading, spacing: 5) {
                Text("@" + service_id)
                Text(service_name)
                    .font(.title)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
           
    
    }
}

struct ProfileAccountCard_Previews: PreviewProvider {

    static var previews: some View {
        ProfileAccountCard(service_name: "gh", service_id: "takuchan")
            .previewLayout(.fixed(width: 400, height: 60))
    }
}
