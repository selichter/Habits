import UIKit
import RealmSwift

class HabitsCollectionViewController: UICollectionViewController {
    var habits: [HabitEntity] = []
    var dataSource: HabitDataSource!
    var habitsVM: HabitsViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = collectionLayout()
        
        //        this happens twice...
        dataSource = HabitDataSource()
        habitsVM = HabitsViewModel(dataSource.getAll())
        collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
//        this happens twice...
        dataSource = HabitDataSource()
        habitsVM = HabitsViewModel(dataSource.getAll())
        collectionView.reloadData()
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHabit" {
            let viewController = segue.destination as! HabitViewController
            let cell = sender as! HabitCell
            let indexPaths = collectionView.indexPath(for: cell)
            var habitVM = habitsVM?.habits[indexPaths!.row]
            viewController.hvm = habitVM
        }
    }
    
    func collectionLayout() -> UICollectionViewFlowLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()

        let width = UIScreen.main.bounds.width - 20
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        return layout
    }
}
