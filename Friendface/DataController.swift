//
//  DataController.swift
//  Friendface
//
//  Created by Николай Никитин on 27.10.2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
  let container = NSPersistentContainer(name: "Friendface")

  init() {
    container.loadPersistentStores { description, error in
      if let error {
        print("Core Data failed to load: \(error.localizedDescription)")
      }
      self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
  }
}
