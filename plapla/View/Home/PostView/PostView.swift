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
    
    @State var contentId: String
    @State var titleText = ""
    @State var discriptionText = ""
    @State var imageSelected: UIImage = UIImage(systemName: "camera")!
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                
                ImageSelectButton(imageSelected: $imageSelected)
                
                TextField("contentTitle", text: $titleText)
                    .padding(30)
                    .background(Color.gray)
                TextField("discription", text: $discriptionText)
                    .padding(30)
                    .background(Color.gray)
                
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
                }
                .padding(150)
                .frame(height: 80)
                .background(Color.gray)
            }
            .navigationBarTitle(Text("投稿"),
                                displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("閉じる")
                    }
                }
            }
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(contentId: "test")
    }
}
