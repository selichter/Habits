import Foundation

class HabitsViewModel {
    var habits = [HabitViewModel]()
    
    init(_ habitEntities: [HabitEntity]) {
        habits = habitEntities.map {HabitViewModel(habitEntity: $0)}
    }
}
