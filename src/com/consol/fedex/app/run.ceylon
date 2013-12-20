import ceylon.html {
	Html,
	Body,
	Head,
	Div,
	H1,
	Ul,
	Li,
	Script,
	javascript, A
}
import ceylon.io {
	SocketAddress
}
import ceylon.net.http.server {
	...
}
import com.consol.fedex.app { HtmlHelper }
import ceylon.net.http { Header }
import com.consol.skillapp.model { Person, Skill }
//import ceylon.net.http { get, Method }

"Run the module `com.consol.fedex.app`."
shared void run() {
	variable {Person+} persons = {
		Person("Tobias","Schneck",26,"ConSol* Software", *{Skill("Java", 5), Skill("Ceylon", 0)}),
		Person("Tim","Keiner",25,"ConSol* Software", *{Skill("Java", 5), Skill("Ceylon", 0)})
	};
    Server server = newServer {
        Endpoint {
            path = isRoot();
            void service(Request request, Response response) {               
                {String+} itemlist = { "item1", "item2" };
                HtmlHelper helper = HtmlHelper();
            	response.writeString(Html {
                	head = Head {
                		title = "My Page";
                		headChildren = {
                			                			
                		};
                	};
                	body = Body {
                		H1("Ceylon Fans...  "),
                		Div {                			
                			classNames = ["body", "content"];                			
                		}, 
                		             		
                		helper.dynamicList {
                			items = persons;
                			render(Object o) => Li(o.string + "...");
                		}                		
                	};
            	}.string);
        	}
    	},
        Endpoint {
  			path = startsWith("/add");
  			void service(Request request, Response response) {
  				// TODO add
  				String? name = request.parameter("name");
  				if(exists name) {
  					persons = { Person(name,name,12,"Random", *{ Skill("Kaffeemaschine", 5)}), *persons};
  				}
  				print(name);
  				response.addHeader(Header("location", "/"));
  			}
        }
    };
    server.start(SocketAddress("127.0.0.1",12345));
}