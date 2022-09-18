//
//  PostView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/08/28.
//

import SwiftUI

struct PostView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel: PostViewModel = PostViewModel()
    
    @State var titleText = ""
    @State var discriptionText = ""
    @State var imageSelected: UIImage = UIImage(systemName: "camera")!
    @State var process: Process = .preparation
    @Binding var postDatas: [PostData]
    
    var contentId: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 32) {
                
                ImageSelectButton(imageSelected: $imageSelected)
                
                VStack(spacing: 32) {
                    VStack {
                        TextField("投稿文", text: $discriptionText)
                            .tint(.secondary)
                        Divider()
                    }
                    
                    VStack {
                        HStack {
                            Text("工程")
                                .tint(.secondary)
                                .foregroundColor(.gray)
                                .hLeading()
                            Spacer()
                            Picker(selection: $process, label: Text("工程")) {
                                ForEach(Process.allCases, id: \.self) { process in
                                    TagView(process: process.rawValue).tag(process)
                                }
                            }
                        }
                        Divider()
                    }
                }
                .padding(10)
                .padding(.horizontal, 18)
                
                Button(action: {
                    self.viewModel.savePostData(contentId: contentId,
                                                discription: discriptionText,
                                                image: imageSelected,
                                                process: process
                    )
                    self.postDatas = RepogitoryManager.shared.getPostData(contentId: self.contentId)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("投稿")
                        .foregroundColor(.white)
                }
                .padding(150)
                .frame(height: 60)
                .background(Color.accentColor)
                .cornerRadius(15)
                
                Spacer()
            }
            .navigationBarTitle(Text("投稿"),
                                displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("閉じる")
                            .foregroundColor(.primary)
                    }
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    @State static var postData:[PostData] = [PostData(postId: "postId",
                                                      contentId: "contentId",
                                                      postDiscription: "postDiscription",
                                                      postDate: Date(),
                                                      ImageUrl:  "ImageUrl",
                                                      process: "本組")]
    
    static var previews: some View {
        PostView(postDatas: $postData, contentId: "")
    }
}
