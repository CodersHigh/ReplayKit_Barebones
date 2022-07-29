# ReplayKit_Barebones
<br/>

### 프로젝트 소개
- ReplayKit의 기본적인 기능 구현을 익히는 데에 도움을 주는 Bare-bones 프로젝트입니다.
- ReplayKit을 통해 **SwiftUI 기반의, 앱 화면을 녹화하는 앱**을 구현합니다.
- ReplayKit을 처음 활용해 보는 경우, 이 프로젝트의 코드를 살펴보면 도움이 됩니다.


https://user-images.githubusercontent.com/74223246/181688972-d36df5f5-a649-40d5-805a-905f3bdd369c.mp4


<br/>

### ReplayKit이란?     
ReplayKit은 앱에서 **비디오 및 오디오를 녹화하거나 스트리밍**하며, 이를 공유할 수 있게 해주는 프레임워크입니다.
 
<img width="600" alt="ReplayKitImage" src="https://user-images.githubusercontent.com/74223246/181689105-474cb628-3cff-4e07-966a-a96b68a6466c.pngg">

프레임워크 특성 상, 게임에서 멋진 순간을 녹화하거나 게임 플레이 장면을 라이브로 스트리밍하는 등의 기능 구현에 활용되죠. 
(그러나 해당 프로젝트는 앱 화면을 녹화해서 공유하는 간단한 기능만이 구현되어 있습니다.)
ReplayKit에 대해 더 궁금하다면 [Apple의 공식 문서](https://developer.apple.com/documentation/ReplayKit)를 참고해 보세요. 


<br/>
<br/>

### 핵심 코드
녹화를 시작 및 중단하고, 공유 시트를 표시하는 핵심 코드를 참고하세요.  

<br/>

**녹화 시작 및 중단**
```Swift
// 녹화 시작
func startRecording(completion: @escaping (Error?) -> ()) {
    let recorder = RPScreenRecorder.shared()
    recorder.isMicrophoneEnabled = false
        
    recorder.startRecording(handler: completion)
}
```
```Swift
// 녹화 중단
func stopRecording() -> URL {
    let name = UUID().uuidString + ".mov"
    let url = FileManager.default.temporaryDirectory.appendingPathComponent(name)
        
    let recorder = RPScreenRecorder.shared()
    recorder.stopRecording(withOutput: url)
        
    return url
}
```

<br/>
<br/>

**공유 시트 표시**
```Swift
// 공유 시트를 띄우는 함수
func shareSheet(show: Binding<Bool>, items: [Any?]) -> some View {
    return self
        .sheet(isPresented: show) {
            let items = items.compactMap { item -> Any? in
                return item
            }
            if !items.isEmpty {
                ShareSheet(items: items)
            }
        }
}
```
```Swift
// UIKit 공유 시트
struct ShareSheet: UIViewControllerRepresentable {
    
    var items: [Any]
     
    func makeUIViewController(context: Context) -> some UIViewController {
        let view = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return view
    }
   
}
```
