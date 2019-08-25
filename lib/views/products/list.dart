import 'package:flutter/material.dart';
import 'package:kik/services/search.dart' as api;
import 'package:kik/theme.dart';
import 'package:kik/views/products/view.dart';
import 'package:kik/services/database.dart';

class ProductList extends StatefulWidget {
	
	final List<api.Result> items;
	
	final bool history;
	
	ProductList({Key key, @required this.items, this.history = true}) : super(key: key);
	
	@override
	_ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
	
	@override
	Widget build(BuildContext context) {
		return ListView.builder(
			shrinkWrap: true,
			itemCount: widget.items.length,
			itemBuilder: (BuildContext context, int index)  {
				api.Result result = widget.items[index];
				
				return GestureDetector(
					onTap: () {
						if (widget.history) {
							History.instance.insert(result);
						}
						
						Navigator.pushNamed(
							context,
							Product.routeName,
							arguments: result
						);
					},
					child: Column(
						children: <Widget>[
							Padding(
								padding: const EdgeInsets.only(top: 5.0),
								child: Row(
									children: <Widget>[
										Padding(
											padding: const EdgeInsets.only(right: 20.0),
											child: Container(
												width: 60,
												height: 60,
												child: Image.network(
													result.imgSize(api.Sizes.medium),
													fit: BoxFit.cover,
												)
											)
										),
										Flexible(
											child: Text(
												result.description,
												style: TextStyle(
													fontWeight: FontWeight.bold,
													color: ThemeColor.blue.shade500,
													fontSize: 18.0,
												),
											)
										),
									],
								)
							),
							Padding(
								padding: const EdgeInsets.only(top: 5.0),
								child: Divider(
									color: Colors.grey,
									height: 15.00,
								)
							),
						],
					)
				);
			}
		);
	}
}