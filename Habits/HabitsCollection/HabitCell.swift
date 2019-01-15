import UIKit

class HabitCell: UICollectionViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet weak var standings: UILabel!
    @IBOutlet weak var measurement: UILabel!
    @IBOutlet weak var timePeriod: UILabel!
    

    
    func render(habit: HabitEntity) {
        self.name.text = habit.name.uppercased()
        self.standings.text = "\(habit.currentCount)/\(habit.target)"
        self.measurement.text = habit.measurement.lowercased()
        self.timePeriod.text = habit.timePeriod.lowercased()
        
        self.backgroundColor = allColors[habit.colorScheme]!.primary

        layer.cornerRadius = 10

        self.name.sizeToFit()
        self.standings.sizeToFit()
        self.measurement.sizeToFit()
        self.timePeriod.sizeToFit()
    }
}
