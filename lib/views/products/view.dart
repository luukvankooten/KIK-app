import 'package:flutter/material.dart';
import 'package:kik/services/search.dart';
import 'package:kik/theme.dart';

class ProductArguments {
	final Result result;
	
	ProductArguments(this.result);
}

class Product extends StatelessWidget {
	
	static const String routeName = '/products';
	
	@override
	Widget build(BuildContext context) {
		final Result result = ModalRoute.of(context).settings.arguments;
		
		return Scaffold(
			appBar: AppBar(
				title: Text(
					"KIK",
					style: TextStyle(fontWeight: FontWeight.bold)
				),
				centerTitle: true,
			),
			body: Container(
				padding: EdgeInsets.all(10.0),
				child: Column(
					children: <Widget>[
						GestureDetector(
							onTap: () {
								Navigator.push(context, MaterialPageRoute(builder: (_) {
									return ViewImage(
										imgPath: result.imgSize(Sizes.large)
									);
								}));
							},
							child: Image.network(
								result.imgSize(Sizes.large),
								fit: BoxFit.fitWidth
							),
						),
						Padding(
							padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
							child: Divider(color: Colors.grey)
						),
						Text(result.description,
							style: TextStyle(
								fontWeight: FontWeight.bold,
								color: ThemeColor.blue.shade500,
								fontSize: 18.0,
							)
						)
					],
				),
			),
		);
	}
}

class ViewImage extends StatelessWidget {
	final String imgPath;
	
	ViewImage({Key key, @required this.imgPath}) : super(key: key);
	
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			body: GestureDetector(
				onTap: () {
					Navigator.pop(context);
				},
				child: Container(
					color: Colors.black,
					child: Center(
						child: Image.network(
							this.imgPath,
							fit: BoxFit.fitWidth
						)
					),
				),
			),
		);
	}

}