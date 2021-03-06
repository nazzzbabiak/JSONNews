//
//  ResultsView.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import SwiftUI
import URLImage
import CoreData


struct ResultViewMostPopular: View {
    
    let result: Result
    let media: Media
    let mediametadata: MediaMetadatum
    let sources: Source
//    var getResult: ResultCoreData?

    @State var liked: Bool = false
    
//    @Environment(\.managedObjectContext) var moc
//
//    @FetchRequest(entity: ResultCoreDatas.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ResultCoreDatas.title, ascending: true)]) var savedTitle: FetchedResults<ResultCoreDatas>

    
    var body: some View {
        
        HStack(alignment: .top, spacing: 5) {
            
            if let imgURL = mediametadata.url {
                
                let url = URL(string: imgURL)
                
                URLImage(url: url!,
                         options: URLImageOptions(identifier: mediametadata.url, cachePolicy:
                                                        .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.2)),
                         failure: { error, _ in
                    VStack{
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                }, content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                    
                })
                    .frame(width: 100, height: 100)
                    .cornerRadius(2)
                
            } else {
                
                VStack{
                    Spacer()
                    ProgressView()
                        .frame(width: 100, height: 100)
                }.frame(maxHeight: .infinity)
            }
            Spacer()
            
            VStack(alignment: .leading, spacing: 5) {
                
                Text(result.title ?? "")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                
                HStack {
                    
                    VStack(alignment: .leading) {
                        Text("Section:")
                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                            .foregroundColor(.secondary)
                        Text(result.section ?? "")
                            .font(.system(size: 12, weight: .bold, design: .monospaced))
                            .foregroundColor(Color(.systemBlue))
                        
                    }
                    
                    Spacer()
                    VStack(alignment: .trailing, spacing: 2) {
                        //                        Text("")//result.publishedDate ?? "") ???????? ?????????? ?????????????? ?? ???????? ??????????????????
                        //                            .font(.system(size: 10, weight: .bold, design: .monospaced))
                        Text(result.updated ?? "")
                            .font(.system(size: 10, weight: .light, design: .monospaced))
                            .foregroundColor(.secondary)
                        
                        Button(action: {
//                            do {
//                                
//                                savedTitle.forEach { (result) in
//                                    moc.delete(result)
//                                }
//                                
//                                try moc.save()
//                                
//                            } catch {
//                                
//                                print(error.localizedDescription)
//                            }
                            
                        }, label: {
                            Image(systemName: liked ? "heart.fill" : "heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .foregroundColor(liked ? Color(.systemBlue) : Color.secondary)
                                .onTapGesture {
                                    liked.toggle()
                                }
                        })
                    }
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                
                NavigationLink(destination: {
                    ScrollView {
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text(media.copyright ?? "")
                            .font(.system(size: 30, weight: .bold, design: .rounded))
                        
                        Text(result.source ?? "")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                        
                        Text(result.updated ?? "")
                            .font(.system(size: 15, weight: .light, design: .rounded))
                            .foregroundColor(.secondary)
                        
                        
                        HStack {
                            if let imgURL = mediametadata.url {
                                let url = URL(string: imgURL)
                                
                                URLImage(url: url!,
                                         options: URLImageOptions(identifier: mediametadata.url, cachePolicy:
                                                                        .returnCacheElseLoad(cacheDelay: nil, downloadDelay: 0.2)),
                                         failure: { error, _ in
                                    VStack{
                                        ProgressView()
                                            .frame(width: 100, height: 100)
                                    }
                                }, content: { image in
                                    image
                                        .resizable()
                                        .scaledToFit()
                                    
                                })
                                    .frame(width: 125, height: 125)
                                    .cornerRadius(5)
                                
                            } else {
                                
                                VStack{
                                    ProgressView()
                                        .frame(width: 100, height: 100)
                                }
                            }
                            
                            Text(result.title ?? "")
                                .font(.system(size: 25, weight: .bold, design: .rounded))
                        }
                       
                        Text(result.section ?? "")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                            .foregroundColor(.secondary)
                        
                        Text(result.abstract ?? "")
                            .font(.system(size: 25, weight: .semibold, design: .rounded))
                        
                        Text(result.byline ?? "")
                            .font(.system(size: 15, weight: .thin, design: .rounded))
                            .foregroundColor(.secondary)
                        
                        Spacer()
                        
                        Link(destination: URL(string: result.url ?? "") ?? URL(string: "https://www.nytimes.com")!, label: {
                            HStack {
                                Text("More info")
                                    .font(.system(size: 15, weight: .light, design: .rounded))
                                Image(systemName: "network")
                                    .font(.system(size: 15, weight: .light, design: .monospaced))
                            }
                        })
                            .accentColor(.blue)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        
                    }
                    .padding()
                    }
                }, label: {
                    HStack{
                        Text("Read more")
                            .font(.system(size: 10, weight: .light, design: .monospaced))
                            .foregroundColor(.blue)
                        Image(systemName: "chevron.right")
                            .font(.system(size: 10, weight: .light, design: .monospaced))
                            .foregroundColor(.blue)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                })
                    .accentColor(.black)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

//struct ResultsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ResultsView(
//            result: Result.someData,
//            media: Media.someData,
//            mediametadata: MediaMetadatum.someData,
//            sources: Source.newYorkTimes
//        )
//    }
//}
