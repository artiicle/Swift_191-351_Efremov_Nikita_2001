import SwiftUI
import Combine
import AVKit

//UIkit to SwiftUI
class ChildHostingController: UIHostingController<LabTwo> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: LabTwo());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
struct LabTwo : View {
    var body: some View {
        NavigationView {
            
        
        List{
            NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: "http://techslides.com/demos/samples/sample.mp4")!)).navigationTitle(Text("Просмотр видео"))) {
                Text("Просмотр видео")
            }
            NavigationLink(destination:  CameraView().navigationTitle(Text("Сделать фото"))) {
                Text("Сделать фото")
            }
            NavigationLink(destination:  RecordingView().navigationTitle(Text("Запись видео"))) {
                Text("Запись видео")
            }
        }.navigationTitle(Text("Lab2"))
       
        }
    }
}
