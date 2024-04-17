//
//  MemoEmotionDistributionView.swift
//  NC1
//
//  Created by ram on 4/17/24.
//

import SwiftUI

struct EmotionMainView: View {
    @EnvironmentObject var memoViewModel: MemoViewModel
    
    
    var body: some View {
        let emotionCounts = memoViewModel.countEmotionOccurrences()
        
        return NavigationStack {
            VStack {
                Spacer()
                HStack {
                    ForEach(emotionCounts.sorted(by: { $0.value > $1.value }), id: \.key) { emotion, count in
                        
                        CircleView(radiusScale: CGFloat(count), text: emotion)
                        
                    }
                    
                }
                Spacer()
                NavigationLink(destination: MemoCreateView()) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 50))
                        .foregroundColor(.green)
                }
                .padding()
            }
            .onAppear(){
                ReadToFile()
                
            }
        }
    }
    func ReadToFile(){
        
        //파일매니저 인스턴스 생성
        let fileManager = FileManager.default
        
        //사용자의 문서 경로
        let documentPath: URL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        //파일을 저장할 디렉토리 경로(URL) 반환 = 경로 추가 여기서는 문서/새 폴더
        let directoryPath: URL = documentPath.appendingPathComponent(folderName)
        
        //
        let filePath: URL = directoryPath.appendingPathComponent(fileName)
        
        do {
            if !fileManager.fileExists(atPath: directoryPath.path) { //디렉토리가 있는지 확인하고 디렉토리를 만듬
                
                try fileManager.createDirectory(at: directoryPath, withIntermediateDirectories: false,attributes: nil)
                //withIntermediateDirectories:중간 디렉토리 만들꺼임?
                //attribute:파일접근 권한,그룹 등등 폴더 속성 정의
                
                print("폴더 만들었지롱")
                
            }
            else{
                //                print("폴더 already existed")
//                print("filePath:\(filePath)")
            }
        } catch {
            print("create folder error. do something")
        }
        
        // 만들어진 폴더&파일 있는지 확인하고 없으면 만들기
        // 정상적으로 만들어졌으면 데이터 가져오기 or 데이터 넣기
        
        /* 데이터 가져오기 Process */
        // 폴더파일 존재가 true이면 디코딩
        // 환경변수를 뷰모델에서 관리해도 되나?
        
        
        if fileManager.fileExists(atPath: filePath.path) {
            do {
                
                // 파일에서 데이터를 읽어와 Data 객체로 변환
                let fileData = try Data(contentsOf: filePath)
                
                // 디코더 객체 생성
                let decoder = JSONDecoder()
                
                // 기존의 데이터와 중복을 없애기 위해 환경변수를 초기화
                memoViewModel.memoHistory = []
                
                // 디코딩된 메모 데이터를 MemoViewModel의 memoHistory에 추가
                memoViewModel.memoHistory = try decoder.decode([MemoModel].self, from: fileData)
                
                
            } catch {
                print("Failed to read and decode memo data:", error)
            }
        }
        
        
    }
}

#Preview {
    EmotionMainView()
}
