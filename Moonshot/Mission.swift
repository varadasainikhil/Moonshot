//
//  Mission.swift
//  Moonshot
//
//  Created by Sai Nikhil Varada on 3/11/25.
//

import Foundation

struct Mission : Codable, Identifiable{
    
    struct CrewRole : Codable{
        let name : String
        let role : String
    }
    
    let id : Int
    let launchDate : String?
    let crew : [CrewRole]
    let description : String
    
    var displayName : String{
        "Apollo \(id)"
    }
    
    var image : String{
        "apollo \(id)"
    }
}
