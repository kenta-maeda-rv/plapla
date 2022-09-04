//
//  ContentDetailView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/14.
//

import SwiftUI

struct ContentDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("contentId") var contentId = ""
    @StateObject var viewModel: ContentDetailViewModel = ContentDetailViewModel()
    
    @State var postDatas: [PostData] = [PostData(postId: "",
                                                 contentId: "",
                                                 postTitle: "",
                                                 postDiscription: "",
                                                 postDate: Date(),
                                                 ImageUrl:  "",
                                                 process: "")]
    
    var body: some View {
        VStack {
            Button(action: {
                contentId = contentId
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("TOPに表示")
            }
            TimeLineView(postDatas: $postDatas)
        }
        .onAppear {
            self.postDatas = self.viewModel.getScreenData(contentId: self.contentId)
            print("ContentDetailView表示時：\(self.postDatas)")
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
