import UIKit

class HabitCell: UICollectionViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet weak var standings: UILabel!
    @IBOutlet weak var measurement: UILabel!
    @IBOutlet weak var timePeriod: UILabel!
    
    func render(habit: HabitEntity) {
        self.name.text = habit.name
        self.standings.text = "\(habit.currentCount)/\(habit.target)"
        self.measurement.text = habit.measurement
        self.timePeriod.text = habit.timePeriod
    }
}
