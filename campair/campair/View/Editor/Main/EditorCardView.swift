//
//  EditorCardView.swift
//  campair
//
//  Created by Lee Myeonghwan on 2022/06/14.
//

import SwiftUI

struct EditorCardView: View {
    @State private var showModal = false
    @Binding var editorMainContent: EditorMainContent
    let cardPaintingImage: Data
    var body: some View {
        Button(action: {
            showModal.toggle()
        }, label: {
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(editorMainContent.cardPaintingSubTitle)
                        .foregroundColor(Color(hex: editorMainContent.cardPaintingSubTitleColor))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text(editorMainContent.cardPaintingTitle)
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.top, 34)
                .padding(.leading, 20)
                Image(uiImage: UIImage(data: cardPaintingImage) ?? UIImage(systemName: "xmark")!)
                    .resizable()
                    .scaledToFit()
                    .padding(20)
            }
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color(hex: editorMainContent.cardPaintingBackgroundColor))
            )
        })
        .fullScreenCover(isPresented: $showModal) {
            EditorDetailView(showModal: self.$showModal, filename: editorMainContent.contentID)
        }
    }
}
//
// struct EditorCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditorCardView()
//            .previewDevice("iPod touch (7th generation)")
//    }
// }
