import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


class Scan extends StatefulWidget {
	@override
	State<StatefulWidget> createState() => _Scan();
}

class _Scan extends State<Scan> {
	
	CameraController _controller;
	
	Future<void> _initializeControllerFuture;
	
	@override
	void initState() {
		super.initState();
		
		availableCameras().then((List<CameraDescription> cameras) {
			setState(() {
				this._controller = CameraController(cameras.first, ResolutionPreset.medium);
				
				_initializeControllerFuture = _controller.initialize();
			});
		});
		
	}
	
	@override
	void dispose() {
		_controller?.dispose();
		super.dispose();
	}
	
	
	@override
	Widget build(BuildContext context) {
		
		return FutureBuilder<void>(
			future: _initializeControllerFuture,
			builder: (context, snapshot) {
				if (snapshot.connectionState == ConnectionState.done) {
					// If the Future is complete, display the preview.
					return CameraPreview(_controller);
				} else {
					return Center(child: (() {
						if(snapshot.hasError || !snapshot.hasData) {
							return Text("Oepss geen camera's.");
						}
						
						return CircularProgressIndicator();
					})());
				}
			},
		);
	}
	
}