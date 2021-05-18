import SwiftUI
import SwiftSoup



class FouthHostingController: UIHostingController<LabFour> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: LabFour());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



struct LabFour: View {
    @ObservedObject var spotify = Spotify.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some View {
        
        
        
           ContentView().environmentObject(spotify)
         
    }
    
}


