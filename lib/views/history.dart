import 'package:flutter/material.dart';
import 'package:kik/services/search.dart';
import 'package:kik/services/database.dart' as db;
import 'package:kik/theme.dart';
import 'package:kik/views/products/list.dart';

class History extends StatefulWidget {
	@override
	State<StatefulWidget> createState() => _History();
}

class _History extends State<History> {
 
	Future<List<Result>> result;
	
	_History() :
		result = db.History.instance.queryAllRows();
	
	@override
	Widget build(BuildContext context) {
		return FutureBuilder(
			future: result,
			builder: (BuildContext context, AsyncSnapshot snapshot) {
				String text;

				switch(snapshot.connectionState) {
				  case ConnectionState.none:
				  case ConnectionState.waiting:
				  case ConnectionState.active:
					return Center(
						child: CircularProgressIndicator(
							backgroundColor: ThemeColor.blue.shade200
						)
					);
				  case ConnectionState.done:
					if (snapshot.hasError) {
						text = "Oepsss, er is iets fout gegaan.";
						break;
					}

					if (snapshot.data.length < 1) {
						text = "Geen geschiedenis.";
						break;
					}
					
					List<Result> results = snapshot.data;

					return ProductList(items: results.reversed.toList(), history: false);
				}

				return Center(
					child: Text(text,
						style: TextStyle(color: Colors.grey),
					)
				);
			}
		);
	}
	
}