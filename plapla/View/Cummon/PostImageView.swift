//
//  PostImageView.swift
//  plapla
//
//  Created by 前田 健太 (Maeda Kenta) on 2022/08/28.
//

import SwiftUI

struct ImageSelectButton: View {
    @State var showAlert: Bool = false
    @State var showImagePicker: Bool = false
    @State var showPostImageView: Bool = false
    @Binding var imageSelected: UIImage
    @State var sourceType: UIImagePickerController.SourceType = .camera
    
    var body: some View {
        VStack {
            Button(action: {
                showAlert.toggle()
            }) {
                
                if imageSelected == UIImage(systemName: "camera")! {
                    Image(uiImage: imageSelected)
                        .resizable()
                        .frame(width: 150, height: 150)
                } else {
                    Image(uiImage: imageSelected)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(25)
                }
            }
            .padding(.horizontal, 32)
            .frame(height: 200,
                   alignment: .center)
            .actionSheet(isPresented: $showAlert) {
                ActionSheet(
                    title: Text("写真追加"),
                    message: nil,
                    buttons: [
                        .default(
                            Text("写真を撮る"),
                            action:{
                                sourceType = UIImagePickerController.SourceType.camera
                                showImagePicker.toggle()
                            }),
                        .default(
                            Text("ライブラリから選択"),
                            action:{
                                sourceType = UIImagePickerController.SourceType.photoLibrary
                                showImagePicker.toggle()
                            }),
                        .cancel()
                    ])
            }
            
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(imageselected: $imageSelected, sourceType: $sourceType)
            }
        }
    }
}

struct ImageSelectButton_Previews: PreviewProvider {
    @State static var image: UIImage = UIImage(systemName: "camera")!
    static var previews: some View {
        ImageSelectButton(imageSelected: $image)
    }
}
