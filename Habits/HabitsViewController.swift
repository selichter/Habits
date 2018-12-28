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
        dataSource = HabitDataSource()
        habits = dataSource.getAll()
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return habits.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        var habit = habits[indexPath.row]
        habit.currentCount += 1
        let _ = habits[indexPath.row].currentCount += 1
        try? dataSource.update(item: habit)
        collectionView.reloadData()
    }

    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "HabitCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HabitCell
        cell.render(habit: habits[indexPath.row])
        return cell
    }
}
