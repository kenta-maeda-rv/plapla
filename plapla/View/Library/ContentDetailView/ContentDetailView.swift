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
    @StateObject var viewModel: ContentDetailViewModel = .init()

    @State var postDatas: [PostData] = [PostData(postId: "",
                                                 contentId: "",
                                                 postDiscription: "",
                                                 postDate: Date(),
                                                 ImageUrl: "",
                                                 process: "")]

    var body: some View {
        ZStack {
            VStack {
                TimeLineView(postDatas: $postDatas)
            }
            PostButtonView(postDatas: $postDatas,
                           contentId: detailViewContentId)
                .hTrailing()
                .vBottom()
        }
        .onAppear {
            self.postDatas = RepogitoryManager.shared.getPostData(contentId: self.detailViewContentId)
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
