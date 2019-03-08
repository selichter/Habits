import Foundation

class HabitViewModel {
    var dataSource = HabitDataSource()

    let name: String
    var currentCount: Int
    let measurement: String
    var standings: String
    let timePeriod: String
    var target: Int
    var habitId = String()

    init(habitEntity: HabitEntity) {
        name = habitEntity.name.uppercased()
        currentCount = habitEntity.currentCount
        measurement = habitEntity.measurement
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
            measurement: measurement)
        dataSource.insert(item: entity)
    }
    
}
