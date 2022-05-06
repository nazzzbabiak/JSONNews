//
//  HomeMostShared.swift
//  JSONNews
//
//  Created by Nazar Babyak on 03.05.2022.
//

import SwiftUI

struct HomeMostShared: View {
    
    @StateObject var viewModel = NewsViewModelImpletationShared(service: NewsServiseImpletationShared())
 
    var body: some View {
        Group {
            
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error, handler: viewModel.getResult)
            case .success(let results):
                NavigationView {
                    ScrollView(showsIndicators: true) {
                        ForEach(results) { res in
                            
                            let media = res.media?.first ?? Media.someData
                            let mediametadata = res.media?.first?.mediaMetadata?.first ?? MediaMetadatum.someData
                            
                            
                            ResultViewMostShared(result: res,
                                        media: media,
                                        mediametadata: mediametadata,
                                        sources: Source.newYorkTimes)
                        }
                        
                    }
                    .listStyle(.grouped)
                    .navigationBarTitle(Text(""))
                    .navigationBarTitleDisplayMode(.automatic)
                    .navigationBarItems(leading: HStack{
                        Image(systemName: "person.circle.fill")
                            .resizable().scaledToFit().frame(width: 30, height: 30)
                        Text("Most Shared")
                            .font(.system(size: 25, weight: .medium, design: .rounded))
                    },trailing: VStack {
                        Image(systemName: "list.bullet")
                            .resizable().scaledToFit().frame(width: 30, height: 30)
                    })
                    .padding(5)
                    
                }.ignoresSafeArea()
            }
        }.onAppear(perform: viewModel.getResult)
    }
}

//struct HomeMostShared_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeMostShared(result: Result.someData, media: Media.someData, mediametadata: MediaMetadatum.someData, sources: Source.newYorkTimes)
//    }
//}
