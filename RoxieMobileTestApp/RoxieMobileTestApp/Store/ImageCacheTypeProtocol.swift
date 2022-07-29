//
//  ImageCacheTypeProtocol.swift
//  RoxieMobileTestApp
//
//  Created by Anna Buzhinskaya on 29.07.2022.
//

import Foundation
import UIKit

protocol ImageCacheTypeProtocol {
    func image(for url: URL) -> UIImage?
    func insertImage(_ image: UIImage?, for url: URL)
    func removeImage(for url: URL)
    func removeAllImages()
    
    subscript(_ url: URL) -> UIImage? { get set }
}
