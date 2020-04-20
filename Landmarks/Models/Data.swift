//
//  Data.swift
//  Landmarks
//
//  Created by MGBook on 2020/4/9.
//  Copyright © 2020 MGBook. All rights reserved.
//

import SwiftUI


let landmarkData: [Landmark] = load("landmarkData.json")
let features = landmarkData.filter{ $0.isFeatured }
let hikeData: [Hike] = load("hikeData.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    // 找到文件
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
        
    do {
        // 转为data
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        // 解析json -> dict
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) from main bundle:\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]
    
    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image{
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale:CGFloat(ImageStore.scale), label: Text(verbatim: name))
    }
    
    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let  imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    // 根据图片名得到索引
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
