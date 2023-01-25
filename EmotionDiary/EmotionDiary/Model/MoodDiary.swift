//
//  MoodDiary.swift
//  EmotionDiary
//
//  Created by Yuhyeon Kim on 2023/01/23.
//

import Foundation

struct MoodDiary: Identifiable, Codable {
    var id: UUID = UUID()
    var date: String
    var text: String
    var mood: Mood
}

extension MoodDiary {
    private var dateComponent: DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date = formatter.date(from: self.date)
        let dc = calendar.dateComponents([.year, .month], from: date!)
        return dc
    }
    
    var monthlyIdentifier: String {
        return "\(dateComponent.year!)-\(dateComponent.month!)"
    }
}


extension MoodDiary {
    static let list: [MoodDiary] = [
        MoodDiary(date: "2022-10-01 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-10-03 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-10-05 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-10-10 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-10-11 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-10-12 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2022-10-13 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-10-14 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-10-15 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-10-16 00:01:01", text: "My Diary", mood: .good),
        
        MoodDiary(date: "2022-11-01 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-11-03 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-11-05 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-11-15 00:01:01", text: "My Diary", mood: .good),
        
        MoodDiary(date: "2022-12-01 00:01:01", text: "My Diary", mood: .bad),
        MoodDiary(date: "2022-12-03 00:01:01", text: "My Diary", mood: .bad),
        MoodDiary(date: "2022-12-05 00:01:01", text: "My Diary", mood: .notGreat),
        MoodDiary(date: "2022-12-15 00:01:01", text: "My Diary", mood: .notGreat),
        MoodDiary(date: "2022-12-16 00:01:01", text: "My Diary", mood: .notGreat),
        MoodDiary(date: "2022-12-17 00:01:01", text: "My Diary", mood: .notGreat),
        MoodDiary(date: "2022-12-18 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-12-19 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-12-20 00:01:01", text: "My Diary", mood: .good),
        MoodDiary(date: "2022-12-21 00:01:01", text: "My Diary", mood: .good),
        
        MoodDiary(date: "2023-01-01 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2023-01-03 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2023-01-05 00:01:01", text: "My Diary", mood: .great),
        MoodDiary(date: "2023-01-15 00:01:01", text: "My Diary", mood: .great),
    ]
}
