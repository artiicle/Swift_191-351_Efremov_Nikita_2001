import SwiftUI
import SwiftSoup



class ThirdHostingController: UIHostingController<LabThree> {

    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: LabThree());
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}





struct LabThree: View {
    
    @State var value = "Здесь загрузится значение"
    
    
    var body: some View {
        
        VStack{
            
            Text("Акция Apple:")
            Text(value).font(.largeTitle)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
           
            Button {
                self.sendRequest()
            } label: {
                Text("Отправить запрос")
            }
            
            
            WebView(pageURL: "https://www.tinkoff.ru/invest/stocks/AAPL/")

        }
        
           
         
    }
    
    func sendRequest() {
        
        DispatchQueue.main.async {
        
        let url = URL(string: "https://www.tinkoff.ru/invest/stocks/AAPL/")
           //    let request = URLRequest(url: url!)
             //  webView.loadRequest(request)

               guard let myURL = url else {
               print("Error: \(String(describing: url)) doesn't seem to be a valid URL")
                   return
               }

               do {
                let html = try String(contentsOf: myURL, encoding: .utf8)
                   let doc: Document = try SwiftSoup.parseBodyFragment(html)
                
                let link: Element = try doc.select("span.Money-module__money_2PlRa").first()!
                
//                let link: Element = try doc.select("body > div.application > div > div > div > div.PortalContainer__container_2U5L1 > div.UILayoutPage__page_2sG0K > div:nth-child(2) > div.PlatformLayout__layoutPageComponent_2c4qG > div > div.Container__container_1PkRi > div > div.Row-module__row_3W4eI > div.Column-module__column_YrE5e.Column-module__column_hidden_on_phone_2W092.Column-module__column_hidden_on_tabletS_JyZiL.Column-module__column_hidden_on_tabletL_skZDO.Column-module__column_size_desktopS_4_laKAk > div > div:nth-child(2) > div.SecurityPriceDetailsPure__wrapper_srZsI > div > div > div.SecurityInvitingScreenPure__price_31WUF > span > span".replacingOccurrences(of: ">", with: "")).first()!
            
                    self.value = link.ownText()
                
                
               } catch Exception.Error( _, let message) {
                   print("Message: \(message)")
               } catch {
                   print("error")
               }
            
        }
        
    }
}

struct LabThree_Previews: PreviewProvider {
    static var previews: some View {
        LabThree()
    }
}
