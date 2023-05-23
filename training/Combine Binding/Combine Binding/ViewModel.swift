//
//  ViewModel.swift
//  Combine Binding
//
//  Created by kimseongjun on 2023/05/23.
//

import Foundation
import Combine

final class MainViewModel {
    @Published var todoSchedules = [Schedule]() // todo
    @Published var doingSchedules = [Schedule]() // doing
    @Published var doneSchedules = [Schedule]() // done
 


    func addTodoSchedule(_ schedule: Schedule) {
        todoSchedules.append(schedule)

    }
    
    func createSchedule(titleText: String?, contentText: String?, expirationDate: Date) -> Schedule {
        guard let validTitleText = titleText, let validContentText = contentText else {
            return Schedule()
        }
        
        let schedule = Schedule(title: validTitleText, content: validContentText, expirationDate: Date())

        return schedule
    }

}

