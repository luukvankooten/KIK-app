import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';


Future<List<Result>> fetchResults(term) async {
	final response = await http.get("https://www.kikgoes.nl/index.php?route=product/searchautocomplete&term=" + term);
	
	if(response.statusCode != 200) {
		throw Exception('Failed to load post');
	}
	
	var obj = json.decode(response.body);
	
	return obj.map<Result>((result) => Result.fromJson(result)).toList();
}

enum Sizes {
	small,
	medium,
	large
}

class Result {
	String imgPath, description;
	
	Result({this.imgPath, this.description});
	
	factory Result.fromJson(Map<String, dynamic> json) {
		Document document = parse('''
		<body>
			<span>
				${json['label']}
			</span>
		</body>
		''');
		
		Element span = document.querySelector('span');
		
		String imgPath = span.querySelector('img').attributes['src'];
		
		String description = span.text.replaceAll(RegExp(r'[\t\r\n]+'), '').replaceFirst(r' ', '');
		
		return Result(
			imgPath: imgPath,
			description: description
		);
	}
	
	String imgSize(Sizes size) {
		
		String img = this.imgPath;
		
		switch(size) {
			case Sizes.small:
				return img;
			case Sizes.medium:
				return img.replaceAll(r'32x32', '228x228');
			case Sizes.large:
				return img.replaceAll(r'32x32', '500x500');
		}
		
		return img;
	}
}