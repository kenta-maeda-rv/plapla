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
    
    @State var titleText = ""
    
    @State var showAlert: Bool = false
    @State var showImagePicker: Bool = false
    @State var imageSelected: UIImage = UIImage(systemName: "camera")!
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    @State var showPostImageView: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                
                Button(action: {
                    showAlert.toggle()
                }) {
                    Image(uiImage: imageSelected)
                        .resizable()
                }
                .frame(width: 200,
                       height: 200,
                       alignment: .center)
                .background(Color.gray)
                .actionSheet(isPresented: $showAlert) {
                    ActionSheet(title: Text("写真追加"),
                                message: nil,
                                buttons: [
                                    .default(Text("写真を撮る")
                                             ,action:{
                                                 sourceType = UIImagePickerController.SourceType.camera
                                                 showImagePicker.toggle()
                                             }),
                                    .default(Text("ライブラリから選択")
                                             ,action:{
                                                 sourceType = UIImagePickerController.SourceType.photoLibrary
                                                 showImagePicker.toggle()
                                             }),
                                    .cancel()
                                ])
                }
                
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(imageselected: $imageSelected, sourceType: $sourceType)
                }
                .fullScreenCover(isPresented: $showPostImageView, content: {
                    PostImageView(imageSelected: $imageSelected)
                })
                TextField("contentTitle", text: $titleText)
                    .padding(30)
                    .background(Color.gray)
                
                Button(action: {
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
        ContentAddView()
    }
}
struct PostImageView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var imageSelected: UIImage
    
    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .padding()
                })
                    .accentColor(.primary)
                Spacer()
            }
            //選択された画像を表示
            Image(uiImage: imageSelected)
                .resizable()
                .scaledToFill()
                .frame(maxWidth:.infinity, maxHeight: 300)
                .clipped()
        })
    }
}
