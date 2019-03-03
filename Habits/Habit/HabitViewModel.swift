import Foundation

class HabitViewModel {
    var dataSource = HabitDataSource()

    let name: String
    let measurement: String
    let colorScheme: String
    let timePeriod: String
    var target: Int
    var habitId = String()
    var counts = [Count]()
    var currentCount: Int {
        return self.counts.filter{$0.count == CountEnum.increase}.count - self.counts.filter{$0.count == CountEnum.decrease}.count
    }

    var standings: String {
        return "\(currentCount)/\(target)"
    }

    init(habitEntity: HabitEntity) {
        name = habitEntity.name.uppercased()
        measurement = habitEntity.measurement
        colorScheme = habitEntity.colorScheme
        timePeriod = habitEntity.timePeriod
        target = habitEntity.target
        habitId = habitEntity.habitId
        counts = habitEntity.counts
    }

    func increaseCount() {
        let count = Count(timestamp: Date(), count: CountEnum.increase)
        counts.append(count)
        persistHabit()
    }
    
    func decreaseCount() {
        if currentCount >= 1 {
            let count = Count(timestamp: Date(), count: CountEnum.decrease)
            counts.append(count)
            persistHabit()
        }
    }

    func persistHabit() {
        let entity = HabitEntity(
            habitId: habitId,
            name: name,
            target: target,
            timePeriod: timePeriod,
            measurement: measurement,
            colorScheme: colorScheme, counts: [])
        dataSource.insert(item: entity)
    }
    
}
