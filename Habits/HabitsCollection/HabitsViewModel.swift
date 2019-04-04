import Foundation

class HabitsViewModel {
    var habits = [HabitViewModel]().sorted(by: {$0.name > $1.name})
    init(_ habitEntities: [HabitEntity]) {
        habits = habitEntities.map {HabitViewModel(habitEntity: $0)}
    }
}
