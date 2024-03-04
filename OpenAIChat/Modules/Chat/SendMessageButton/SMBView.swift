//
//  SwiftUIView.swift
//  OpenAIChat
//
//  Created by Luciano Ferrero on 29/2/24.
//

import SwiftUI

struct SMBView: View {
    @StateObject var vm: SMBViewModel = SMBViewModel()
    var body: some View {
        HStack{
            Button( action:{
//                vm.performRequest()
            },
                    label: {
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
            }
            )
        }
        .padding(7)
    }
}

#Preview {
    SMBView()
}
