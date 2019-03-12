import Foundation

class HabitViewModel {
    var dataSource = HabitDataSource()
    let cal = Calendar.current

    let name: String
    let measurement: String
    var standings: String
    let timePeriod: String
    var target: Int
    var habitId = String()
    var counts = [Count]()

    var todayCounts = [Count]()

    var currentCount = Int()

    var standings: String {
        return "\(currentCount)/\(target)"
    }

    var weekCounts: [Int: Int] {
        return [1: 1]
    }

    init(habitEntity: HabitEntity) {
        name = habitEntity.name.uppercased()
        measurement = habitEntity.measurement
        standings = "\(habitEntity.currentCount)/\(habitEntity.target)"
        timePeriod = habitEntity.timePeriod
        target = habitEntity.target
        habitId = habitEntity.habitId
        counts = habitEntity.counts
        todayCounts = habitEntity.counts.filter {cal.dateComponents([.day], from: $0.timestamp).day == cal.dateComponents([.day], from: Date()).day}
        currentCount = todayCounts.filter{$0.count == CountEnum.increase}.count - self.counts.filter{$0.count == CountEnum.decrease}.count
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
            counts: [])
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
