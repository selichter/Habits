//
//  DataSource.swift
//  Habits
//
//  Created by Sarah Lichter on 12/23/18.
//  Copyright © 2018 Sarah Lichter. All rights reserved.
//

import Foundation

protocol DataSource {
    associatedtype Item

    func getAll() -> [Item]
    func getById(id: String) -> Item
    func insert(item: Item)
    func update(item: Item) throws
    func clean()
    func deleteById(id: String)
}
