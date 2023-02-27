//
//  ContentView.swift
//  Modifier
//
//
//

import SwiftUI

struct ContentView: View {
    @State private var isToast:Bool  = false
    @State private var text: String = "おはよう"

    var body: some View {
        List{
            ForEach(1..<10){ num in
                Button(action:{
                    text = "\(num)のリストのボタンを押しました。"
                    isToast = true
                }){
                    Text("\(num)のリスト")
                        .borderedCaption()
                }
            }
        }
        .modifier(toast(isPresented: $isToast, text: $text))
        //        VStack {
        ////
        ////            Image(systemName: "bus")
        ////                .resizable()
        ////                .frame(width:50, height:50)
        ////
        ////            Text("Downtown Bus")
        ////                .borderedCaption()
        ////
        //            List{
        //                ForEach(1..<10){ num in
        //                    Text("\(num)のリスト")
        //                        .modifier(BorderedCaption())
        //                }
        //            }
        //            Button(action:{
        //                isToast = true
        //                text = "しげぞー"
        //            }){
        //                Text("吉本新喜劇")
        //                    .borderedCaption()
        //            }
        //
        //        }
        //        .padding()
        //        .modifier(toast(isPresented: $isToast, text: $text))
        //
        //    }
    }
}

struct BusDownload: View{
    var body : some View{
        Text("Downtown bun")
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}

struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.blue)
    }
}
struct Toast: ViewModifier{
    @State var opacity = 0.0
    @State var flg = false

    @Binding var isPresented: Bool
    @Binding var text: String
    func body(content :Content) -> some View{
        ZStack{
            content
            if(isPresented){
                VStack{
                    Spacer()
                    HStack{
                        Text(text)

                    }
                    .font(.headline)
                    .foregroundColor(.primary)
                    .padding(20)
                    .background(Color.secondary)
                    .clipShape(Capsule())
                    .frame(width: UIScreen.main.bounds.width / 1.25)
                    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
                    .onTapGesture {
                      withAnimation {
                        self.isPresented = false
                      }
                    }
                    .onAppear {
                       DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                         withAnimation {
                           self.isPresented = false
                         }
                       }
                    }
                }
            }else{
                ZStack{
                    content
                }
            }
        }


    }
}



struct Toast: View {
  @Binding var isShown: Bool

  var body: some View {
    VStack {
      Spacer()
        HStack {
//          Image(systemName: data.image)
          Text("text")
        }
        .font(.headline)
        .foregroundColor(.primary)
        .padding(20)
        .background(Color(UIColor.secondarySystemBackground))
        .clipShape(Capsule())
    }
    .frame(width: UIScreen.main.bounds.width / 1.25)
    .transition(AnyTransition.move(edge: .bottom).combined(with: .opacity))
    .onTapGesture {
      withAnimation {
        self.isShown = false
      }
    }.onAppear {
       DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
         withAnimation {
           self.isShown = false
         }
       }
    }
  }
}
