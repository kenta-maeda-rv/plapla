//
//  HomeView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/01/10.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("homeViewContentId") var homeViewContentId = ""
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    @State var postDatas: [PostData] = [PostData(postId: "",
                                                 contentId: "",
                                                 postDiscription: "",
                                                 postDate: Date(),
                                                 ImageUrl:  "",
                                                 process: "")]
    @State var navigationTitle = ""
    
    var body: some View {
        NavigationView{
            ZStack {
                TimeLineView(postDatas: $postDatas)
                PostButtonView()
                    .hTrailing()
                    .vBottom()
            }
            .navigationTitle(self.navigationTitle)
            .onAppear {
                self.navigationTitle = self.viewModel.getContentTitle(id: homeViewContentId)
                self.postDatas = self.viewModel.getScreenData(contentId: homeViewContentId)
                print("HomeView表示時：\(self.postDatas)")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
