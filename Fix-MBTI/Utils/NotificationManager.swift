//
//  NotificationManager.swift
//  Fix-MBTI
//  랜덤 알림 관리 파일
//  Created by KimJunsoo on 2/5/25.
//

import Foundation
import UserNotifications

class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    static let instance = NotificationManager()
    
    // 1. 알림 권한 요청
    func RequestPermission() {
        let center = UNUserNotificationCenter.current()
        center.delegate = self
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("알림 권한 허용됨 ✅")
            } else {
                print("알림 권한 거부됨 ❌")
            }
        }
    }
    
    // 2. 랜덤한 시간 뒤 미션 알림 예약
    func scheduleMissionNotification() {
        let content = UNMutableNotificationContent()
        content.title = "새로운 MBTI 미션이 도착했습니다!"
        content.body = "지금 앱을 열어 미션을 확인하세요."
        content.sound = .default
        
        let randomDelay = Double.random(in: 1800...10800) // 30분 ~ 3시간 후
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: randomDelay, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
        print("📢 랜덤 미션 알림 예약 완료: \(randomDelay)초 후 도착 예정")
    }
    
    // 3. 앱이 실행 중일 때 알림을 받을 수 있도록 설정
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound, .badge])
    }
}
