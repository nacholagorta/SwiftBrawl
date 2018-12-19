//
//  Repository.swift
//  BrawlDatabase
//
//  Created by IGNACIO OLAGORTA VERA on 19/12/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import Foundation

protocol Repository{
    associatedtype T
    
    func getAll() -> [T]
    func get(identifier: String) -> T?
    func create(a: T) -> Bool
    func update(a: T) -> Bool
    func delete(a: T) -> Bool
}
