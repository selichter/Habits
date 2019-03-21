import UIKit

class HabitCell: UICollectionViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet weak var standings: UILabel!
    @IBOutlet weak var timePeriod: UILabel!
    @IBOutlet weak var currentCount: UILabel!

    func render(habit: HabitViewModel) {
        self.name.text = habit.name
        self.standings.text = habit.standings
        self.currentCount.text = "\(habit.todayCount)"
        self.timePeriod.text = habit.timePeriod.lowercased()
        self.backgroundColor = spearmint
        layer.cornerRadius = 10
        self.name.sizeToFit()
        self.standings.sizeToFit()
        self.currentCount.sizeToFit()
        self.timePeriod.sizeToFit()
    }
}
