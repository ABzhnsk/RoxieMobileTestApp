//
//  DateFormatter+Extension.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 29.07.2022.
//

import Foundation

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        return df
    }()
    
    static let timeFormatter: DateFormatter = {
        let tf = DateFormatter()
        tf.timeStyle = .short
        return tf
    }()
}
