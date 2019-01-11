//
//  ViewController.swift
//  Habits
//
//  Created by Sarah Lichter on 12/19/18.
//  Copyright © 2018 Sarah Lichter. All rights reserved.
//

import UIKit
import RealmSwift

class HabitsCollectionViewController: UICollectionViewController {
    var habits: [HabitEntity] = []
    var dataSource: HabitDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let width = UIScreen.main.bounds.width - 20
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: width / 2, height: width / 2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout

        dataSource = HabitDataSource()
        habits = dataSource.getAll()
        collectionView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        dataSource = HabitDataSource()
        habits = dataSource.getAll()
        collectionView.reloadData()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habits.count
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "HabitCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HabitCell
        cell.render(habit: habits[indexPath.row])
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHabit" {
            let viewController = segue.destination as! HabitViewController
            let cell = sender as! HabitCell
            let indexPaths = collectionView.indexPath(for: cell)
            var thisHabitEntity = self.habits[indexPaths!.row] as HabitEntity
            viewController.habitEntity = thisHabitEntity
        }
        
    }
}
