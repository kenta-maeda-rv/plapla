//
//  ContentDetailView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/14.
//

import SwiftUI

struct ContentDetailView: View {
    @StateObject var viewModel: ContentDetailViewModel = ContentDetailViewModel()
    
    @State var contentId: String
    @State var postDatas: [PostData] = []
    
    var body: some View {
        ZStack {
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
        ContentDetailView(contentId: "test")
    }
}
