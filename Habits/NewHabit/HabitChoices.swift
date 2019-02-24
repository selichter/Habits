import Foundation

enum TimePeriod: String, CaseIterable {
    case daily
    case weekly
    case monthly
    case yearly
}

var timePeriodChoices = TimePeriod.allCases.map({$0.rawValue})
