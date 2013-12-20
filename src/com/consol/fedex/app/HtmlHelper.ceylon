import ceylon.html { Html, Head, Tag, html5, Ul, Li }


class HtmlHelper() {
	shared Ul dynamicList({Object+}items, Li render(Object o)) {
		print("Hello");
		print(items.size);
		Ul ul = Ul {
			for(Object item in items) {
				render(item)
			}			
		};
		return ul;
	}	
}
