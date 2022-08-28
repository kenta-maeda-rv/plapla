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
            ScrollView(.vertical) {
                
                ImageSelectButton(imageSelected: $imageSelected)
                
                TextField("contentTitle", text: $titleText)
                    .padding(30)
                    .background(Color.gray)
                TextField("discription", text: $discriptionText)
                    .padding(30)
                    .background(Color.gray)
                
                Button(action: {
                    self.viewModel.tapAddButton(title: titleText,
                                                discription: discriptionText,
                                                image: imageSelected)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("追加")
                }
                .padding(150)
                .frame(height: 80)
                .background(Color.gray)
            }
            .navigationBarTitle(Text("コンテンツ追加"),
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

struct ContentAddView_Previews: PreviewProvider {
    static var previews: some View {
        ContentAddView(contentId: "test")
    }
}
