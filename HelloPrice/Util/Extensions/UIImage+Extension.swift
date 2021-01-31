//
//  UIImage+Extension.swift
//  HelloPrice
//
//  Created by devming on 2020/12/12.
//  Copyright © 2020 besteyes. All rights reserved.
//

import UIKit

enum ImageIdentifier: String {
    case temp = "signin"
    
    case tabHomeOff = "iconHome"
    case tabHomeOn = "iconHomeOn"
    case tabMyItemOff = "iconItem"
    case tabMyItemOn = "iconItemOn"
    case tabMyOff = "iconMy"
    case tabMyOn = "iconMyOn"
    case tabNotiOff = "iconNoti"
    case tabNotiOn = "iconNotiOn"
//    case tabRankOff = "iconRank"
//    case tabRankOn = "iconRankOn"
    
    case appTitle = "app-main-title"
    case apple = "iconAccountApple"
    case google = "iconAccountGoogle"
    case kakao = "iconAccountKakao"
    case back = "iconBack"
    case bellOn = "iconBell"
    case bellOff = "iconBellOff"
    case categoryAll = "iconCategoryAll"
    case categoryElectric = "iconCategoryElectronic"
    case chevron = "iconChevron"
    case chevronBlack = "iconChevronBlack"
    case categoryComputer = "iconComputer"
    case myDark = "iconMyDark"
    case myHelp = "iconMyHelp"
    case myLogout = "iconMyLogout"
    case myNoti = "iconMyNoti"
    case myOpensource = "iconMyOpensource"
    case myReport = "iconMyReport"
    case mySection = "iconMySection"
    case myStaff = "iconMyStaff"
    case myTelegram = "iconMyTelegram"
    case myVersion = "iconMyVer"
    case notiOff = "iconNotiRegOff"
    case notiOn = "iconNotiRegOn"
    case search = "iconSearch"
    case searchCancel = "iconSearchCancel"
    case searchMin = "iconSearchMin"
    case url = "iconUrl"
    case close = "iconXmark"
    case homeTitle = "titleHome"
    
}

extension UIImage {
    convenience init(identifier: ImageIdentifier) {
        self.init(named: identifier.rawValue)!
    }
}
