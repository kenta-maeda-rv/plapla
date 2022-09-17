//
//  PostButtonView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/09/17.
//

import SwiftUI

struct PostButtonView: View {
    @State var showContentAddView = false
    
    let contentId: String
    let circleWidth: CGFloat = 80
    
    var body: some View {
        VStack() {
            
            Button(action: {
                self.showContentAddView.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: circleWidth,
                           height: circleWidth,
                           alignment: .center)
                    .padding(20)
                
            }.sheet(isPresented: $showContentAddView) {
                
                PostView(contentId: contentId)
            
            }
            
        }
    }
}

struct ContentAddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PostButtonView(contentId: "")
    }
}
