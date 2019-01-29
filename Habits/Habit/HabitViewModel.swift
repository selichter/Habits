import Foundation

class HabitViewModel {
    var thisHabitEntity: HabitEntity!
    var dataSource = HabitDataSource()

    let name: String
    var currentCount: Int
    let measurement: String
    let colorScheme: String

    init(habitEntity: HabitEntity) {
        thisHabitEntity = habitEntity
        name = habitEntity.name.uppercased()
        currentCount = habitEntity.currentCount
        measurement = habitEntity.measurement
        colorScheme = habitEntity.colorScheme
    }

    func increaseCount() {
        thisHabitEntity.currentCount += 1
        currentCount = thisHabitEntity.currentCount
        persistHabit()
    }
    
    func decreaseCount() {
        if thisHabitEntity.currentCount >= 1 {
            thisHabitEntity.currentCount -= 1
            currentCount = thisHabitEntity.currentCount
            persistHabit()
        }
    }

    func persistHabit() {
        dataSource.insert(item: thisHabitEntity!)
    }
    
    

}
