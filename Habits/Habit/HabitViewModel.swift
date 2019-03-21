import Foundation

class HabitViewModel {
    var dataSource = HabitDataSource()
    let cal = Calendar.current

    let name: String
    let measurement: String
    let timePeriod: String
    var target: Int
    var habitId = String()
    var counts: [CountEntity] {
        return dataSource.getCountsByHabitId(habitId: habitId)
    }
    var todayCount: Int {
        let habitCounts = counts.filter { cal.isDateInToday($0.timestamp) }
        return habitCounts.filter { $0.count == "increase" }.count - habitCounts.filter { $0.count == "decrease" }.count
    }

    var yesterdayCount: Int {
        let habitCounts = counts.filter { cal.isDateInYesterday($0.timestamp) }
        return habitCounts.filter { $0.count == "increase" }.count - habitCounts.filter { $0.count == "decrease" }.count
    }

    var standings: String {
        return "\(todayCount)/\(target)"
    }

    init(habitEntity: HabitEntity) {
        name = habitEntity.name.uppercased()
        measurement = habitEntity.measurement
        timePeriod = habitEntity.timePeriod
        target = habitEntity.target
        habitId = habitEntity.habitId
    }

    func increaseCount() {
        let count = CountEntity(habitId: habitId, timestamp: Date(), count: CountEnum.increase.rawValue)
        dataSource.insertCount(item: count)
    }

    func decreaseCount() {
        if todayCount >= 1 {
            let count = CountEntity(habitId: habitId, timestamp: Date(), count: CountEnum.decrease.rawValue)
            dataSource.insertCount(item: count)
        }
    }

    func resetCount() {
        dataSource.deleteCountsByHabitId(habitId: habitId)
    }

    func persistHabit() {
        let entity = HabitEntity(
            habitId: habitId,
            name: name,
            target: target,
            timePeriod: timePeriod,
            measurement: measurement)
        dataSource.insert(item: entity)
    }
}
