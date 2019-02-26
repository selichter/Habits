import UIKit
import RealmSwift

class HabitsCollectionViewController: UICollectionViewController {
    var dataSource: HabitDataSource!
    var habitsVM: HabitsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = collectionLayout()
        dataSource = HabitDataSource()
        let entities = dataSource.getAll()
        render(HabitsViewModel(entities))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        dataSource = HabitDataSource()
        let entities = dataSource.getAll()
        render(HabitsViewModel(entities))
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habitsVM.habits.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "HabitCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HabitCell
        cell.render(habit: (habitsVM?.habits[indexPath.row])!)
        return cell
    }
    
    func render(_ habits: HabitsViewModel) {
        habitsVM = habits
        
        collectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHabit" {
            let viewController = segue.destination as! HabitViewController
            let cell = sender as! HabitCell
            let indexPaths = collectionView.indexPath(for: cell)
            let habitVM = habitsVM?.habits[indexPaths!.row]
            viewController.hvm = habitVM
        }
    }
    
    func collectionLayout() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        let width = UIScreen.main.bounds.width - 20
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: width, height: width / 4)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 8
        return layout
    }
}
