//
//  ContentDetailView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/14.
//

import SwiftUI

struct ContentDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("homeViewContentId") var homeViewContentId = ""
    var detailViewContentId = ""
    @StateObject var viewModel: ContentDetailViewModel = ContentDetailViewModel()
    
    @State var postDatas: [PostData] = [PostData(postId: "",
                                                 contentId: "",
                                                 postDiscription: "",
                                                 postDate: Date(),
                                                 ImageUrl:  "",
                                                 process: "")]
    
    var body: some View {
        ZStack {
            VStack {
                TimeLineView(postDatas: $postDatas)
            }
            PostButtonView()
                .hTrailing()
                .vBottom()
        }
        .onAppear {
            self.postDatas = self.viewModel.getScreenData(contentId: self.detailViewContentId)
            print("ContentDetailView表示時：\(self.postDatas)")
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: {
                    self.homeViewContentId = self.detailViewContentId
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("TOPに表示")
                }
            }
        }
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
