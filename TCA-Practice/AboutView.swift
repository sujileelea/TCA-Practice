//
//  AboutView.swift
//  TCA-Practice
//
//  Created by Suji Lee on 12/14/23.
//

import SwiftUI

struct AboutView: View {
    
    let readMe: String
    
    var body: some View {
        DisclosureGroup(
            content: { 
                Text(self.readMe)
            }, label: {
                Text("해당 케이스는 이런 내용을 공부해요")
                    .frame(maxWidth: .infinity)
            }
        )
    }
}

#Preview {
    AboutView(readMe: "drop down contents")
}

