//
//  ContentDetailView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/14.
//

import SwiftUI

struct ContentDetailView: View {
    @Environment(\.presentationMode) var presentationMode
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
            PostButtonView(contentId: detailViewContentId)
                .hTrailing()
                .vBottom()
        }
        .onAppear {
            self.postDatas = self.viewModel.getScreenData(contentId: self.detailViewContentId)
            print("ContentDetailView表示時：\(self.postDatas)")
        }
        .navigationTitle("投稿一覧")
    }
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
