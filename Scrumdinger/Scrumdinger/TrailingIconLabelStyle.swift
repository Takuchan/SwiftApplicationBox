//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by 松村拓洋 on 2023/02/01.
//

import SwiftUI

struct TrailingIconLabelStyle:LabelStyle{
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle{
    static var trailingIcon:Self {Self()}
}
