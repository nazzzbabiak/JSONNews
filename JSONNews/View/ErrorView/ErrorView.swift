//
//  ErrorView.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import SwiftUI
import CoreData


struct ErrorView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHandler
    
    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHandler) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            
            Image(systemName: "icloud.slash.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
            
            VStack {
                Text("Sorry but we some bad news for you:")
                    .font(.system(size: 16, weight: .bold, design: .monospaced))
                    .foregroundColor(.red)
                Image(systemName: "chevron.down")
                    .font(.system(size: 10, weight: .bold, design: .monospaced))
                    .foregroundColor(.red)
            }
            
            Text(error.localizedDescription)
                .font(.system(size: 16, weight: .bold, design: .monospaced))
            Button(action: {
                handler()
            }, label: {
                Text("Повторити")
                    .font(.system(size: 20, weight: .semibold, design: .monospaced))
                    .foregroundColor(.green)
            })
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .background(Color.green.opacity(0.2))
                .cornerRadius(15)
               
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError("321")) {}
    }
}
