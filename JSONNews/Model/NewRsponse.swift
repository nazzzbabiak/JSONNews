//
//  NewRsponse.swift
//  JSONNews
//
//  Created by Nazar Babyak on 30.04.2022.
//

import Foundation
import CoreData
    //Кста помилка в назві файла))

// MARK: - Welcome
struct NewResponse: Codable {
    
    var status, copyright: String?
    var numResults: Int?
    var results: [Result]?
    
//    enum CodingKeys: String, CodingKey {
//        case status, copyright
//        case numResults
//        case results
//    }
}

// MARK: - Result
struct Result: Codable ,Identifiable  {
//    var ids = UUID()
    var uri: String?
    var url: String?
    var id, asset_id: Int?
    var source: String?
 //   var source: Source?

    var updated, section: String?
    var subsection: String?
//    var subsection: Subsection?
    var nytdsection, adx_keywords: String?
    var byline: String?
    var type: String?
//    var type: ResultType

    var title, abstract: String?
    var media: [Media]?
    
}

// Я деякі поля повидаляв з модельки зверху, бо дивився чи вони потрібні скажемо так, і змінив типи даних з модельок на тсрінги де це можливо, бо як на мене це краще, но знвоштаки залжеить від ситуації


struct Media: Codable {
    var type: MediaType?
    var subtype: String?
    var caption, copyright: String?
    var approvedForSyndication: Int?
    var mediaMetadata: [MediaMetadatum]?
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication
        case mediaMetadata = "media-metadata"
    }
}

extension Media {
    static var someData: Media {
        .init(type: MediaType.image,
              subtype: Subtype.photo.rawValue,
              caption: "",
              copyright: "The New York Times",
              approvedForSyndication: 1,
              mediaMetadata: [MediaMetadatum.someData])
    }
}

struct MediaMetadatum: Codable {
    var url: String?
    var format: Format?
    var height, width: Int?
    
    
}

extension MediaMetadatum {
    static var someData: MediaMetadatum {
        .init(
            url: "https://static01.nyt.com/images/2021/09/20/autossell/MIlly_CVR_FINAL_COLOR_v1/MIlly_CVR_FINAL_COLOR_v1-mediumThreeByTwo440.jpg",
              format: Format.mediumThreeByTwo440,
              height: 293,
              width: 440)
    }
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case standardThumbnail = "Standard Thumbnail"
}
//
enum Subtype: String, Codable {
    case photo = "photo"
}
//
enum MediaType: String, Codable {
    case image = "image"
}
//
enum Source: String, Codable {
    case newYorkTimes = "New York Times"
}
//
enum Subsection: String, Codable {
    case empty = "" // Скоріш за все імено ізза цього не працювало парсінг
    case mind = "Mind"
}

enum ResultType: String, Codable {
    case article = "Article"
}
