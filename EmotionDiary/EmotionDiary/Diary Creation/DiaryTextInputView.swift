//
//  DiaryTextInputView.swift
//  EmotionDiary
//
//  Created by Yuhyeon Kim on 2023/01/23.
//

import SwiftUI

struct DiaryTextInputView: View {
    
    @ObservedObject var vm: DiaryViewModel
    @FocusState var focused: Bool
    
    var body: some View {
        
        VStack {
            TextEditor(text: $vm.text)
                .focused($focused)
                .border(.gray.opacity(0.2), width: 2)
            Button {
                vm.completed()
            } label: {
                Text("Done")
                    .frame(width: 200, height: 80)
                    .foregroundColor(.white)
                    .background(Color.pink)
                    .cornerRadius(40)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                focused = true
            }
        }
        .padding()
    }
}

struct DiaryTextInputView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = DiaryViewModel(isPresented: .constant(false), diaries: .constant(MoodDiary.list))
        DiaryTextInputView(vm: vm)
    }
}
