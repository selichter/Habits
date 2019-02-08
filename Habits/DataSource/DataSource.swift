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
