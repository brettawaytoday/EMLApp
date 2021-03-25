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
        distributionManger = makeDistributionManager()
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


func makeSchool() -> School {
    return School("school name")
}

func makeClassroom() -> Classroom {
    return Classroom("classroom name")
}

func makeMealWithDietaries_noFish_vegan() -> Meal {
    let noFish = Dietaries(name: "No Fish", color: "yellow", type: .prefered)
    let vegan = Dietaries(name: "Vegan", color: "red", type: .prefered)
    
    return Meal(.regular, dietaries: [noFish, vegan])
}

func makeMealWithDietaries_noRawOnion_noMeat() -> Meal {
    let noRawOnion = Dietaries(name: "No raw Onion", color: "yellow", type: .prefered)
    let noMeat = Dietaries(name: "No Meat", color: "red", type: .prefered)
    
    return Meal(.regular, dietaries: [noRawOnion, noMeat])
}

func makeMealWithDietaries_noRawOnion_vegan() -> Meal {
    let noRawOnion = Dietaries(name: "No raw Onion", color: "yellow", type: .prefered)
    let vegan = Dietaries(name: "Vegan", color: "red", type: .prefered)
    
    return Meal(.regular, dietaries: [noRawOnion, vegan])
}

func makeMealWithoutDietaries() -> Meal {
    return Meal(.regular, dietaries: [])
}

func makeDistributionManager() -> DistributionManager {
    let modelController = DistributionManager()
    let reportManager = ReportManager()
    
    modelController.reportDelegate = reportManager

    let schools = [School("school one"), School("school two")]

    for school in schools {
        let classrooms = [makeClassroom(), makeClassroom(), makeClassroom(), makeClassroom(), makeClassroom()]

        for classroom in classrooms {
            let meals = [makeMealWithDietaries_noFish_vegan(), makeMealWithDietaries_noFish_vegan(), makeMealWithDietaries_noRawOnion_noMeat(), makeMealWithDietaries_noRawOnion_noMeat(), makeMealWithoutDietaries()]

            for meal in meals {
                addMeal(meal, to: classroom)
            }
            addClassroom(classroom, to: school)
        }
    }

    modelController.schools = schools
    
    return modelController
}

///5 schools with 5 classrooms and 25 meals per classroom -> Meal count = 625 meals / Classroom count = 25
func makeDistributionManagerWithLargeOrder() -> DistributionManager {
    let modelController = DistributionManager()
    
    let reportManager = ReportManager()
    
    modelController.reportDelegate = reportManager

    let schools = [School("school one"),
                   School("school two"),
                   School("school three"),
                   School("school four"),
                   School("school five")
    ]

    for school in schools {
        let classrooms = [makeClassroom(),
                          makeClassroom(),
                          makeClassroom(),
                          makeClassroom(),
                          makeClassroom()
        ]

        for classroom in classrooms {
            ///25 meals
            let meals = [makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithoutDietaries(),
                         makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithoutDietaries(),
                         makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithoutDietaries(),
                         makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithoutDietaries(),
                         makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noFish_vegan(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithDietaries_noRawOnion_noMeat(),
                         makeMealWithoutDietaries()
            ]

            for meal in meals {
                addMeal(meal, to: classroom)
            }
            addClassroom(classroom, to: school)
        }
    }

    modelController.schools = schools
    
    return modelController
}
