//
//  TaskEntity.swift
//  BrawlDatabase
//
//  Created by IGNACIO OLAGORTA VERA on 19/12/18.
//  Copyright © 2018 IGNACIO OLAGORTA VERA. All rights reserved.
//

import Foundation
import RealmSwift

class TaskEntity: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var isDone = false
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(task: Task){
        self.init()
        self.id = task.id
        self.name = task.name
        self.isDone = task.isDone
    }
    
    func taskModel() -> Task{
        let model = Task()
        model.id = self.id
        model.name = self.name
        model.isDone = self.isDone
        return model
    }
    
}
