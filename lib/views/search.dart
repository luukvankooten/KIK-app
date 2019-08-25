import 'package:flutter/material.dart';
import 'package:kik/services/search.dart' as api;
import 'package:kik/views/products/list.dart';
import 'package:kik/theme.dart';

class Search extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Search();
}

class _Search extends State<Search> {
	Future<List<api.Result>> results;
	
	final textController = TextEditingController();
	
	void _search(String text) {
		if (text.length < 1) {
			return;
		}
		
		setState(() {
			this.results = api.fetchResults(text);
		});
	}
	
	void _onChange(String text) {
		_search(text);
	}
	
	void _onSubmit(String text) {
		if(text == this.textController.text) {
			return;
		}
		
		this._search(text);
	}
	
	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				Padding(
				  padding: const EdgeInsets.only(
					  bottom: 5.0
				  ),
				  child: TextField(
					onSubmitted: _onSubmit,
					onChanged: _onChange,
					controller: textController,
					decoration: InputDecoration(
						enabledBorder: OutlineInputBorder(
							borderRadius: const BorderRadius.all(
								Radius.circular(0.0)
							),
							borderSide: const BorderSide(
								color: Colors.grey
							)
						),
						labelText: "Zoek term...",
						labelStyle: const TextStyle(
							color: Colors.grey
						),
					),
				  ),
				),
				Expanded(
					child: FutureBuilder<List<api.Result>>(
						future: results,
						builder: (BuildContext context, AsyncSnapshot snapshot) {
							String text;
							
							switch (snapshot.connectionState) {
								case ConnectionState.none:
									text = "Geen zoek opdracht.";
									break;
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
										text = "Geen resultaaten.";
										break;
									}
									
									return ProductList(items: snapshot.data);
							}
							
							return Center(
								child: Text(text,
									style: TextStyle(color: Colors.grey),
								)
							);
						},
					)
				)
			]
		);
	}
}