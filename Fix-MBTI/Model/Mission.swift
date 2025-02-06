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
    var detailText: String = ""    // 게시물 텍스트
    var timestamp: Date = Date()          // 미션 생성 날짜
    var randomTime: Date? = nil          // 랜덤 타임
    var imageName: String? = ""     // 게시물 이미지 추가
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

@Model
class ActiveMission {
    var title: String
    var detailText: String
    var category: String
    var timestamp: Date
    
    init(mission: Mission) {
        self.title = mission.title
        self.detailText = mission.detailText
        self.category = mission.category
        self.timestamp = Date()
    }
}

// 미션용 데이터
let missions: [Mission] = [
    // 🔹 I(내향) → E(외향) 미션
    Mission(title: "새로운 사람에게 먼저 인사하기", detailText: "3명에게 먼저 대화를 시도하세요.", category: "E"),
    Mission(title: "모임에서 의견 말하기", detailText: "모임이나 회의에서 최소 1번은 의견을 말해보세요.", category: "E"),
    Mission(title: "전화 대신 직접 만나기", detailText: "중요한 대화를 전화 대신 직접 만나서 해보세요.", category: "E"),
    Mission(title: "사람 많은 곳에서 활동하기", detailText: "카페나 공원에서 1시간 이상 사람들과 함께 시간을 보내보세요.", category: "E"),
    Mission(title: "새로운 그룹 활동 참여하기", detailText: "새로운 동호회나 그룹 활동에 참여해보세요.", category: "E"),

    // 🔹 E(외향) → I(내향) 미션
    Mission(title: "혼자만의 시간 보내기", detailText: "카페나 공원에서 혼자 조용히 시간을 보내보세요.", category: "I"),
    Mission(title: "하루 동안 SNS 금지", detailText: "SNS를 하루 동안 사용하지 않고 자기 자신에게 집중하세요.", category: "I"),
    Mission(title: "하루 동안 3명 이상과 연락하지 않기", detailText: "의식적으로 혼자만의 시간을 늘려보세요.", category: "I"),
    Mission(title: "명상 10분 하기", detailText: "하루 10분간 조용한 공간에서 명상을 해보세요.", category: "I"),
    Mission(title: "혼자 영화 감상하기", detailText: "혼자 영화를 보며 내면의 시간을 가져보세요.", category: "I"),

    // 🔹 S(감각) → N(직관) 미션
    Mission(title: "미래의 나에게 편지 쓰기", detailText: "5년 후의 나에게 편지를 써보세요.", category: "N"),
    Mission(title: "창의적인 스토리 만들어보기", detailText: "즉흥적으로 짧은 이야기를 만들어보세요.", category: "N"),
    Mission(title: "평소에 관심 없던 철학 책 읽기", detailText: "철학 또는 자기계발 서적을 10분 이상 읽어보세요.", category: "N"),
    Mission(title: "기발한 아이디어 3개 적기", detailText: "창의적인 아이디어 3개를 떠올려서 적어보세요.", category: "N"),
    Mission(title: "상상 속 여행 계획 세우기", detailText: "가보고 싶은 여행지를 설정하고 가상으로 여행 계획을 세워보세요.", category: "N"),

    // 🔹 N(직관) → S(감각) 미션
    Mission(title: "하루 동안 주변의 소리 기록하기", detailText: "하루 동안 들린 소리를 메모해보세요.", category: "S"),
    Mission(title: "눈앞에 보이는 사물 세부 묘사하기", detailText: "지금 보이는 사물을 3가지 이상 자세히 설명해보세요.", category: "S"),
    Mission(title: "지금까지 경험한 것 중 가장 현실적인 조언 적기", detailText: "논리적으로 타인에게 줄 수 있는 조언을 적어보세요.", category: "S"),
    Mission(title: "자신이 좋아하는 장소의 디테일한 특징 적기", detailText: "좋아하는 장소를 구체적으로 묘사해보세요.", category: "S"),
    Mission(title: "하루 동안 경험한 일 세부적으로 기록하기", detailText: "오늘 하루 동안 있었던 일을 가능한 한 자세히 기록해보세요.", category: "S"),

    // 🔹 T(논리) → F(감성) 미션
    Mission(title: "친구에게 감정 표현 문자 보내기", detailText: "감사의 표현이 담긴 메시지를 친구에게 보내보세요.", category: "F"),
    Mission(title: "오늘 하루 감정 일기 쓰기", detailText: "하루 동안 느낀 감정을 일기에 기록하세요.", category: "F"),
    Mission(title: "타인의 고민 듣고 공감해보기", detailText: "누군가의 고민을 듣고 공감을 표현해보세요.", category: "F"),
    Mission(title: "좋아하는 노래 듣고 감정 표현하기", detailText: "감성적인 노래를 들으며 느낀 감정을 적어보세요.", category: "F"),
    Mission(title: "하루 동안 긍정적인 말 3번 이상 하기", detailText: "하루 동안 주변 사람들에게 긍정적인 말을 세 번 이상 해보세요.", category: "F"),

    // 🔹 F(감성) → T(논리) 미션
    Mission(title: "데이터 기반으로 결정 내리기", detailText: "오늘 한 가지 결정을 데이터와 논리를 사용해 내려보세요.", category: "T"),
    Mission(title: "감정이 아니라 논리로 주장해보기", detailText: "대화를 할 때 감정보다 논리를 중심으로 말해보세요.", category: "T"),
    Mission(title: "객관적인 기사 읽고 요약하기", detailText: "뉴스나 과학 기사를 읽고 3줄로 요약해보세요.", category: "T"),
    Mission(title: "통계 자료 분석해보기", detailText: "흥미로운 통계를 찾아 분석해보고 느낀 점을 정리하세요.", category: "T"),
    Mission(title: "논리적 주장을 하는 토론 참여하기", detailText: "논리적으로 자신의 의견을 설명해야 하는 토론을 참여해보세요.", category: "T"),

    // 🔹 J(계획) → P(즉흥) 미션
    Mission(title: "즉흥적인 약속 잡기", detailText: "계획 없이 친구에게 연락해서 만나보세요.", category: "P"),
    Mission(title: "하루 동안 미리 계획 없이 생활해보기", detailText: "일정을 정하지 않고 하루를 보내보세요.", category: "P"),
    Mission(title: "음식 주문할 때 랜덤 선택하기", detailText: "메뉴를 고민하지 않고 즉흥적으로 골라보세요.", category: "P"),
    Mission(title: "무작위 활동 선택해서 도전하기", detailText: "즉흥적으로 새로운 활동을 선택해서 실행해보세요.", category: "P"),
    Mission(title: "예정 없이 길을 걸어보기", detailText: "목적 없이 길을 걸으며 새로운 길을 발견해보세요.", category: "P"),

    // 🔹 P(즉흥) → J(계획) 미션
    Mission(title: "내일 하루 계획 세우기", detailText: "내일 할 일을 아침에 미리 계획해보세요.", category: "J"),
    Mission(title: "한 주의 목표 설정하기", detailText: "일주일 동안의 목표를 구체적으로 정리해보세요.", category: "J"),
    Mission(title: "정해진 시간에 할 일 완료하기", detailText: "하나의 일을 정한 시간 안에 마무리해보세요.", category: "J"),
    Mission(title: "월간 계획 세우기", detailText: "이번 달의 목표와 계획을 구체적으로 세워보세요.", category: "J"),
    Mission(title: "시간 관리 앱 활용해보기", detailText: "시간 관리 앱을 사용해 하루 일정을 계획하고 기록해보세요.", category: "J")
]

