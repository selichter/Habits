import Foundation

class HabitViewModel {
    var dataSource = HabitDataSource()

    let name: String
    var currentCount: Int
    let measurement: String
    let colorScheme: String
    var standings: String
    let timePeriod: String
    var target: Int
    var habitId = String()

    init(habitEntity: HabitEntity) {
        name = habitEntity.name.uppercased()
        currentCount = habitEntity.currentCount
        measurement = habitEntity.measurement
        colorScheme = habitEntity.colorScheme
        standings = "\(habitEntity.currentCount)/\(habitEntity.target)"
        timePeriod = habitEntity.timePeriod
        target = habitEntity.target
        habitId = habitEntity.habitId
    }

    func increaseCount() {
        currentCount += 1
        persistHabit()
    }
    
    func decreaseCount() {
        if currentCount >= 1 {
            currentCount -= 1
            persistHabit()
        }
    }

    func persistHabit() {
        let entity = HabitEntity(
            habitId: habitId,
            name: name,
            currentCount: currentCount,
            target: target,
            timePeriod: timePeriod,
            measurement: measurement,
            colorScheme: colorScheme)
        dataSource.insert(item: entity)
    }
    
}
