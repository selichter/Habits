import Foundation

protocol DataSource {
    associatedtype Item

    func getAll() -> [Item]
    func getById(habitId: String) -> Item
    func insert(item: Item)
    func clean()
    func deleteById(habitId: String)
}
