import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';

typedef Future<List<T>> PageRequest<T> (int page, int pageSize);
typedef Widget WidgetAdapter<T>(T t);
typedef T Indexer<T>(int index);

class LoadingListView<T> extends StatefulWidget {

  final PageRequest<T> pageRequest;
  final WidgetAdapter<T> widgetAdapter;
  final int pageSize;
  final int pageThreshold;
  final bool reverse;
  final Indexer<T> indexer;

  LoadingListView(this.pageRequest, {
    this.pageSize: 50,
    this.pageThreshold:10,
    @required this.widgetAdapter,
    this.reverse: false,
    this.indexer
  });

  @override
  State<StatefulWidget> createState() {
    return  _LoadingListViewState();
  }
}

class _LoadingListViewState<T> extends State<LoadingListView<T>> {

  /// Contains all fetched elements ready to display!
  List<T> objects = [];

  @override
  Widget build(BuildContext context) {
    ListView listView = new ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: objects.length,
        reverse: widget.reverse
    );

    return listView;
  }


  Widget itemBuilder(BuildContext context, int index) {
    return widget.widgetAdapter != null ? widget.widgetAdapter(objects[index])
        : new Container();
  }

  Future loadNext() async {
    int page = (objects.length / widget.pageSize).floor();
    List<T> fetched = await widget.pageRequest(page, widget.pageSize);
    if(mounted) {
      this.setState(() {
        objects.addAll(fetched);
      });
    }
  }
}
