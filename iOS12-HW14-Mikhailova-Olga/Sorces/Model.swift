//
//  Model.swift
//  HW14
//
//  Created by mbpro2.0/16/512 on 04.02.2024.
//

import Foundation

struct ListItem {
    let title: String
    let subtitle: String
    let image: String
}

enum ListSection {
    case albums([ListItem])
    case shared([ListItem])
    case media([ListItem])
    case utilities([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .albums(let items),
                .shared(let items),
                .media(let items),
                .utilities(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .albums(_):
            return "My Albums"
        case .shared(_):
            return "People & Places"
        case .media(_):
            return "Media Types"
        case .utilities(_):
            return "Other Albums"
        }
    }
}

struct Elements {
    
    static let shared = Elements()
    
    let albums: ListSection = {
        .albums([.init(title: "Recents", subtitle: "483", image: "1"),
                 .init(title: "Family", subtitle: "9",image: "2"),
                 .init(title: "Favorites", subtitle: "29",image: "3"),
                 .init(title: "Recepts", subtitle: "3",image: "4"),
                 .init(title: "My photos", subtitle: "183",image: "5"),
                 .init(title: "Ideas for photos", subtitle: "138",image: "6"),
                 .init(title: "Videos", subtitle: "23",image: "7"),
                 .init(title: "Funny", subtitle: "7",image: "8"),
                 .init(title: "Patterns", subtitle: "15",image: "9"),
                 .init(title: "Memories", subtitle: "26",image: "10")
        ])
    }()
    
    let shared: ListSection = {
        .shared([.init(title: "People", subtitle: "18", image: "11"),
                 .init(title: "Places", subtitle: "62", image: "map")
        ])
    }()
    
    let media: ListSection = {
        .media([.init(title: "Videos", subtitle: "262",image: "video"),
                .init(title: "Selfies", subtitle: "182",image: "figure.2.circle"),
                .init(title: "Slo-mo", subtitle: "1",image: "sun.max"),
                .init(title: "Bursts", subtitle: "3",image: "square.3.layers.3d.down.right"),
                .init(title: "Screenshots", subtitle: "56",image: "camera.viewfinder")
        ])
    }()
    
    let utilities: ListSection = {
        .utilities([.init(title: "Imports", subtitle: "0", image: "tray.and.arrow.down"),
                    .init(title: "Fhidden", subtitle: "0",image: "eye.slash"),
                    .init(title: "Recently Deleted", subtitle: "0",image: "trash")
        ])
    }()
    
    var elements: [ListSection] {
        [albums, shared, media, utilities]
    }
}


