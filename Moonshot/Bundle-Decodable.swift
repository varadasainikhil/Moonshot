//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Sai Nikhil Varada on 3/11/25.
//

import Foundation

extension Bundle{
    func decode(_ file : String) -> [String : Astronaut]{
        // Finding the file in the bundle
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // loading contents of the file in data
        guard let data = try? Data(contentsOf: url)else{
            fatalError("Failed to load \(file) from Bundle.")
        }
        
        // decode data
        let decoder = JSONDecoder()
        do {
            return try decoder.decode([String: Astronaut].self, from: data)
        } catch DecodingError.keyNotFound(let key, let context){
            fatalError("Failed to decode \(file) from bundle due to missing key '\(key.stringValue) - \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context){
            fatalError("Failed to decode \(file)  from bundle due to type mismatch -\(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context){
            fatalError("Failed to decode \(file) from bundle due ot missing \(type) value - \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_){
            fatalError("Failed to decode \(file) from bundle becuase it appears to be invalid JSON.")
        }
        catch{
            fatalError("Failed to decode \(file) from bundle : \(error.localizedDescription)")
        }
    }
}
