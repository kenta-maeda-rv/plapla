//
//  ContentAddView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/14.
//

import SwiftUI

struct ContentAddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var contentAddViewModel: ContentAddViewModel = ContentAddViewModel()
    
    @State var titleText = ""
    
    var body: some View {
        ScrollView(.vertical) {
            
            Button(action: {
                
            }) {
                Text("ImageAdd")
            }
            .frame(width: 300,
                   height: 300,
                   alignment: .center)
            .background(Color.gray)
            
            TextField("contentTitle", text: $titleText)
                .padding(30)
                .background(Color.gray)
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("追加")
            }
            .padding(150)
            .frame(height: 80)
            .background(Color.gray)
        }
    }
}

struct ContentAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContentAddView()
    }
}
