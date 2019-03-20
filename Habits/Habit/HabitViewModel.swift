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
        return dataSource.getCountsByHabitId(id: habitId)
    }
    var todayCount: Int {
        let habitCounts = counts.filter{ cal.isDateInToday($0.timestamp) }
        return habitCounts.filter{$0.count == "increase"}.count - habitCounts.filter{$0.count == "decrease"}.count
    }

    var yesterdayCount: Int {
        let habitCounts = counts.filter{ cal.isDateInYesterday($0.timestamp) }
        return habitCounts.filter{$0.count == "increase"}.count - habitCounts.filter{$0.count == "decrease"}.count
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
        dataSource.deleteCountsByHabitId(id: habitId)
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

//    func buildWeekCounts() -> [Int: Int] {
//        var weekCounts = [Int: Int]()
//
//        for num in 0..<7 {
//            let thisDate = cal.dateComponents([.day], from: cal.date(byAdding: .day, value: num, to: Date())!)
//            weekCounts[num] = self.counts.filter {cal.dateComponents([.day], from: $0.timestamp).day == cal.dateComponents([.day], from: thisDate).day}.count
//        }
//        return weekCounts
//    }

}
