//
//  SavedPage.swift
//  JSONNews
//
//  Created by Nazar Babyak on 03.05.2022.
//

import SwiftUI

struct SavedPage: View {
    
    @StateObject var viewModel = NewsViewModelImpletationViewed(service: NewsServiseImpletationViewed())
    
    @State var liked: Bool = false
    
    var body: some View {
        VStack {
            
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getResult)
            case .success(let results):
                NavigationView {
                    
                    if liked {
                        
                        ScrollView(showsIndicators: true) {
                            ForEach(results) { res in
                                
                                let media = res.media?.first ?? Media.someData
                                let mediametadata = res.media?.first?.mediaMetadata?.first ?? MediaMetadatum.someData
                                ResultViewMostViewed(result: res,
                                                     media: media,
                                                     mediametadata: mediametadata,
                                                     sources: Source.newYorkTimes,
                                                     format: Format.mediumThreeByTwo440)
                            }
                        }
                        .navigationBarTitle(Text(""))
                        .navigationBarTitleDisplayMode(.automatic)
                        .navigationBarItems(leading: HStack{
                            Image(systemName: "person.circle")
                                .resizable().scaledToFit().frame(width: 30, height: 30)
                            Text("Most Viewed")
                                .font(.headline)
                                .font(.system(size: 30, design: .monospaced))
                                .padding()
                        },trailing: VStack {
                            Image(systemName: "list.bullet")
                                .resizable().scaledToFit().frame(width: 30, height: 30)
                        })
                        .padding(5)
                        
                    } else {
                        ProgressView()
                    }
                }
                .ignoresSafeArea()
            }
        }.onAppear(perform: viewModel.getResult)
    }
}

//struct SavedPage_Previews: PreviewProvider {
//    static var previews: some View {
//        SavedPage(liked: liked)
//    }
//}
