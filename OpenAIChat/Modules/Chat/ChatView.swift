//
//  ChatView.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 29/2/24.
//

import SwiftUI

struct ChatView: View {
    @StateObject var vm: ChatViewModel = ChatViewModel()
    var body: some View {
        VStack{
            SMBView()
        }
    }
}


#Preview {
    ChatView()
}
