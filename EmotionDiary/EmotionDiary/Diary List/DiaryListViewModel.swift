//
//  DiaryListViewModel.swift
//  EmotionDiary
//
//  Created by Yuhyeon Kim on 2023/01/25.
//

import Foundation
import Combine

final class DiaryListViewModel: ObservableObject {
    //    원하는 것
    //    Sequence -> Dictionary
    //
    //    AS-IS
    //    [MoodDiary]
    //    ->
    //    TO-BE
    //    [String: [MoodDiary]]
    //    "2022-10" : [MoodDiary]
    //    "2022-11" : [MoodDiary]
    //    "2022-12" : [MoodDiary]
    //    "2023-01" : [MoodDiary]
    // 데이터 파일에서 일기 리스트 가져오기
    // list에 해당 일기 객체들 세팅
    // list 세팅 되면 dic도 세팅하기
    let storage: MoodDiaryStorage
    
    @Published var list: [MoodDiary] = []
    @Published var dic: [String : [MoodDiary]] = [:]
    
    var subscriptions = Set<AnyCancellable>()
    
    init(storage: MoodDiaryStorage) {
        self.storage = storage
        bind()
    }
    
    var keys: [String] {
        return dic.keys.sorted { $0 < $1 }
    }
    
    private func bind() {
        $list.sink { items in
            self.dic = Dictionary(grouping: items, by: { $0.monthlyIdentifier })
            self.persist(items: items)
        }.store(in: &subscriptions)
    }
    
    func persist(items: [MoodDiary]) {
        guard items.isEmpty == false else { return }
        self.storage.persist(items)
    }
    
    func fetch() {
        self.list = storage.fetch()
    }
}
