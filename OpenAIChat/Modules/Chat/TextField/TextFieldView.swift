//
//  TextFieldView.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 3/3/24.
//

import SwiftUI

struct TextFieldView: View {
    @StateObject var vm: TextFieldViewModel = TextFieldViewModel()
    
    var body: some View {
        HStack{
            TextField("Message", text: $vm.messageContent)
                .padding(8)
                .background(Color.gray
                    .quaternary)
                .cornerRadius(15)
                .frame(height:30)
            Button( action:{
                vm.createUserMessage()
            },
                    label: {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            )
        }

    }
}

#Preview {
    TextFieldView()
}
