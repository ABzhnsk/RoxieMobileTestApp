//
//  LocalFileManager.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 01.08.2022.
//

import Foundation
import UIKit

class LocalFileManager {
    static let instance = LocalFileManager()
    private init() {}
    
        func saveImage(image: UIImage, key: String) {
            if let jpegRepresentation = image.jpegData(compressionQuality: 1) {
                if let filePath = filePath(for: key) {
                    try? jpegRepresentation.write(to: filePath,
                                                 options: .atomic)
                }
            }
        }
    
        func getImage(for key: String) -> UIImage? {
            if let filePath = filePath(for: key),
               let fileData = FileManager.default.contents(atPath: filePath.path),
               let image = UIImage(data: fileData) {
                return image
            }
            return nil
        }
    
        func filePath(for key: String) -> URL? {
            let fileManager = FileManager.default
            guard let documentURL = fileManager.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).first else { return nil }
    
            return documentURL.appendingPathComponent(key)
        }
}
