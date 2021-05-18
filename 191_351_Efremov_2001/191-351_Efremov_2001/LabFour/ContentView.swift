import Combine
import SwiftUI
import SpotifyWebAPI

struct ContentView: View {
    
    @EnvironmentObject var spotify: Spotify
    
    @State private var alert: AlertItem? = nil
    @State private var cancellables: Set<AnyCancellable> = []

    var body: some View {
        NavigationView{
            List{
            Text(!spotify.isAuthorized ? "Вам нужно войти" : "Добро пожаловать!")
            Text(!spotify.isAuthorized ? "Токен не получен" : "Token = " + (spotify.api.authorizationManager.accessToken ?? ""))
                .font(.footnote)
            NavigationLink(destination:  SavedAlbumsGridView().environmentObject(spotify)) {
                Text("Lab 5: Сохраненные альбомы")
            }
            }
            .navigationTitle(Text("Spotify"))
        }
        //.padding()
       
            .navigationBarItems(trailing: logoutButton)
            .disabled(!spotify.isAuthorized)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        // The login view is presented if `Spotify.isAuthorized` == `false.
        // When the login button is tapped, `Spotify.authorize()` is called.
        // After the login process sucessfully completes, `Spotify.isAuthorized`
        // will be set to `true` and `LoginView` will be dismissed, allowing
        // the user to interact with the rest of the app.
        .modifier(LoginView())
        // Presented if an error occurs during the process of authorizing
        // with the user's Spotify account.
        .alert(item: $alert) { alert in
            Alert(title: alert.title, message: alert.message)
        }
        // Called when a redirect is received from Spotify.
        

    }
    
    /**
     Handle the URL that Spotify redirects to after the user
     Either authorizes or denies authorizaion for the application.
     
     This method is called by the `onOpenURL(perform:)` view modifier
     directly above.
     */
   
    /// Removes the authorization information for the user.
    var logoutButton: some View {
        // Calling `spotify.api.authorizationManager.deauthorize` will
        // cause `SpotifyAPI.authorizationManagerDidDeauthorize` to emit
        // a signal, which will cause
        // `Spotify.authorizationManagerDidDeauthorize()` to be called.
        Button(action: spotify.api.authorizationManager.deauthorize, label: {
            Text("Logout")
                .foregroundColor(.white)
                .padding(7)
                .background(Color(#colorLiteral(red: 0.3923448698, green: 0.7200681584, blue: 0.19703095, alpha: 1)))
                .cornerRadius(10)
                .shadow(radius: 3)
            
        })
    }
}


