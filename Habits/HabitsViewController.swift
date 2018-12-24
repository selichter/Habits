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
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "HabitCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! HabitCell
        let habit = habits[indexPath.row]
        cell.name.text = habit.name
        //        cell.standings.text = "\(habit.currentCount) / \(habit.target) "
        return cell
    }
}
