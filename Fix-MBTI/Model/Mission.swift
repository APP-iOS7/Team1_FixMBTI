//
//  Mission.swift
//  FixMBTI
//
//  Created by KimJunsoo on 2/4/25.
//

import Foundation
import SwiftData

@Model
final class Mission {
    var title: String = ""          // 미션 제목
    var detailText: String = ""    // 게시글 내용
    var timestamp: Date = Date()          // 미션 생성 날짜
    var randomTime: Date? = nil          // 랜덤 타임
    var imageName: String? = ""     // 이미지
    var category: String = ""
    
    init(title: String, detailText: String, timestamp: Date = Date(), randomTime: Date? = nil, imageName: String? = nil, category: String) {
        self.title = title
        self.detailText = detailText
        self.timestamp = timestamp
        self.randomTime = randomTime
        self.imageName = imageName
        self.category = category
    }
}

// 더미 데이터
var missions: [Mission] = [
    // 🔹 I(내향) → E(외향) 미션
    Mission(title: "새로운 사람에게 먼저 인사하기", detailText: "3명에게 먼저 대화를 시도하세요.", category: "E"),
    Mission(title: "모임에서 의견 말하기", detailText: "모임이나 회의에서 최소 1번은 의견을 말해보세요.", category: "E"),
    Mission(title: "전화 대신 직접 만나기", detailText: "중요한 대화를 전화 대신 직접 만나서 해보세요.", category: "E"),
    
    // 🔹 E(외향) → I(내향) 미션
    Mission(title: "혼자만의 시간 보내기", detailText: "카페나 공원에서 혼자 조용히 시간을 보내보세요.", category: "I"),
    Mission(title: "하루 동안 SNS 금지", detailText: "SNS를 하루 동안 사용하지 않고 자기 자신에게 집중하세요.", category: "I"),
    Mission(title: "하루 동안 3명 이상과 연락하지 않기", detailText: "의식적으로 혼자만의 시간을 늘려보세요.", category: "I"),
    
    // 🔹 S(감각) → N(직관) 미션
    Mission(title: "미래의 나에게 편지 쓰기", detailText: "5년 후의 나에게 편지를 써보세요.", category: "N"),
    Mission(title: "창의적인 스토리 만들어보기", detailText: "즉흥적으로 짧은 이야기를 만들어보세요.", category: "N"),
    Mission(title: "평소에 관심 없던 철학 책 읽기", detailText: "철학 또는 자기계발 서적을 10분 이상 읽어보세요.", category: "N"),

    // 🔹 N(직관) → S(감각) 미션
    Mission(title: "하루 동안 주변의 소리 기록하기", detailText: "하루 동안 들린 소리를 메모해보세요.", category: "S"),
    Mission(title: "눈앞에 보이는 사물 세부 묘사하기", detailText: "지금 보이는 사물을 3가지 이상 자세히 설명해보세요.", category: "S"),
    Mission(title: "지금까지 경험한 것 중 가장 현실적인 조언 적기", detailText: "논리적으로 타인에게 줄 수 있는 조언을 적어보세요.", category: "S"),

    // 🔹 T(논리) → F(감성) 미션
    Mission(title: "친구에게 감정 표현 문자 보내기", detailText: "감사의 표현이 담긴 메시지를 친구에게 보내보세요.", category: "F"),
    Mission(title: "오늘 하루 감정 일기 쓰기", detailText: "하루 동안 느낀 감정을 일기에 기록하세요.", category: "F"),
    Mission(title: "타인의 고민 듣고 공감해보기", detailText: "누군가의 고민을 듣고 공감을 표현해보세요.", category: "F"),

    // 🔹 F(감성) → T(논리) 미션
    Mission(title: "데이터 기반으로 결정 내리기", detailText: "오늘 한 가지 결정을 데이터와 논리를 사용해 내려보세요.", category: "T"),
    Mission(title: "감정이 아니라 논리로 주장해보기", detailText: "대화를 할 때 감정보다 논리를 중심으로 말해보세요.", category: "T"),
    Mission(title: "객관적인 기사 읽고 요약하기", detailText: "뉴스나 과학 기사를 읽고 3줄로 요약해보세요.", category: "T"),

    // 🔹 J(계획) → P(즉흥) 미션
    Mission(title: "즉흥적인 약속 잡기", detailText: "계획 없이 친구에게 연락해서 만나보세요.", category: "P"),
    Mission(title: "하루 동안 미리 계획 없이 생활해보기", detailText: "일정을 정하지 않고 하루를 보내보세요.", category: "P"),
    Mission(title: "음식 주문할 때 랜덤 선택하기", detailText: "메뉴를 고민하지 않고 즉흥적으로 골라보세요.", category: "P"),

    // 🔹 P(즉흥) → J(계획) 미션
    Mission(title: "내일 하루 계획 세우기", detailText: "내일 할 일을 아침에 미리 계획해보세요.", category: "J"),
    Mission(title: "한 주의 목표 설정하기", detailText: "일주일 동안의 목표를 구체적으로 정리해보세요.", category: "J"),
    Mission(title: "정해진 시간에 할 일 완료하기", detailText: "하나의 일을 정한 시간 안에 마무리해보세요.", category: "J")
]
