//
//  NotificationBody.swift
//  NightShift
//
//  Created by Alaa Eid on 22/12/2023.
//

import Foundation


struct NotificationBody: Identifiable {
    let id = UUID()
    var name: String
}


extension NotificationBody {
    static func all() -> [NotificationBody] {
        return [NotificationBody(name: "Notify 1"),
                NotificationBody(name: "Notify 2"),
                NotificationBody(name: "Notify 3"),
                NotificationBody(name: "Notify 4"),
                NotificationBody(name: "Notify 5")]
    }
}


struct Flag: Identifiable {
    let id = UUID()
    var name: String
}

extension Flag {
    
    static func all() -> [Flag] {
        return [Flag(name: "🇧🇬"),
                Flag(name: "🇨🇬"),
                Flag(name: "🇨🇩"),
                Flag(name: "🇨🇷"),
                Flag(name: "🇨🇮")]
    }
}
