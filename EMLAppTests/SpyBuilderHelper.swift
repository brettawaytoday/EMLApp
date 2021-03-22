//
//  SpyBuilderHelper.swift
//  EMLAppTests
//
//  Created by Brett Christian on 23/03/21.
//

import Foundation
@testable import EMLEngine
@testable import EMLApp


public class SpyBuilder {
    var distributionManger: DistributionManager?
    var dataManager: DataManager?
    
    init() {
        distributionManger = DistributionManager()
        self.dummyData()
        dataManager = DataManager(distributionManger!)
    }
    
    func dummyData() {
        let school = School("School")
        let classroom = Classroom("Classroom")
        let meal = Meal(.regular, dietaries: [])
        addMeal(meal, to: classroom)
        addClassroom(classroom, to: school)
        distributionManger?.schools = [school]
    }
}
