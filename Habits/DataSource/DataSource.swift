import Foundation

protocol DataSource {
    associatedtype Item

    func getAll() -> [Item]
    func getById(id: String) -> Item
    func insert(item: Item)
    func clean()
    func deleteById(id: String)
}
