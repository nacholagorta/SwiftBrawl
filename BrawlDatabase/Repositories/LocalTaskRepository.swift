//
//  LocalTaskRepository.swift
//  BrawlDatabase
//
//  Created by IGNACIO OLAGORTA VERA on 19/12/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import UIKit
import RealmSwift

class LocalTaskRepository: NSObject {

    func getAll() -> [Task]{
        var tasks: [Task] = []
        do{
            let entities = try Realm().objects(TaskEntity.self).sorted(byKeyPath: "name", ascending: true)
            for entity in entities{
                let model = entity.taskModel()
                tasks.append(model)
            }
        }
        catch let error as NSError{
            print("Error getAll Tasks:", error.description)
        }
        return tasks
    }
    
    
    func get(identifier: String) -> Task? {
        do{
            let realm = try Realm()
            if let entity = realm.objects(TaskEntity.self).filter("id == %@", identifier).first{
                let model = entity.taskModel()
                return model
            }
        }
        catch{
            return nil
        }
        return nil
    }
    
    
    func create(a: Task) -> Bool {
        do{
            let realm = try Realm()
            let entity = TaskEntity(task: a)
            try realm.write {
                realm.add(entity, update: true)
            }
        }
        catch{
            return false
        }
        return true
    }
    
    
    func update(a: Task) -> Bool {
        return create(a: a)
    }
    
    
    func delete(a: Task) -> Bool {
        do{
            let realm = try Realm()
            try realm.write {
                let entityToDelete = realm.objects(TaskEntity.self).filter("id == %@", a.id)
                realm.delete(entityToDelete)
            }
        }
        catch{
            return false
        }
        return true
    }
    
    
    
}
