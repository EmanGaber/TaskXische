//
//  UniversitiestDB.swift
//  TaskXische
//
//  Created by Eman Gaber on 31/05/2024.


import Foundation
import RealmSwift
import Realm


class UniversitiesDB : Object  {
    
     var domains = List<String>()
    @objc dynamic var name : String?
     var webPages = List<String>()
    @objc dynamic var alphaTwoCode : String = ""
    @objc dynamic var stateProvince : String?
    @objc dynamic var country : String?
    
    
    override static func primaryKey () -> String
    {
        return "name"
    }
    
    
    class func SaveOrUpdateUniversity(newObj : UniversitiesDB )
    {
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(newObj, update: .all)
            
        }
        
    }
    
    
    class func GetAllUniversities() -> [UniversitiesModel]
    {
        
        let realm = try? Realm()
        
        // Access all data in the realm
        
        var allUniversitiesArray : [UniversitiesModel] = []
        guard let allUniversities = realm?.objects(UniversitiesDB.self) else {return allUniversitiesArray}
        
        for i in 0 ..< allUniversities.count{
            let newObj = UniversitiesModel(domains: Array(allUniversities[i].domains),
                                           name: allUniversities[i].name,
                                           webPages: Array(allUniversities[i].webPages),
                                           alphaTwoCode: allUniversities[i].alphaTwoCode,
                                           stateProvince: allUniversities[i].stateProvince,
                                           country: allUniversities[i].country)
             
            allUniversitiesArray.append(newObj)
            
        }
        
        return allUniversitiesArray
        
    }
    
}
    
    
    
    
