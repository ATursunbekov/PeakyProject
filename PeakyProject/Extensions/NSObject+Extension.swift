//
//  NSObject+Extension.swift
//  PeakyProject
//
//  Created by Alikhan Tursunbekov on 1/5/24.
//

import UIKit

extension NSObject {
    func formatDate(from dateString: String, inputFormat: String, outputFormat: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        
        guard let date = dateFormatter.date(from: dateString) else {
            print("Error: The date string does not match the expected format.")
            return nil
        }
        
        dateFormatter.dateFormat = outputFormat
        let formattedDateString = dateFormatter.string(from: date)
        return formattedDateString
    }
    
    // Dynamic size
    func DHeight(to: CGFloat) -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIScreen.main.bounds.height * to / 812
        } else {
            return UIScreen.main.bounds.height * to / 1366
        }
    }
    
    func DWidth(to: CGFloat) -> CGFloat {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIScreen.main.bounds.width * to / 375
        } else {
            return UIScreen.main.bounds.width * to / 1024
        }
    }
}
