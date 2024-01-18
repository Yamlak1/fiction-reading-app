// ignore_for_file: prefer_const_constructors_in_immutables, prefer_final_fields, avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:proj_app/models/doc_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// ignore: must_be_immutable
class ReaderScreen extends StatefulWidget {
  ReaderScreen(this.doc, {Key? key}) : super(key: key);
  final Document doc;

  @override
  State<ReaderScreen> createState() => _ReaderScreenState();
}

class _ReaderScreenState extends State<ReaderScreen> {
  double _zoomLevel = 1.0; // Initial zoom level

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(widget.doc.doc_title!),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: SfPdfViewer.network(
                widget.doc.doc_url!,
                interactionMode: PdfInteractionMode.selection,
                initialZoomLevel: _zoomLevel,
              ),
            ),
          ),
          ListTile(
            title: Text(
              widget.doc.doc_title!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle:
                Text(widget.doc.genre ?? ''), // Display genre as a subtitle
            leading: widget.doc.coverImageAsset != null
                ? Image.asset(
                    widget.doc.coverImageAsset!,
                    width: 52,
                    height: 52,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    Icons.picture_as_pdf,
                    color: Colors.red,
                    size: 52,
                  ),
          ),
        ],
      ),
    );
  }
}