var dummyPosts: [Mission] = [
    Mission(title: "새로운 사람에게 먼저 인사하기",
            detailText: "처음 보는 사람에게 먼저 인사하는 게 어색했지만, 생각보다 기분이 좋았어요!",
            timestamp: Date(timeIntervalSinceNow: -86400), // 하루 전
            imageName: "smile_photo",
            category: "E"),
    
    Mission(title: "즉흥적인 약속 잡기",
            detailText: "친구한테 갑자기 연락해서 만나자고 했는데, 정말 재밌었어요!",
            timestamp: Date(timeIntervalSinceNow: -43200), // 반나절 전
            imageName: "friend_meetup",
            category: "E"),
    
    Mission(title: "한적한 곳에서 조용히 명상하기",
            detailText: "아무 생각 없이 10분 정도 명상했는데, 마음이 정리되는 느낌이었어요.",
            timestamp: Date(timeIntervalSinceNow: -72000), // 20시간 전
            imageName: nil,
            category: "I"),
    
    Mission(title: "즉흥적으로 여행 계획 세우기",
            detailText: "급하게 여행 계획을 세우고 떠나봤는데, 예상보다 즐거운 경험이었어요!",
            timestamp: Date(timeIntervalSinceNow: -172800), // 이틀 전
            imageName: "travel_plan",
            category: "P"),
    
    Mission(title: "계획 없이 친구랑 만남 가지기",
            detailText: "약속 없이 친구를 만나러 가니 새로운 경험이 되었어요!",
            timestamp: Date(timeIntervalSinceNow: -36000), // 10시간 전
            imageName: "random_meetup",
            category: "P"),
]
