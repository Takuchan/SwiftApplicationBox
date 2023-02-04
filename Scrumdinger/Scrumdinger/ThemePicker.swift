//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by 松村拓洋 on 2023/02/01.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection:Theme
    
    var body: some View {
        Picker("Theme",selection: $selection){
          
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
