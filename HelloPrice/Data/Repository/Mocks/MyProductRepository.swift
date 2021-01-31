//
//  MyProductRepository.swift
//  HelloPrice
//
//  Created by devming on 2021/01/30.
//  Copyright © 2021 besteyes. All rights reserved.
//

import Foundation
import RxSwift

class MyProductRepository: ProductRepository {
    
    let json = """
    {
    "size": 2,
    "contents": [
        {
            "id": 2,
            "product": {
                "id": 2259,
                "productCode": "5353095",
                "productName": "플레이어 언노운의 배틀그라운드 PC 스팀 코드",
                "url": "http://prod.danawa.com/info/?pcode=5353095",
                "imageUrl": "http://img.danawa.com/prod_img/500000/095/353/img/5353095_1.jpg?shrink=500:500&_v=20171027181629",
                "description": "PC / 게임타이틀 / 장르: 액션 , FPS , TPS , 슈팅 , 실시간 / 한국어 / 1인용 / 온라인 대응 / 다운로드상품 / 청소년이용불가 / 출시상품 / 스팀 연동",
                "saleStatus": "SALE",
                "lastConfirmAt": null,
                "productSale": {
                    "id": 64,
                    "saleType": "NORMAL",
                    "price": 11200,
                    "prevPrice": 11200,
                    "priceChangeRate": 0.0,
                    "additionalInfo": ""
                }
            }
        },
        {
            "id": 39,
            "product": {
                "id": 2253,
                "productCode": "8459973",
                "productName": "AMD 라이젠5-3세대 3600 (마티스) (정품)",
                "url": "http://prod.danawa.com/info/?pcode=8459973",
                "imageUrl": "http://img.danawa.com/prod_img/500000/973/459/img/8459973_1.jpg?shrink=500:500&_v=20200429111019",
                "description": "AMD(소켓AM4) / 3세대 (Zen 2) / 7nm / 헥사(6)코어 / 쓰레드 12개 / 기본 클럭: 3.6GHz / 3MB / 32MB / 설계전력: 65W / PCIe 4.0 / 메모리 규격: DDR4 / 메모리 버스: 3200MHz / Wraith Stealth 쿨러 포함 / 출시가: 199달러(VAT별도)",
                "saleStatus": "SALE",
                "lastConfirmAt": "2020-06-01T14:49:40",
                "productSale": {
                    "id": 49,
                    "saleType": "NORMAL",
                    "price": 223970,
                    "prevPrice": 223900,
                    "priceChangeRate": 0.03126,
                    "additionalInfo": ""
                }
            }
        },
        {
            "id": 40,
            "product": {
                "id": 2257,
                "productCode": "9790980",
                "productName": "이엠텍 지포스 GTX 1660 SUPER STORM X Dual OC D6 6GB",
                "url": "http://prod.danawa.com/info/?pcode=9790980",
                "imageUrl": "http://img.danawa.com/prod_img/500000/980/790/img/9790980_1.jpg?shrink=500:500&_v=20200220160148",
                "description": "GTX 1660 SUPER / 12nm / 1530MHz , 부스트 1830MHz / 1408개 / PCIe3.0x16 / GDDR6(DDR6) / 14000MHz / 6GB / 192-bit / DVI / HDMI / DP / 최대 모니터 3개 / 최대 125W / 정격파워 450W 이상 / 전원부: 3+2페이즈 / 2개 팬 / 235mm / 백플레이트 / LED 라이트",
                "saleStatus": "SALE",
                "lastConfirmAt": null,
                "productSale": {
                    "id": 61,
                    "saleType": "CARD",
                    "price": 286480,
                    "prevPrice": 286480,
                    "priceChangeRate": 0.0,
                    "additionalInfo": "신한"
                }
            }
        }
    ]
    }
    
    """
    
    func fetchMyProducts() -> Single<FetchMyProductResponse> {
        let jsonData = json.data(using: .utf8)!
        do {
            let result = try JSONDecoder().decode(FetchMyProductResponse.self, from: jsonData)

            return Single.just(result)
        } catch {
            print("error : \(error)")
        }
        return Single.just(FetchMyProductResponse())
    }
    
    
}
