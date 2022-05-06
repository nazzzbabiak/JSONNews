//
//  ResultCoreData+CoreDataProperties.swift
//  
//
//  Created by Nazar Babyak on 06.05.2022.
//
//

import Foundation
import CoreData


extension ResultCoreDatas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ResultCoreDatas> {
        return NSFetchRequest<ResultCoreDatas>(entityName: "ResultCoreDasas")
    }

    @NSManaged public var abstract: String?
    @NSManaged public var byline: String?
    @NSManaged public var section: String?
    @NSManaged public var source: String?
    @NSManaged public var title: String?
    @NSManaged public var update: String?
    @NSManaged public var url: String?
    @NSManaged public var urlImage: String?

}
