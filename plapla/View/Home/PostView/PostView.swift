//
//  PostView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/08/28.
//

import SwiftUI

struct PostView: View {
    @AppStorage("contentId") var contentId = ""
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel: PostViewModel = PostViewModel()
    
    @State var titleText = ""
    @State var discriptionText = ""
    @State var imageSelected: UIImage = UIImage(systemName: "camera")!
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 32) {
                
                ImageSelectButton(imageSelected: $imageSelected)
                
                
                VStack {
                    TextField("コンテンツタイトル", text: $titleText)
                        .tint(.secondary)
                    Divider()
                }
                .padding(10)
                .padding(.horizontal, 18)
                
                VStack {
                    TextField("コンテンツ詳細", text: $discriptionText)
                        .tint(.secondary)
                    Divider()
                }
                .padding(10)
                .padding(.horizontal, 18)
                
                Button(action: {
                    self.viewModel.tapAddButton(contentId: contentId,
                                                title: titleText,
                                                discription: discriptionText,
                                                image: imageSelected,
                                                process: .assembly
                    )
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
    static var previews: some View {
        PostView()
    }
}
