////
////  MemoContentView.swift
////  NC1
////
////  Created by ram on 4/12/24.
////
//
//import SwiftUI
//
//struct OldMemoCreateView: View {
//    @State var content:String = ""
//    @EnvironmentObject var memoViewModel : MemoViewModel
//    @Environment(\.presentationMode) var presentationMode
//    @State var showingAlert1 = false
//    @State var showingAlert2 = false
//    @State var emotion_num = static_num
//    
//
//    
//    var body: some View {
//        VStack() {
//            OldCurrentDateView(dateString: $memoViewModel.tmpMemo.memo_date)
//            OldEmotionView(emotion_num: $emotion_num)
//                .frame(height: 120)
//                .padding(.vertical)
//
//            TextEditor(text: $memoViewModel.tmpMemo.content)
//                .lineSpacing(10)
//                .disableAutocorrection(true)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 25)
//                        .stroke(Color.gray, lineWidth: 1)
//                )
//                .padding(.vertical)
//
//            Button(action: {
//                //TODO: 함수로 묶기
//                if memoViewModel.tmpMemo.content != "" ||  Int(memoViewModel.tmpMemo.emotion ?? String(static_num)) != static_num{
//                    
//                    saveData()
//                    memoViewModel.writeToFile()
//                    self.presentationMode.wrappedValue.dismiss()
//                }
//                else{
//                    showingAlert1 = true
//                }
//                
//            }, label: {
//                Text("Save")
//                    .padding(.vertical,10)
//                    .padding(.horizontal,50)
//                    .font(Font.system(size: 25, weight: .bold, design: .serif))
//                    .foregroundColor(.white)
//                    .background(RoundedRectangle(cornerRadius: 20))
//                    .foregroundColor(.black)
//                
//            })
//        }
//        
//        .padding()
//        .alert(isPresented: $showingAlert1) {
//            Alert(title: Text("내용을 입력해주세요."), message: nil,
//                  dismissButton: .default(Text("넹")))
//        }
////        .navigationBarBackButtonHidden(true)
//        .navigationBarTitleDisplayMode(.inline)
//        
//        
//    }
//    func saveData(){
//        let currentDate = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let dateString = dateFormatter.string(from: currentDate)
//        self.memoViewModel.tmpMemo.memo_date = dateString
//        self.memoViewModel.tmpMemo.emotion = String(emotion_num)
//        print(memoViewModel.tmpMemo)
//        memoViewModel.memoHistory.append(memoViewModel.tmpMemo)
//        memoViewModel.tmpMemo = OldMemoModel(content: "")
//        
//    }
//}
//
//
//// 함수를 만들고 사용하는 걸까, 같은 코드가 반복되면 함수로 만드는 걸까,, 뭐가 좋은건지 정해져있을까?
//// MISSION:함수로 묶어보고 검사받기
//// 얼마나 쪼개야할지
//// 처음 어떻게 접근할지
//// 디렉토리 있는지 확인 -> 파일 있는지 확인 ->
//// ListView에서 파일 읽어오고 디코딩해서 환경변수에 넣고 리스트 보여주기
//// MemoCreateView 버튼 클릭시 환경변수에 추가하고 인코딩하고 파일에 넣기
//// 파일 입출력을 뷰가 변경될 때마다 해도 부담이 없을지
//// background 함수가 있대
//// 그리고 디렉토리가 있는지 확인,,파일이 있는지 확인해야하고
//// 파일을 어디서 생성하고,, 빈 파일을 만들 수 있는지,,, 
////
