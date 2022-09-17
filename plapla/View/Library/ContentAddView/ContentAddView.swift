//
//  ContentAddView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/03/14.
//

import SwiftUI
import UIKit

struct ContentAddView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject var viewModel: ContentAddViewModel = ContentAddViewModel()
    
    @State var contentId: String
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
                    self.viewModel.tapAddButton(title: titleText,
                                                discription: discriptionText,
                                                image: imageSelected)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("追加")
                        .foregroundColor(.white)
                }
                .padding(150)
                .frame(height: 60)
                .background(Color.accentColor)
                .cornerRadius(15)
                
                Spacer()
            }
            .navigationBarTitle(Text("コンテンツ追加"),
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

struct ContentAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContentAddView(contentId: "test")
    }
}
