//
//  PostButtonView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/09/17.
//

import SwiftUI

struct PostButtonView: View {
    @State var showContentAddView = false
    @Binding var postDatas: [PostData]

    let contentId: String
    let circleWidth: CGFloat = 80

    var body: some View {
        VStack {
            Button(action: {
                self.showContentAddView.toggle()
            }) {
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: circleWidth,
                           height: circleWidth,
                           alignment: .center)
                    .background(.white)
                    .cornerRadius(40)
                    .padding(20)

            }.sheet(isPresented: $showContentAddView) {
                PostView(postDatas: $postDatas, contentId: contentId)
            }
        }
    }
}

struct ContentAddButtonView_Previews: PreviewProvider {
    @State static var postData: [PostData] = [PostData(postId: "postId",
                                                       contentId: "contentId",
                                                       postDiscription: "postDiscription",
                                                       postDate: Date(),
                                                       ImageUrl: "ImageUrl",
                                                       process: "本組")]

    static var previews: some View {
        PostButtonView(postDatas: $postData, contentId: "")
    }
}
